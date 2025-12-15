# Changelog

## [1.1.0] - Production Ready Updates

### Added

#### 🔧 Configuration Management
- **Environment Variables Support**: เพิ่มการรองรับ `.env` files สำหรับการจัดการ configuration แบบปลอดภัย
- **Config Loader**: สร้าง `src/config.js` ที่รองรับทั้ง `.env` และ `config.json` (backward compatible)
- **`.env.example`**: เพิ่มไฟล์ตัวอย่างสำหรับ environment variables

#### 📝 Logging System
- **Logger Utility**: สร้าง `src/utils/logger.js` สำหรับจัดการ logging
- **Log Levels**: รองรับ `error`, `warn`, `info`, `debug`
- **File Logging**: Logs ถูกบันทึกใน `logs/app.log`
- **Configurable**: ตั้งค่า log level ได้ผ่าน `LOG_LEVEL` environment variable

#### 🧪 Testing Infrastructure
- **Jest Configuration**: เพิ่ม `jest.config.js` สำหรับ backend testing
- **Unit Tests**: 
  - `__tests__/config.test.js` - ทดสอบ configuration loading
  - `__tests__/utils/logger.test.js` - ทดสอบ logging system
- **Frontend Tests**: 
  - `client/src/__tests__/App.test.js` - ทดสอบ App component
  - `client/src/__tests__/components/TopBar.test.js` - ทดสอบ TopBar component
- **Integration Tests**: `__tests__/integration/api.test.js` - โครงสร้างสำหรับ integration tests
- **Test Scripts**: เพิ่ม `npm test`, `npm run test:watch`, `npm run test:coverage`

#### 📊 Monitoring & Health Checks
- **Health Check Endpoint**: `GET /api/health` - ตรวจสอบสถานะ server และ database
- **Metrics Endpoint**: `GET /api/metrics` - แสดงสถิติระบบ (Admin only)
- **Graceful Shutdown**: รองรับ SIGTERM และ SIGINT สำหรับการปิด server แบบ graceful

#### 📚 Documentation
- **Updated README.md**: เพิ่มข้อมูลเกี่ยวกับ:
  - Environment Variables
  - Testing
  - Logging
  - Monitoring
- **CHANGELOG.md**: ไฟล์นี้ - บันทึกการเปลี่ยนแปลง

### Changed

#### 🔄 Server Configuration
- **Config Loading**: อัปเดต `src/server.js` ให้ใช้ `src/config.js` แทนการโหลด config.json โดยตรง
- **Logger Integration**: แทนที่ `console.log/error/warn` บางส่วนด้วย logger system
- **Error Handling**: ปรับปรุง error handling และ logging

#### 📦 Dependencies
- **Backend**: เพิ่ม `jest` และ `supertest` ใน devDependencies
- **Frontend**: เพิ่ม `@testing-library/react`, `@testing-library/jest-dom`, `@testing-library/user-event` ใน devDependencies

### Security

- **`.gitignore`**: อัปเดตให้ ignore `.env` และ `logs/` directory
- **Environment Variables**: รองรับการตั้งค่าผ่าน `.env` เพื่อความปลอดภัยมากขึ้น

### Migration Guide

#### สำหรับผู้ใช้เดิมที่ใช้ config.json:
1. ยังสามารถใช้ `config.json` ได้ตามเดิม (backward compatible)
2. หรือย้ายไปใช้ `.env` โดยคัดลอกค่าจาก `config.json` ไปใส่ใน `.env`

#### สำหรับผู้ใช้ใหม่:
1. คัดลอก `.env.example` เป็น `.env`
2. แก้ไขค่าตามต้องการ
3. ไฟล์ `.env` จะถูก ignore โดย Git อัตโนมัติ

### Testing

```bash
# Backend tests
npm test

# Frontend tests
cd client && npm test

# Coverage report
npm run test:coverage
```

### Next Steps

สำหรับการใช้งาน Production:
1. ตั้งค่า `.env` ให้ครบถ้วน (โดยเฉพาะ SMTP สำหรับส่งอีเมล)
2. เปลี่ยน `JWT_SECRET` ให้เป็นค่าที่ปลอดภัย
3. ตั้งค่า `NODE_ENV=production`
4. ตรวจสอบ logs ใน `logs/app.log` เป็นประจำ
5. ใช้ `/api/health` endpoint สำหรับ monitoring

