@echo off
REM สร้างโฟลเดอร์ต่างๆ
mkdir database\scripts 2>nul
mkdir src 2>nul
mkdir config 2>nul
mkdir docs 2>nul
mkdir scripts 2>nul

REM ย้ายไฟล์ฐานข้อมูล
move sangsawang_furniture.sql database\

REM ย้ายสคริปต์จัดการฐานข้อมูล
move add_cancel_reason_column.js database\scripts\
move create_orders.js database\scripts\
move fix_database_types.js database\scripts\
move update_products_data.js database\scripts\
move create_orders_2025.js database\scripts\
move create_orders_last_month.js database\scripts\
move create_orders_sep_nov_2025.js database\scripts\
move fix_installment_data.js database\scripts\
move fix_product_image_paths.js database\scripts\
move migrate_database.js database\scripts\
move run_schema.js database\scripts\
move setup_categories.js database\scripts\

REM ย้ายไฟล์หลัก
move server.js src\

REM ย้ายไฟล์ตั้งค่า
move .env.example config\
if exist .env move .env config\
move .gitattributes config\
move .gitignore config\

REM ย้ายเอกสาร
move CODE_DOCUMENTATION.md docs\
move README.md docs\
move FIX_INSTALLATION.md docs\
move REPORT_STRUCTURE.md docs\nmove PDF_CORRECTIONS.md docs\
move COMPLETE_DOCUMENTATION.md docs\

REM ย้ายสคริปต์อรรถประโยชน์
move import_database.bat scripts\
move check_product_images.js scripts\
move cleanup_orders.js scripts\
move register_customers.js scripts\
move update_past_due_installments_manual.js scripts\

REM ย้ายไฟล์อื่นๆ
if exist Project1.pdf move Project1.pdf docs\
if exist Home_backup.js move Home_backup.js src\

echo จัดระเบียบไฟล์เสร็จสิ้น
echo โปรดตรวจสอบไฟล์ที่ถูกย้ายและแก้ไข path ในโค้ดที่เกี่ยวข้อง
echo ตรวจสอบไฟล์ในโฟลเดอร์ config/ เพื่อตั้งค่าที่ถูกต้อง
pause
