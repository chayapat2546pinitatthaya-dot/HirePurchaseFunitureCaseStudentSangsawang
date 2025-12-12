/**
 * Script สำหรับแก้ไขข้อมูล installment ใน database ให้ตรงกับเงื่อนไขที่กำหนด:
 * - ยอดชำระต้องตรงกับยอดรวม (ไม่ขาดหรือเกินเด็ดขาด)
 * - เดือนแรกถึงเดือนก่อนสุดท้าย: ปัดขึ้นเป็นหลักสิบ
 * - เดือนสุดท้าย: เก็บเศษที่เหลือ
 */

const mysql = require('mysql2/promise');
require('dotenv').config();

const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'sangsawang_furniture',
    charset: 'utf8mb4'
};

const INSTALLMENT_MIN_PERIODS = 2;
const INSTALLMENT_MAX_PERIODS = 12;

const getInstallmentRateByMonths = (months) => {
    const normalized = Number(months);
    if (!Number.isFinite(normalized) || normalized < INSTALLMENT_MIN_PERIODS) {
        return 0;
    }
    // 2 เดือน: 10%, 3-12 เดือน: เพิ่มขึ้นเรื่อยๆ จนถึง 12 เดือนที่ 20%
    if (normalized === INSTALLMENT_MIN_PERIODS) {
        return 0.1; // 2 เดือน = 10%
    }
    if (normalized >= INSTALLMENT_MAX_PERIODS) {
        return 0.2; // 12 เดือน = 20%
    }
    // 3-11 เดือน: คำนวณแบบ linear จาก 10% ถึง 20%
    return 0.1 + (normalized - INSTALLMENT_MIN_PERIODS) * (0.2 - 0.1) / (INSTALLMENT_MAX_PERIODS - INSTALLMENT_MIN_PERIODS);
};

const calculateInstallmentAmounts = (totalAmount, periods) => {
    const total = Number(totalAmount);
    const numPeriods = Number(periods);
    
    if (!Number.isFinite(total) || total <= 0 || !Number.isFinite(numPeriods) || numPeriods <= 0) {
        return [];
    }
    
    if (numPeriods === 1) {
        return [total];
    }
    
    // คำนวณจำนวนเงินต่อเดือนเฉลี่ย
    const averagePerMonth = total / numPeriods;
    
    // ปัดขึ้นเป็นหลักสิบ (ceil to nearest 10)
    const regularAmount = Math.ceil(averagePerMonth / 10) * 10;
    
    // เดือนแรกถึงเดือนก่อนสุดท้าย: ใช้ regularAmount
    const amounts = [];
    for (let i = 1; i < numPeriods; i++) {
        amounts.push(regularAmount);
    }
    
    // เดือนสุดท้าย: เก็บเศษที่เหลือ (เพื่อให้รวมเท่ากับ totalAmount พอดี)
    const regularTotal = regularAmount * (numPeriods - 1);
    const lastAmount = total - regularTotal;
    amounts.push(lastAmount);
    
    return amounts;
};

