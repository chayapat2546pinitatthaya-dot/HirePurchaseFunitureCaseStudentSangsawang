# ✅ Production Deployment Checklist

ตรวจสอบรายการก่อน Deploy ขึ้น Production Server

## 🔐 Security

- [ ] เปลี่ยน `JWT_SECRET` เป็นค่าที่ปลอดภัย (อย่างน้อย 32 characters)
- [ ] ตั้งค่า database password ที่แข็งแรง
- [ ] ตั้งค่า `NODE_ENV=production` ใน `.env`
- [ ] ตรวจสอบว่า `.env` ถูก ignore โดย Git
- [ ] เปิดใช้งาน HTTPS/SSL
- [ ] ตั้งค่า Security Headers (X-Frame-Options, CSP, etc.)
- [ ] ตั้งค่า Firewall (UFW หรือ iptables)
- [ ] ตรวจสอบ file permissions (ไม่ควรเป็น 777)
- [ ] ตั้งค่า SMTP credentials สำหรับส่งอีเมล

## 🗄️ Database

- [ ] สร้าง production database
- [ ] Import database schema และข้อมูล
- [ ] สร้าง database user แยก (ไม่ใช้ root)
- [ ] ตั้งค่า database backup เป็นประจำ
- [ ] ตรวจสอบ database indexes
- [ ] ทดสอบ database connection

## ⚙️ Configuration

- [ ] ตั้งค่า `.env` ให้ครบถ้วน
- [ ] ตั้งค่า `APP_BASE_URL` เป็น domain จริง
- [ ] ตั้งค่า SMTP สำหรับส่งอีเมล
- [ ] ตั้งค่า `LOG_LEVEL` เป็น `info` หรือ `warn` (ไม่ใช่ `debug`)
- [ ] ตรวจสอบ CORS settings

## 🏗️ Build & Deploy

- [ ] Build frontend: `cd client && npm run build`
- [ ] ตรวจสอบว่า `client/build` มีไฟล์ครบถ้วน
- [ ] ติดตั้ง production dependencies: `npm install --production`
- [ ] สร้างโฟลเดอร์ `logs/` และตั้งค่า permissions
- [ ] ทดสอบรัน server: `npm run start:prod`

## 🔄 Process Management

- [ ] ติดตั้ง PM2
- [ ] ตั้งค่า PM2 ecosystem config
- [ ] Start application ด้วย PM2
- [ ] ตั้งค่า PM2 startup script
- [ ] ทดสอบ restart: `pm2 restart sangsawang-furniture`

## 🌐 Web Server (Nginx)

- [ ] ติดตั้ง Nginx
- [ ] ตั้งค่า Nginx configuration
- [ ] ตั้งค่า SSL certificate
- [ ] ทดสอบ Nginx config: `nginx -t`
- [ ] รีโหลด Nginx: `systemctl reload nginx`
- [ ] ตรวจสอบ static file serving
- [ ] ตรวจสอบ API proxy

## 📊 Monitoring & Logging

- [ ] ตั้งค่า log rotation
- [ ] ตรวจสอบ PM2 logs
- [ ] ตรวจสอบ application logs
- [ ] ตั้งค่า monitoring (optional: PM2 Plus, New Relic, etc.)
- [ ] ทดสอบ health endpoint: `/api/health`
- [ ] ทดสอบ metrics endpoint: `/api/metrics`

## 🧪 Testing

- [ ] ทดสอบ API endpoints
- [ ] ทดสอบ frontend routes
- [ ] ทดสอบ authentication
- [ ] ทดสอบ file uploads
- [ ] ทดสอบ email sending
- [ ] ทดสอบ database operations
- [ ] ทดสอบ error handling

## 📱 Frontend

- [ ] ตรวจสอบว่า React app build สำเร็จ
- [ ] ทดสอบ responsive design
- [ ] ทดสอบ browser compatibility
- [ ] ตรวจสอบ static assets loading
- [ ] ทดสอบ API calls จาก frontend

## 🔍 Final Checks

- [ ] ทดสอบการเข้าถึงจาก browser
- [ ] ทดสอบการ login/logout
- [ ] ทดสอบการสร้าง order
- [ ] ทดสอบ admin functions
- [ ] ตรวจสอบ performance
- [ ] ตรวจสอบ error logs
- [ ] ทดสอบ backup และ restore

## 📝 Documentation

- [ ] อัปเดต README.md (ถ้าจำเป็น)
- [ ] บันทึก deployment steps
- [ ] บันทึก configuration values (เก็บไว้ในที่ปลอดภัย)
- [ ] สร้าง runbook สำหรับ operations

## 🚨 Post-Deployment

- [ ] ตรวจสอบ logs หลัง deploy
- [ ] Monitor error rates
- [ ] Monitor performance metrics
- [ ] ทดสอบ critical paths
- [ ] แจ้งทีมเกี่ยวกับ deployment
- [ ] ตั้งค่า alerts (optional)

---

**หมายเหตุ:** ตรวจสอบทุกรายการก่อน deploy เพื่อความมั่นใจว่า application ทำงานได้อย่างถูกต้องและปลอดภัย

