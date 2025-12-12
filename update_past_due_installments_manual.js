/**
 * Script สำหรับอัปเดต installment_payments ที่ due_date ผ่านมาแล้วให้เป็นชำระแล้ว
 * โดยอัปเดตทุก installment ที่ due_date น้อยกว่าวันที่ปัจจุบัน (ไม่สนใจ order_status)
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

async function updatePastDueInstallments() {
    const connection = await mysql.createConnection(dbConfig);
    
    try {
        console.log('เริ่มต้นการอัปเดต installment ที่ due_date ผ่านมาแล้ว...\n');
        
        // ดึงวันที่ปัจจุบันจาก MySQL
        const [dateRows] = await connection.execute('SELECT CURDATE() as today');
        const todayStr = dateRows[0].today.toISOString().split('T')[0];
        
        console.log(`วันที่วันนี้ (จาก MySQL): ${todayStr}\n`);
        
        // หา installment_payments ที่ due_date ผ่านมาแล้วและยังไม่ชำระ
        // ไม่สนใจ order_status เพื่อให้อัปเดตได้ทุก order ที่อนุมัติแล้ว
        const [installments] = await connection.execute(
            `SELECT ip.installment_id, ip.order_id, ip.installment_number, 
                    ip.payment_due_date, ip.payment_status, ip.payment_date,
                    o.order_status
             FROM installment_payments ip
             INNER JOIN \`order\` o ON ip.order_id = o.order_id
             WHERE ip.payment_due_date < CURDATE()
               AND ip.payment_status != 'paid'
               AND o.order_status IN ('approved', 'awaiting_payment', 'waiting_for_delivery', 'completed')
             ORDER BY ip.order_id, ip.installment_number`,
            []
        );
        
        console.log(`พบ installment ที่ due_date ผ่านมาแล้ว: ${installments.length} รายการ\n`);
        
        // ถ้าไม่พบ ให้ลองหาทุก installment ที่ due_date เป็นวันที่ในอดีต (ไม่สนใจ order_status)
        if (installments.length === 0) {
            console.log('กำลังค้นหา installment ที่ due_date เป็นวันที่ในอดีต (ไม่สนใจ order_status)...\n');
            
            const [allPastDue] = await connection.execute(
                `SELECT ip.installment_id, ip.order_id, ip.installment_number, 
                        ip.payment_due_date, ip.payment_status, ip.payment_date,
                        o.order_status
                 FROM installment_payments ip
                 INNER JOIN \`order\` o ON ip.order_id = o.order_id
                 WHERE ip.payment_due_date < CURDATE()
                   AND ip.payment_status != 'paid'
                 ORDER BY ip.order_id, ip.installment_number
                 LIMIT 100`,
                []
            );
            
            console.log(`พบ installment ที่ due_date ผ่านมาแล้ว (ทั้งหมด): ${allPastDue.length} รายการ\n`);
            
            if (allPastDue.length === 0) {
                console.log('ไม่พบข้อมูลที่ต้องอัปเดต');
                console.log('\nหมายเหตุ: ตรวจสอบว่า due_date ใน database เป็นวันที่ในอดีตหรือไม่');
                return;
            }
            
            // แสดงตัวอย่าง
            console.log('ตัวอย่างข้อมูลที่พบ:');
            allPastDue.slice(0, 5).forEach(inst => {
                console.log(`  Order #${inst.order_id} | งวดที่ ${inst.installment_number} | Due: ${inst.payment_due_date} | Status: ${inst.order_status}`);
            });
            
            // อัปเดตทุก installment ที่ due_date ผ่านมาแล้ว
            console.log(`\nกำลังอัปเดต ${allPastDue.length} รายการ...\n`);
            
            // อัปเดตทุก installment ที่ due_date ผ่านมาแล้ว
            let updatedCount = 0;
            let errorCount = 0;
            
            await connection.beginTransaction();
            
            try {
                for (const installment of allPastDue) {
                    try {
                        // ใช้ due_date เป็น payment_date
                        const paymentDate = installment.payment_due_date;
                        
                        await connection.execute(
                            `UPDATE installment_payments 
                             SET payment_status = 'paid', 
                                 payment_date = ?
                             WHERE installment_id = ?`,
                            [paymentDate, installment.installment_id]
                        );
                        
                        console.log(`✅ อัปเดต Order #${installment.order_id} งวดที่ ${installment.installment_number} (due_date: ${installment.payment_due_date})`);
                        updatedCount++;
                    } catch (error) {
                        console.error(`❌ เกิดข้อผิดพลาดในการอัปเดต Order #${installment.order_id} งวดที่ ${installment.installment_number}:`, error.message);
                        errorCount++;
                    }
                }
                
                await connection.commit();
                
                console.log(`\n\nสรุปผลการอัปเดต:`);
                console.log(`  - อัปเดตสำเร็จ: ${updatedCount} รายการ`);
                console.log(`  - เกิดข้อผิดพลาด: ${errorCount} รายการ`);
                
            } catch (error) {
                await connection.rollback();
                throw error;
            }
            
            return;
        }
        
        // อัปเดต installment ที่พบ
        let updatedCount = 0;
        let errorCount = 0;
        
        await connection.beginTransaction();
        
        try {
            for (const installment of installments) {
                try {
                    // ใช้ due_date เป็น payment_date
                    const paymentDate = installment.payment_due_date;
                    
                    await connection.execute(
                        `UPDATE installment_payments 
                         SET payment_status = 'paid', 
                             payment_date = ?
                         WHERE installment_id = ?`,
                        [paymentDate, installment.installment_id]
                    );
                    
                    console.log(`✅ อัปเดต Order #${installment.order_id} งวดที่ ${installment.installment_number} (due_date: ${installment.payment_due_date})`);
                    updatedCount++;
                } catch (error) {
                    console.error(`❌ เกิดข้อผิดพลาดในการอัปเดต Order #${installment.order_id} งวดที่ ${installment.installment_number}:`, error.message);
                    errorCount++;
                }
            }
            
            await connection.commit();
            
            console.log(`\n\nสรุปผลการอัปเดต:`);
            console.log(`  - อัปเดตสำเร็จ: ${updatedCount} รายการ`);
            console.log(`  - เกิดข้อผิดพลาด: ${errorCount} รายการ`);
            
        } catch (error) {
            await connection.rollback();
            throw error;
        }
        
    } catch (error) {
        console.error('เกิดข้อผิดพลาด:', error);
    } finally {
        await connection.end();
    }
}

// รัน script
updatePastDueInstallments()
    .then(() => {
        console.log('\nเสร็จสิ้น');
        process.exit(0);
    })
    .catch((error) => {
        console.error('เกิดข้อผิดพลาด:', error);
        process.exit(1);
    });