async function fixInstallmentData() {
    const connection = await mysql.createConnection(dbConfig);
    
    try {
        console.log('เริ่มต้นการแก้ไขข้อมูล installment...\n');
        
        // ดึง order ทั้งหมดที่มี installment_periods > 1
        const [orders] = await connection.execute(
            `SELECT o.order_id, o.total_amount, o.installment_periods, o.order_date, o.payment_method
             FROM \`order\` o
             WHERE o.installment_periods > 1
             ORDER BY o.order_id`
        );
        
        console.log(`พบ order ที่ต้องแก้ไข: ${orders.length} รายการ\n`);
        
        if (orders.length === 0) {
            console.log('ไม่พบข้อมูลที่ต้องแก้ไข');
            return;
        }
        
        let updatedCount = 0;
        let errorCount = 0;
        
        for (const order of orders) {
            try {
                const orderId = order.order_id;
                const periods = order.installment_periods;
                const orderDate = new Date(order.order_date);
                
                console.log(`\nกำลังแก้ไข Order ID: ${orderId}`);
                console.log(`  - จำนวนงวด: ${periods}`);
                console.log(`  - ยอดรวมเดิม: ${order.total_amount}`);
                
                // ดึง order_detail เพื่อคำนวณยอดรวมที่ถูกต้อง
                const [orderDetails] = await connection.execute(
                    `SELECT od.product_id, od.quantity, od.price, p.price_cash
                     FROM order_detail od
                     LEFT JOIN product p ON od.product_id = p.product_id
                     WHERE od.order_id = ?`,
                    [orderId]
                );
                
                if (orderDetails.length === 0) {
                    console.log(`  ⚠️  ไม่พบ order_detail สำหรับ order_id: ${orderId}`);
                    errorCount++;
                    continue;
                }
                
                // คำนวณยอดรวมเงินสด (ใช้ราคาเงินสดจาก product table เท่านั้น)
                // ไม่ใช้ราคาจาก order_detail เพราะอาจเป็นราคาผ่อนชำระ
                let cashTotal = 0;
                let hasMissingCashPrice = false;
                for (const detail of orderDetails) {
                    if (!detail.price_cash) {
                        console.log(`  ⚠️  Product ID ${detail.product_id} ไม่มีราคาเงินสด`);
                        hasMissingCashPrice = true;
                        // ถ้าไม่มีราคาเงินสด ให้ใช้ราคาจาก order_detail เป็นค่า fallback
                        cashTotal += detail.price * detail.quantity;
                    } else {
                        cashTotal += detail.price_cash * detail.quantity;
                    }
                }
                
                if (hasMissingCashPrice) {
                    console.log(`  ⚠️  บางสินค้าไม่มีราคาเงินสด ใช้ราคาจาก order_detail แทน`);
                }
                
                // คำนวณยอดรวมผ่อนชำระที่ถูกต้อง
                const rate = getInstallmentRateByMonths(periods);
                const correctTotalAmount = Math.round(cashTotal * (1 + rate));
                
                console.log(`  - ยอดรวมเงินสด: ${cashTotal}`);
                console.log(`  - อัตราดอกเบี้ย (${periods} เดือน): ${(rate * 100).toFixed(1)}%`);
                console.log(`  - ยอดรวมผ่อนชำระที่ถูกต้อง: ${correctTotalAmount}`);
                
                // คำนวณจำนวนเงินแต่ละงวด
                const installmentAmounts = calculateInstallmentAmounts(correctTotalAmount, periods);
                const monthlyPayment = installmentAmounts.length > 0 ? installmentAmounts[0] : correctTotalAmount;
                
                console.log(`  - จำนวนเงินแต่ละงวด:`, installmentAmounts);
                console.log(`  - ยอดรวมจากจำนวนเงินแต่ละงวด: ${installmentAmounts.reduce((a, b) => a + b, 0)}`);
                
                // ตรวจสอบว่ายอดรวมตรงกันหรือไม่
                const sumAmounts = installmentAmounts.reduce((a, b) => a + b, 0);
                if (Math.abs(sumAmounts - correctTotalAmount) > 0.01) {
                    console.log(`  ⚠️  ข้อผิดพลาด: ยอดรวมไม่ตรงกัน! (${sumAmounts} vs ${correctTotalAmount})`);
                }
                
                // เริ่ม transaction
                await connection.beginTransaction();
                
                try {
                    // อัปเดต total_amount และ monthly_payment ใน order table
                    await connection.execute(
                        `UPDATE \`order\` 
                         SET total_amount = ?, monthly_payment = ?
                         WHERE order_id = ?`,
                        [correctTotalAmount, monthlyPayment, orderId]
                    );
                    
                    // ลบ installment_payments เก่า
                    await connection.execute(
                        `DELETE FROM installment_payments WHERE order_id = ?`,
                        [orderId]
                    );
                    
                    // สร้าง installment_payments ใหม่
                    for (let i = 0; i < installmentAmounts.length; i++) {
                        const dueDate = new Date(orderDate);
                        dueDate.setMonth(dueDate.getMonth() + i + 1);
                        const dueDateStr = dueDate.toISOString().split('T')[0];
                        
                        await connection.execute(
                            `INSERT INTO installment_payments 
                             (order_id, installment_number, installment_amount, payment_due_date, payment_status) 
                             VALUES (?, ?, ?, ?, 'pending')`,
                            [orderId, i + 1, installmentAmounts[i], dueDateStr]
                        );
                    }
                    
                    await connection.commit();
                    console.log(`  ✅ แก้ไขสำเร็จ`);
                    updatedCount++;
                } catch (error) {
                    await connection.rollback();
                    throw error;
                }
                
            } catch (error) {
                console.error(`  ❌ เกิดข้อผิดพลาดในการแก้ไข Order ID ${order.order_id}:`, error.message);
                errorCount++;
            }
        }
        
        console.log(`\n\nสรุปผลการแก้ไข:`);
        console.log(`  - แก้ไขสำเร็จ: ${updatedCount} รายการ`);
        console.log(`  - เกิดข้อผิดพลาด: ${errorCount} รายการ`);
        
    } catch (error) {
        console.error('เกิดข้อผิดพลาด:', error);
    } finally {
        await connection.end();
    }
}

// รัน script
fixInstallmentData()
    .then(() => {
        console.log('\nเสร็จสิ้น');
        process.exit(0);
    })
    .catch((error) => {
        console.error('เกิดข้อผิดพลาด:', error);
        process.exit(1);
    });

