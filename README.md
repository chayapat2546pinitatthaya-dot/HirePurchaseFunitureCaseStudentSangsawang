# 🪑 Sangsawang Furniture Website

เว็บไซต์ขายเฟอร์นิเจอร์ออนไลน์ระบบผ่อนชำระ พัฒนาด้วย React + Node.js + Express + MySQL

> 📚 **โปรเจกต์จบการศึกษา (Senior Project)** - กรณีศึกษาร้านเฟอร์นิเจอร์แสงสว่าง

## 📑 สารบัญ

- [คุณสมบัติ](#-คุณสมบัติ)
- [ขั้นตอนการติดตั้ง](#-ขั้นตอนการติดตั้ง)
  - [Quick Start](#quick-start)
  - [ติดตั้งแบบละเอียด](#การติดตั้งแบบละเอียด)
- [Production Deployment](#-production-deployment)
- [ข้อมูลสำหรับทดสอบ](#-ข้อมูลสำหรับทดสอบ)
- [เอกสารเพิ่มเติม](#-เอกสารเพิ่มเติม)
- [เทคโนโลยีที่ใช้](#-เทคโนโลยีที่ใช้)
- [API Endpoints](#-api-endpoints)
- [Security Features](#-security-features)
- [Testing](#-testing)
- [Monitoring & Logging](#-monitoring--logging)
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

## 🚀 Production Deployment

โปรเจกต์นี้พร้อมสำหรับการ deploy ขึ้น production server แล้ว!

### Quick Deploy Guide

1. **Build Frontend:**
   ```bash
   cd client && npm run build && cd ..
   ```

2. **ตั้งค่า Environment Variables:**
   ```bash
   cp .env.example .env
   # แก้ไข .env ตาม production settings
   ```

3. **Start with PM2:**
   ```bash
   pm2 start ecosystem.config.js --env production
   ```

4. **ตั้งค่า Nginx:**
   - ดูตัวอย่างใน `nginx.example.conf`
   - แก้ไข domain และ paths
   - รีโหลด Nginx

### 📚 เอกสารเพิ่มเติม

- **[DEPLOYMENT.md](DEPLOYMENT.md)** - คู่มือการ Deploy แบบละเอียด
- **[PRODUCTION_CHECKLIST.md](PRODUCTION_CHECKLIST.md)** - Checklist ก่อน Deploy

### Production Features

- ✅ Environment Variables Support (.env)
- ✅ Production Build Scripts
- ✅ PM2 Process Management
- ✅ Nginx Configuration Example
- ✅ Security Headers
- ✅ Static File Serving
- ✅ Logging System
- ✅ Health Check Endpoints
- ✅ Graceful Shutdown

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

โปรเจกต์นี้รองรับการตั้งค่าผ่าน **Environment Variables (.env)** หรือ **config.json**

#### วิธีที่ 1: ใช้ Environment Variables (แนะนำสำหรับ Production)

1. คัดลอกไฟล์ตัวอย่าง:
```bash
copy .env.example .env
```

2. แก้ไขไฟล์ `.env` ตามความต้องการของคุณ:

```env
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=sangsawang_furniture

# JWT Secret Key
JWT_SECRET=your-super-secret-jwt-key-change-this-in-production

# Server Configuration
SERVER_PORT=7100
NODE_ENV=development

# SMTP Configuration
SMTP_HOST=
SMTP_PORT=587
SMTP_USER=
SMTP_PASSWORD=
SMTP_SECURE=false
SMTP_FROM=

# Application Configuration
APP_BASE_URL=http://localhost:3001
EMAIL_VERIFICATION_TTL_MINUTES=15
EMAIL_OTP_LENGTH=6

# Logging Configuration
LOG_LEVEL=info
LOG_FILE=logs/app.log
```

#### วิธีที่ 2: ใช้ config.json (เหมาะสำหรับการศึกษา)

1. คัดลอกไฟล์ตัวอย่าง:
```bash
copy config.example.json config.json
```

2. แก้ไขไฟล์ `config.json` ตามความต้องการของคุณ (ดูตัวอย่างในไฟล์ `config.example.json`)

> 💡 **หมายเหตุ:** 
> - Environment Variables (.env) จะมีลำดับความสำคัญสูงกว่า config.json
> - ไฟล์ `.env` จะถูก ignore โดย Git (ปลอดภัยกว่า)
> - สำหรับการศึกษา: ใช้ config.json ได้เลย
> - สำหรับ Production: แนะนำให้ใช้ .env เพื่อความปลอดภัย

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
- React Testing Library (สำหรับ testing)

### Backend
- Node.js
- Express.js
- MySQL2 (Promise-based)
- bcryptjs (เข้ารหัสรหัสผ่าน)
- JSON Web Token (JWT)
- Nodemailer (ส่งอีเมล)
- Multer (อัปโหลดไฟล์)
- dotenv (จัดการ environment variables)
- Jest & Supertest (สำหรับ testing)

### Database
- MySQL

### Development Tools
- Nodemon (auto-reload)
- Concurrently (รัน frontend และ backend พร้อมกัน)
- Jest (testing framework)

## 📝 API Endpoints

### System
- `GET /api/health` - Health check endpoint (แสดงสถานะ server, database, uptime)
- `GET /api/test-db` - Test database connection
- `GET /api/metrics` - Metrics endpoint (Admin only, แสดงสถิติระบบ)

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

## 🧪 Testing

โปรเจกต์นี้มีระบบทดสอบครบถ้วน:

### Backend Tests
```bash
# รัน tests ทั้งหมด
npm test

# รัน tests แบบ watch mode
npm run test:watch

# รัน tests พร้อม coverage report
npm run test:coverage
```

### Frontend Tests
```bash
cd client
npm test
```

### Test Structure
- `__tests__/` - Backend unit tests และ integration tests
- `client/src/__tests__/` - Frontend component tests
- Coverage reports จะถูกสร้างในโฟลเดอร์ `coverage/`

## 📊 Monitoring & Logging

### Logging System
- Logs จะถูกบันทึกในไฟล์ `logs/app.log`
- รองรับ log levels: `error`, `warn`, `info`, `debug`
- ตั้งค่า log level ได้ผ่าน `LOG_LEVEL` ใน `.env`

### Health Check
```bash
# ตรวจสอบสถานะระบบ
curl http://localhost:7100/api/health
```

### Metrics Endpoint
```bash
# ดูสถิติระบบ (ต้อง login เป็น Admin)
curl -H "Authorization: Bearer YOUR_ADMIN_TOKEN" http://localhost:7100/api/metrics
```

## 🐛 Troubleshooting

### ปัญหา: ไม่สามารถเชื่อมต่อฐานข้อมูลได้
- ตรวจสอบว่า MySQL กำลังรันอยู่
- ตรวจสอบ database configuration ในไฟล์ `.env` หรือ `config.json`
- ตรวจสอบ logs ใน `logs/app.log`

### ปัญหา: Port 7100 ถูกใช้แล้ว
- เปลี่ยน port ในไฟล์ `.env` (`SERVER_PORT`) หรือ `config.json`

### ปัญหา: npm install error
- ลบ node_modules และ package-lock.json
- รัน `npm install` ใหม่

### ปัญหา: Tests ไม่ผ่าน
- ตรวจสอบว่า database ถูกตั้งค่าถูกต้อง
- สำหรับ integration tests ต้องมี test database

## 📚 เอกสารเพิ่มเติม

### Environment Variables
โปรเจกต์รองรับการตั้งค่าผ่าน environment variables (.env) หรือ config.json
- `.env.example` - ตัวอย่างไฟล์ configuration
- `src/config.js` - โค้ดที่จัดการการโหลด configuration

### Logging
- Logs ถูกบันทึกใน `logs/app.log`
- ตั้งค่า log level ได้ผ่าน `LOG_LEVEL` environment variable
- รองรับ levels: `error`, `warn`, `info`, `debug`

### Testing
- Backend tests: `npm test`
- Frontend tests: `cd client && npm test`
- Coverage reports: `npm run test:coverage`

### Monitoring
- Health check: `GET /api/health`
- Metrics: `GET /api/metrics` (Admin only)

## 📄 License

MIT License

> 💡 **โปรเจกต์นี้เป็น Open Source สำหรับการศึกษา** - ทุกคนสามารถศึกษา, แก้ไข, และพัฒนาต่อยอดได้

## 👨‍💻 ผู้จัดทำ (Authors)

**โปรเจกต์จบการศึกษา (Senior Project)**

### 👤 นักศึกษาผู้พัฒนา

**ผู้พัฒนา 1:**
- **ชื่อ-นามสกุล:** Chayapat Pinitatthaya
- **รหัสนักศึกษา:** 1650704453
- **สาขาวิชา:** Computer Science
- **มหาวิทยาลัย:** Bangkok University
- **ปีการศึกษา:** 2568

**ผู้พัฒนา 2:**
- **ชื่อ-นามสกุล:** Tanasab Rattaree
- **รหัสนักศึกษา:** 1650704545
- **สาขาวิชา:** Computer Science
- **มหาวิทยาลัย:** Bangkok University
- **ปีการศึกษา:** 2568

### 🏪 กรณีศึกษา

**ร้านเฟอร์นิเจอร์แสงสว่าง (Sangsawang Furniture)**  
เจ้าของร้าน: Tanasab Rattaree

**ระบบ:** เว็บไซต์ขายเฟอร์นิเจอร์ออนไลน์ระบบผ่อนชำระ

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

