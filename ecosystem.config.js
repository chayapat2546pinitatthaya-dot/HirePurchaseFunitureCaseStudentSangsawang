/**
 * PM2 Ecosystem Configuration
 * สำหรับจัดการ Node.js process ใน production
 * 
 * การใช้งาน:
 * - pm2 start ecosystem.config.js
 * - pm2 stop ecosystem.config.js
 * - pm2 restart ecosystem.config.js
 * - pm2 logs
 * - pm2 monit
 */

module.exports = {
  apps: [
    {
      name: 'sangsawang-furniture',
      script: './src/server.js',
      instances: 1, // ใช้ 1 instance หรือ 'max' สำหรับ cluster mode
      exec_mode: 'fork', // 'fork' หรือ 'cluster'
      env: {
        NODE_ENV: 'development',
        PORT: 7100
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 7100
      },
      // Logging
      error_file: './logs/pm2-error.log',
      out_file: './logs/pm2-out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      merge_logs: true,
      
      // Auto restart
      watch: false, // ตั้งเป็น true สำหรับ development
      max_memory_restart: '500M',
      
      // Restart policy
      min_uptime: '10s',
      max_restarts: 10,
      restart_delay: 4000,
      
      // Graceful shutdown
      kill_timeout: 5000,
      wait_ready: true,
      listen_timeout: 10000
    }
  ]
};

