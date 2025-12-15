# 🚀 Production Deployment Guide

คู่มือการ Deploy โปรเจกต์ Sangsawang Furniture ขึ้น Production Server

## 📋 Prerequisites

- Server ที่มี:
  - Node.js (v16 หรือสูงกว่า)
  - MySQL (5.7 หรือสูงกว่า)
  - Nginx หรือ Apache (แนะนำ Nginx)
  - PM2 (สำหรับจัดการ Node.js process)
  - SSL Certificate (สำหรับ HTTPS)

## 🔧 ขั้นตอนการ Deploy

### 1. เตรียม Server

```bash
# อัปเดตระบบ
sudo apt update && sudo apt upgrade -y

# ติดตั้ง Node.js (ถ้ายังไม่มี)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# ติดตั้ง PM2
sudo npm install -g pm2

# ติดตั้ง MySQL (ถ้ายังไม่มี)
sudo apt install mysql-server -y

# ติดตั้ง Nginx (ถ้ายังไม่มี)
sudo apt install nginx -y
```

### 2. Clone หรือ Upload โปรเจกต์

```bash
# Clone จาก Git
git clone https://github.com/yourusername/sangsawang-furniture.git
cd sangsawang-furniture

# หรือ Upload ไฟล์ผ่าน SFTP/SCP
```

### 3. ติดตั้ง Dependencies

```bash
# ติดตั้ง backend dependencies
npm install --production

# Build frontend
cd client
npm install
npm run build
cd ..
```

### 4. ตั้งค่าฐานข้อมูล

```bash
# สร้าง database
mysql -u root -p
CREATE DATABASE sangsawang_furniture CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EXIT;

# Import database
mysql -u root -p sangsawang_furniture < database/sangsawang_furniture.sql
```

### 5. ตั้งค่า Environment Variables

```bash
# สร้างไฟล์ .env
cp .env.example .env
nano .env
```

แก้ไขค่าตามนี้:

```env
# Database Configuration
DB_HOST=localhost
DB_USER=your_db_user
DB_PASSWORD=your_secure_password
DB_NAME=sangsawang_furniture

# JWT Secret (เปลี่ยนเป็นค่าที่ปลอดภัย!)
JWT_SECRET=your-super-secret-jwt-key-minimum-32-characters-long

# Server Configuration
SERVER_PORT=7100
NODE_ENV=production

# SMTP Configuration (สำหรับส่งอีเมล)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_SECURE=false
SMTP_FROM=Sangsawang Furniture <your-email@gmail.com>

# Application Configuration
APP_BASE_URL=https://yourdomain.com
EMAIL_VERIFICATION_TTL_MINUTES=15
EMAIL_OTP_LENGTH=6

# Logging Configuration
LOG_LEVEL=info
LOG_FILE=logs/app.log

# CORS (ถ้าจำเป็น)
CORS_ORIGIN=https://yourdomain.com
```

### 6. สร้างโฟลเดอร์ Logs

```bash
mkdir -p logs
chmod 755 logs
```

### 7. ทดสอบการรัน

```bash
# ทดสอบรัน server
npm run start:prod

# ตรวจสอบว่า server ทำงาน
curl http://localhost:7100/api/health
```

### 8. ตั้งค่า PM2

```bash
# Start ด้วย PM2
pm2 start ecosystem.config.js --env production

# ตั้งค่าให้รันอัตโนมัติเมื่อ server restart
pm2 startup
pm2 save

# ตรวจสอบสถานะ
pm2 status
pm2 logs
```

### 9. ตั้งค่า Nginx

```bash
# คัดลอกไฟล์ configuration
sudo cp nginx.example.conf /etc/nginx/sites-available/sangsawang-furniture

# แก้ไขไฟล์
sudo nano /etc/nginx/sites-available/sangsawang-furniture

# สร้าง symbolic link
sudo ln -s /etc/nginx/sites-available/sangsawang-furniture /etc/nginx/sites-enabled/

# ทดสอบ configuration
sudo nginx -t

# รีโหลด Nginx
sudo systemctl reload nginx
```

**สำคัญ:** แก้ไขในไฟล์ Nginx:
- `yourdomain.com` เป็น domain ของคุณ
- `/path/to/your/project` เป็น path จริงของโปรเจกต์
- SSL certificate paths

### 10. ตั้งค่า SSL Certificate (Let's Encrypt)

```bash
# ติดตั้ง Certbot
sudo apt install certbot python3-certbot-nginx -y

# ขอ SSL certificate
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# ตั้งค่า auto-renewal
sudo certbot renew --dry-run
```

### 11. ตั้งค่า Firewall

```bash
# เปิด port ที่จำเป็น
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw enable
```

## 🔍 การตรวจสอบ

### Health Check

```bash
# ตรวจสอบ API
curl https://yourdomain.com/api/health

# ตรวจสอบ PM2
pm2 status
pm2 logs

# ตรวจสอบ Nginx
sudo systemctl status nginx
sudo tail -f /var/log/nginx/sangsawang-furniture-error.log
```

### Monitoring

```bash
# ดู logs
pm2 logs sangsawang-furniture
tail -f logs/app.log

# ดู metrics
pm2 monit
```

## 🔄 การอัปเดต

```bash
# Pull code ใหม่
git pull origin main

# ติดตั้ง dependencies ใหม่
npm install --production
cd client && npm install && npm run build && cd ..

# Restart PM2
pm2 restart sangsawang-furniture

# ตรวจสอบ logs
pm2 logs sangsawang-furniture
```

## 🛡️ Security Checklist

- [ ] เปลี่ยน JWT_SECRET เป็นค่าที่ปลอดภัย
- [ ] ตั้งค่า database password ที่แข็งแรง
- [ ] เปิดใช้งาน SSL/HTTPS
- [ ] ตั้งค่า firewall
- [ ] ตั้งค่า SMTP สำหรับส่งอีเมล
- [ ] ตรวจสอบ file permissions
- [ ] ตั้งค่า backup database เป็นประจำ
- [ ] ตรวจสอบ logs เป็นประจำ

## 📊 Performance Optimization

1. **Enable Gzip** - เปิดใช้งานแล้วใน Nginx config
2. **Static File Caching** - ตั้งค่าแล้วใน Nginx config
3. **PM2 Cluster Mode** - แก้ไข `ecosystem.config.js`:
   ```js
   instances: 'max',
   exec_mode: 'cluster'
   ```
4. **Database Indexing** - ตรวจสอบว่า indexes ถูกสร้างแล้ว
5. **CDN** - พิจารณาใช้ CDN สำหรับ static files

## 🐛 Troubleshooting

### Server ไม่ start
```bash
# ตรวจสอบ logs
pm2 logs sangsawang-furniture
tail -f logs/app.log

# ตรวจสอบ database connection
mysql -u root -p -e "SELECT 1"
```

### Nginx 502 Bad Gateway
- ตรวจสอบว่า Node.js server กำลังรันอยู่
- ตรวจสอบ port ใน Nginx config ตรงกับ server port
- ตรวจสอบ firewall

### Database Connection Error
- ตรวจสอบ database credentials ใน `.env`
- ตรวจสอบว่า MySQL service กำลังรัน
- ตรวจสอบ database user permissions

## 📞 Support

หากพบปัญหาหรือต้องการความช่วยเหลือ:
1. ตรวจสอบ logs ใน `logs/app.log`
2. ตรวจสอบ PM2 logs: `pm2 logs`
3. ตรวจสอบ Nginx logs: `/var/log/nginx/`
4. ตรวจสอบ health endpoint: `/api/health`

