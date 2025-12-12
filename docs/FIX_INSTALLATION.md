# แก้ไขปัญหา npm run dev ไม่ขึ้น

## ปัญหาที่พบ
1. **Client ไม่ขึ้น**: `cross-env` ไม่พบ - ต้องติดตั้ง dependencies ใน client folder
2. **Server crash**: อาจเกิดจาก database connection error

## วิธีแก้ไข

### 1. แก้ไข PowerShell Execution Policy (ถ้าจำเป็น)

เปิด PowerShell **ในฐานะ Administrator** แล้วรัน:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

หรือใช้ Command Prompt แทน PowerShell

### 2. ติดตั้ง Client Dependencies

เปิด Command Prompt หรือ Terminal แล้วรัน:

```bash
cd client
npm install
cd ..
```

### 3. ตรวจสอบ Database Connection

1. ตรวจสอบว่า XAMPP MySQL กำลังทำงานอยู่
2. ตรวจสอบว่ามี database `sangsawang_furniture` หรือไม่
3. สร้างไฟล์ `.env` ใน root directory (ถ้ายังไม่มี):

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=
DB_NAME=sangsawang_furniture
JWT_SECRET=your-secret-key-change-this
PORT=7100
```

### 4. รันโปรเจกต์

```bash
npm run dev
```

หรือรันแยกกัน:

**Terminal 1 (Server):**
```bash
npm run server
```

**Terminal 2 (Client):**
```bash
npm run client
```

## สิ่งที่แก้ไขแล้ว

✅ เพิ่ม error handling ใน server.js สำหรับ database connection
✅ เพิ่ม warning messages เมื่อ database connection ล้มเหลว
✅ Server จะไม่ crash ทันที แต่จะแสดง warning แทน

## หมายเหตุ

- ถ้า server แสดง warning เกี่ยวกับ database connection ให้ตรวจสอบว่า MySQL/XAMPP กำลังทำงานอยู่
- ถ้า client ยังไม่ขึ้น ให้ตรวจสอบว่า `node_modules` ถูกสร้างใน `client` folder แล้ว


