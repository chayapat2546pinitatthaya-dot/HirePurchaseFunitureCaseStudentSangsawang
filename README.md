# 🪑 Sangsawang Furniture Website

เว็บไซต์ขายเฟอร์นิเจอร์ออนไลน์ระบบผ่อนชำระ พัฒนาด้วย React + Node.js + Express + MySQL

## 📑 สารบัญ

- [คุณสมบัติ](#-คุณสมบัติ)
- [ขั้นตอนการติดตั้ง](#-ขั้นตอนการติดตั้ง)
  - [Quick Start](#quick-start)
  - [ติดตั้งแบบละเอียด](#การติดตั้งแบบละเอียด)
- [ข้อมูลสำหรับทดสอบ](#-ข้อมูลสำหรับทดสอบ)
- [เอกสารเพิ่มเติม](#-เอกสารเพิ่มเติม)
- [เทคโนโลยีที่ใช้](#-เทคโนโลยีที่ใช้)
- [API Endpoints](#-api-endpoints)
- [Security Features](#-security-features)
- [Troubleshooting](#-troubleshooting)

---

> 💡 **เพิ่งเริ่มต้น?** ดู [Quick Start](#quick-start) สำหรับคู่มือเริ่มต้นใช้งานเร็วภายใน 5 นาที!

## 📋 คุณสมบัติ

### สำหรับลูกค้า
- ✅ หน้าแรกแสดงสินค้าแนะนำ
- ✅ ดูสินค้าทั้งหมด พร้อมระบบค้นหาและกรองตามหมวดหมู่
- ✅ ดูรายละเอียดสินค้า (พร้อมรูปภาพหลายรูป)
- ✅ ตะกร้าสินค้า (เก็บข้อมูลถาวรในฐานข้อมูล)
- ✅ สมัครสมาชิก / เข้าสู่ระบบ
- ✅ ยืนยันอีเมลด้วย OTP
- ✅ จัดการข้อมูลส่วนตัว (ที่อยู่หลักและที่อยู่สำรอง)
- ✅ เปลี่ยนรหัสผ่าน
- ✅ รีเซ็ตรหัสผ่าน (Forgot Password)
- ✅ ดูคำสั่งซื้อและรายละเอียดคำสั่งซื้อ
- ✅ ระบบผ่อนชำระ (2-12 เดือน) พร้อมคำนวณดอกเบี้ยอัตโนมัติ
- ✅ Top Bar แสดงข้อมูลติดต่อและลิงก์โซเชียลมีเดีย
- ✅ QR Code สำหรับ Line และ Facebook
- ✅ Responsive Design รองรับทุกอุปกรณ์

### สำหรับแอดมิน
- ✅ แดชบอร์ดแสดงสถิติ (คำสั่งซื้อ, ลูกค้า, การชำระเงิน)
- ✅ ระบบแจ้งเตือน (Notification Bell)
- ✅ จัดการสินค้า (เพิ่ม/แก้ไข/ลบ/อัปโหลดรูปภาพ)
- ✅ จัดการหมวดหมู่สินค้า
- ✅ อนุมัติ/ไม่อนุมัติคำสั่งซื้อ
- ✅ ดูคำสั่งซื้อทั้งหมดพร้อมสถานะ
- ✅ จัดการสถานะคำสั่งซื้อ (pending, approved, awaiting_payment, waiting_for_delivery, completed, cancelled)
- ✅ ดูรายชื่อลูกค้าทั้งหมดและรายละเอียดลูกค้า
- ✅ จัดการการชำระเงินผ่อนชำระ (ทำเครื่องหมายว่าชำระแล้ว)
- ✅ หน้าแจ้งเตือนการชำระเงิน (แสดงรายการที่ต้องชำระใน 5 วันข้างหน้า)
- ✅ ระบบส่งอีเมลแจ้งเตือน (SMTP)

## 🚀 ขั้นตอนการติดตั้ง

### Quick Start

```bash
# 1. ติดตั้ง dependencies
npm install
cd client && npm install && cd ..

# 2. Import database
mysql -u root -p sangsawang_furniture < database/sangsawang_furniture.sql

# 3. ตั้งค่า config.json
copy config.example.json config.json
# แก้ไข config.json ตามความต้องการของคุณ

# 4. รันโปรเจกต์
npm run dev
```

เปิด http://localhost:3001 ในเว็บเบราว์เซอร์

---

### การติดตั้งแบบละเอียด

### 1. ติดตั้ง Prerequisites
- Node.js (v16 หรือสูงกว่า)
- MySQL (5.7 หรือสูงกว่า) หรือ XAMPP/WAMP
- npm หรือ yarn

### 2. Clone หรือดาวน์โหลดโปรเจกต์

```bash
cd sangsawang-furniture
```

### 3. ติดตั้ง Dependencies

```bash
# ติดตั้ง Backend dependencies
npm install

# ติดตั้ง Frontend dependencies
cd client
npm install
cd ..
```

### 4. ตั้งค่าฐานข้อมูล

1. เปิด MySQL (หรือ XAMPP/WAMP)
2. สร้าง database ชื่อ `sangsawang_furniture`
3. Import ไฟล์ SQL:

```bash
mysql -u root -p sangsawang_furniture < database/sangsawang_furniture.sql
```

หรือใช้ phpMyAdmin: เลือก database แล้ว import ไฟล์ `database/sangsawang_furniture.sql`

### 4.1 ปรับชนิดข้อมูลให้ถูกต้อง (แนะนำให้รันหากมีข้อมูลเดิม)

สคริปต์ `database/scripts/fix_database_types.js` จะช่วยแปลงค่าที่เป็น Text ให้กลายเป็น `DATE/DATETIME/DECIMAL/INT` ที่ระบบคาดหวัง พร้อมจัดรูปแบบวันที่อัตโนมัติ

```bash
node database/scripts/fix_database_types.js
```

> 📝 สคริปต์จะใช้ค่าการเชื่อมต่อจากไฟล์ `config.json` (ถ้าไม่มีจะใช้ค่าเริ่มต้นของ XAMPP: `root`/ค่าว่าง)

### 5. ตั้งค่า Configuration

1. คัดลอกไฟล์ตัวอย่าง (ถ้ายังไม่มี `config.json`):
```bash
copy config.example.json config.json
```

2. แก้ไขไฟล์ `config.json` ใน root directory ตามความต้องการของคุณ:

```json
{
  "database": {
    "host": "localhost",
    "user": "root",
    "password": "your_password",
    "database": "sangsawang_furniture"
  },
  "jwt": {
    "secret": "your-super-secret-jwt-key-change-this-in-production"
  },
  "server": {
    "port": 7100
  },
  "smtp": {
    "host": "",
    "port": 587,
    "user": "",
    "password": "",
    "secure": false,
    "from": ""
  },
  "app": {
    "baseUrl": "http://localhost:3001",
    "emailVerificationTtlMinutes": 15,
    "emailOtpLength": 6
  }
}
```

> 💡 **หมายเหตุ:** 
> - ไฟล์ `config.json` สามารถอัพขึ้น GitHub ได้โดยไม่ต้องซ่อน (เหมาะสำหรับการศึกษา)
> - สำหรับการศึกษา: ค่า default ที่มีอยู่ใช้ได้เลย
> - สำหรับ Production จริง: ควรเปลี่ยน JWT secret และรหัสผ่านฐานข้อมูลให้ปลอดภัย

### 6. รันโปรเจกต์

**Option 1: รัน Backend และ Frontend พร้อมกัน**
```bash
npm run dev
```

**Option 2: รันแยกกัน**

Terminal 1 (Backend):
```bash
npm run server
```

Terminal 2 (Frontend):
```bash
npm run client
```

### 7. เปิดเว็บเบราว์เซอร์

- Frontend: http://localhost:3001
- Backend API: http://localhost:7100

## 🔐 ข้อมูลสำหรับทดสอบ

### ลูกค้า (Customer)
- Username: `customer1`
- Password: `customer123`

### แอดมิน (Admin)
- Username: `admin`
- Password: `admin123`

## 📁 โครงสร้างโปรเจกต์

```
sangsawang-furniture/
├── client/                 # Frontend (React)
│   ├── public/
│   ├── src/
│   │   ├── components/     # React components
│   │   │   ├── TopBar.js   # Top bar with contact info and social links
│   │   │   ├── Navbar.js   # Navigation bar
│   │   │   ├── Footer.js   # Footer component
│   │   │   ├── NotificationBell.js  # Notification bell for admin
│   │   │   └── AdminHeader.js  # Admin header component
│   │   ├── pages/          # Pages
│   │   │   ├── Home.js
│   │   │   ├── Products.js
│   │   │   ├── ProductDetail.js
│   │   │   ├── Cart.js
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── Profile.js
│   │   │   ├── Orders.js
│   │   │   ├── OrderDetail.js
│   │   │   ├── ForgotPassword.js
│   │   │   ├── ResetPassword.js
│   │   │   ├── VerifyEmail.js
│   │   │   └── admin/      # Admin pages
│   │   │       ├── AdminDashboard.js
│   │   │       ├── AdminProducts.js
│   │   │       ├── AdminOrders.js
│   │   │       ├── AdminCustomers.js
│   │   │       └── AdminPaymentConfirmation.js
│   │   ├── utils/          # Utility functions
│   │   │   └── cartApi.js
│   │   ├── App.js          # Main App Component (Routing)
│   │   └── index.js        # React Entry Point
│   └── package.json
├── src/
│   └── server.js           # Backend server (Express + MySQL)
├── database/
│   ├── sangsawang_furniture.sql  # Database dump
│   └── scripts/            # Database utility scripts
│       ├── fix_database_types.js
│       ├── migrate_database.js
│       ├── setup_categories.js
│       └── ... (scripts อื่นๆ)
├── scripts/                # Utility scripts
│   ├── cleanup_orders.js
│   ├── register_customers.js
│   └── ... (scripts อื่นๆ)
├── images/                 # Product images storage
├── config.json             # Configuration file (database, JWT, SMTP, etc.)
├── package.json
└── README.md
```

## 🛠️ เทคโนโลยีที่ใช้

### Frontend
- React 18
- React Router 6
- Bootstrap 5
- React Bootstrap
- Axios

### Backend
- Node.js
- Express.js
- MySQL2 (Promise-based)
- bcryptjs (เข้ารหัสรหัสผ่าน)
- JSON Web Token (JWT)
- Nodemailer (ส่งอีเมล)
- Multer (อัปโหลดไฟล์)

### Database
- MySQL

## 📝 API Endpoints

### System
- `GET /api/health` - Health check endpoint
- `GET /api/test-db` - Test database connection

### Customer
- `POST /api/customer/register` - สมัครสมาชิก
- `POST /api/customer/login` - เข้าสู่ระบบ
- `POST /api/customer/verify-email` - ยืนยันอีเมลด้วย OTP
- `POST /api/customer/resend-verification` - ส่ง OTP ยืนยันอีเมลใหม่
- `GET /api/customer/profile` - ดูข้อมูลส่วนตัว (Auth required)
- `PUT /api/customer/profile` - แก้ไขข้อมูลส่วนตัว (Auth required)
- `PUT /api/customer/password` - เปลี่ยนรหัสผ่าน (Auth required)
- `POST /api/customer/forgot-password` - รีเซ็ตรหัสผ่าน (ใช้ email + username)
- `POST /api/customer/reset-password` - รีเซ็ตรหัสผ่านด้วย token
- `GET /api/customer/orders` - ดูคำสั่งซื้อของตัวเอง (Auth required)

### Cart
- `GET /api/cart` - ดูตะกร้าสินค้า (Auth required)
- `PUT /api/cart/items` - เพิ่ม/แก้ไขสินค้าในตะกร้า (Auth required)
- `DELETE /api/cart/items` - ลบสินค้าออกจากตะกร้า (Auth required)
- `DELETE /api/cart` - ล้างตะกร้าทั้งหมด (Auth required)

### Product
- `GET /api/products` - ดูสินค้าทั้งหมด
- `GET /api/products/:id` - ดูสินค้า 1 รายการ
- `POST /api/products` - เพิ่มสินค้า (Admin only)
- `PUT /api/products/:id` - แก้ไขสินค้า (Admin only)
- `DELETE /api/products/:id` - ลบสินค้า (Admin only)
- `GET /api/categories` - ดูหมวดหมู่สินค้าทั้งหมด
- `POST /api/upload` - อัปโหลดรูปภาพสินค้า (Admin only)

### Order
- `GET /api/orders` - ดูคำสั่งซื้อทั้งหมด (Admin only)
- `GET /api/orders/:id` - ดูรายละเอียดคำสั่งซื้อ (Auth required)
- `POST /api/orders` - สร้างคำสั่งซื้อ (Auth required)
- `PUT /api/orders/approve/:id` - อนุมัติคำสั่งซื้อ (Admin only)
- `PUT /api/orders/reject/:id` - ไม่อนุมัติคำสั่งซื้อ (Admin only)
- `PUT /api/orders/:id/status` - เปลี่ยนสถานะคำสั่งซื้อ (Admin only)
- `PUT /api/orders/cancel/:id` - ยกเลิกคำสั่งซื้อ (Auth required)
- `PUT /api/orders/:orderId/installments/:installmentId/mark-paid` - ทำเครื่องหมายว่าชำระเงินแล้ว (Admin only)

### Admin
- `POST /api/admin/login` - เข้าสู่ระบบแอดมิน
- `POST /api/admin/register` - สมัครสมาชิกแอดมิน
- `GET /api/admin/notification-summary` - สรุปการแจ้งเตือน (Admin only)
- `GET /api/admin/customers` - ดูรายชื่อลูกค้าทั้งหมด (Admin only)
- `GET /api/admin/customers/:id` - ดูรายละเอียดลูกค้า (Admin only)
- `GET /api/admin/payment-confirmations` - ดูรายการรอยืนยันการชำระเงิน (Admin only)

## 🔒 Security Features

- Password hashing with bcrypt
- JWT authentication
- SQL injection prevention
- CORS configuration
- Role-based access control

## 📱 Responsive Design

เว็บไซต์รองรับการใช้งานบน:
- Desktop
- Tablet
- Mobile

### UI Components
- **TopBar**: แสดงข้อมูลติดต่อ (โทรศัพท์, อีเมล) และลิงก์โซเชียลมีเดีย (Facebook, Line) พร้อม QR Code dropdown
- **Navbar**: Navigation bar พร้อมเมนูและตะกร้าสินค้า
- **Footer**: Footer พร้อมข้อมูลติดต่อและลิงก์โซเชียลมีเดีย

## 🐛 Troubleshooting

### ปัญหา: ไม่สามารถเชื่อมต่อฐานข้อมูลได้
- ตรวจสอบว่า MySQL กำลังรันอยู่
- ตรวจสอบ database configuration ในไฟล์ config.json

### ปัญหา: Port 7100 ถูกใช้แล้ว
- เปลี่ยน port ในไฟล์ config.json (ในส่วน server.port)

### ปัญหา: npm install error
- ลบ node_modules และ package-lock.json
- รัน `npm install` ใหม่

## 📚 เอกสารเพิ่มเติม

> 📝 **หมายเหตุ:** เอกสารเพิ่มเติมจะถูกเพิ่มในอนาคต
>
> สำหรับตอนนี้ สามารถดูข้อมูลทั้งหมดได้ใน README.md นี้

## 📄 License

MIT License

> 💡 **โปรเจกต์นี้เป็น Open Source สำหรับการศึกษา** - ทุกคนสามารถศึกษา, แก้ไข, และพัฒนาต่อยอดได้

## 👨‍💻 Author

Developed for Sangsawang Furniture

## 🎓 สำหรับการศึกษา

โปรเจกต์นี้เหมาะสำหรับ:
- ✅ ศึกษา React + Node.js + Express + MySQL
- ✅ เรียนรู้การสร้าง E-commerce Website
- ✅ ศึกษาระบบผ่อนชำระ (Installment System)
- ✅ เรียนรู้ Authentication & Authorization
- ✅ ศึกษา RESTful API Design
- ✅ เรียนรู้ Database Design และ Relationships

**หมายเหตุ:** ค่า configuration ที่มีอยู่เป็นค่า default สำหรับการศึกษา ใช้ได้เลยโดยไม่ต้องเปลี่ยน

## 🙏 Credit

- Bootstrap Icons
- Unsplash Images

## 📞 Support

หากพบปัญหาหรือต้องการความช่วยเหลือ:
1. ตรวจสอบ [Troubleshooting](#-troubleshooting)
2. อ่าน [ขั้นตอนการติดตั้ง](#-ขั้นตอนการติดตั้ง) ใน README.md
3. ดู error logs ใน Console
4. ตรวจสอบว่า MySQL/XAMPP กำลังรันอยู่
5. ตรวจสอบว่า port 7100 และ 3001 ไม่ถูกใช้งานโดยโปรแกรมอื่น

