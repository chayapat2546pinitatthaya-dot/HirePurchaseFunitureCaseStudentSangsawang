require('dotenv').config();
const fs = require('fs');
const path = require('path');

/**
 * Load configuration from environment variables (.env) or config.json
 * Priority: .env > config.json > defaults
 */
function loadConfig() {
  let config = {};

  // Try to load from config.json first (for backward compatibility)
  try {
    const configPath = path.join(__dirname, '..', 'config.json');
    if (fs.existsSync(configPath)) {
      const configFile = fs.readFileSync(configPath, 'utf8');
      config = JSON.parse(configFile);
    }
  } catch (error) {
    console.warn('Warning: Could not load config.json:', error.message);
  }

  // Override with environment variables if they exist
  const finalConfig = {
    database: {
      host: process.env.DB_HOST || config.database?.host || 'localhost',
      user: process.env.DB_USER || config.database?.user || 'root',
      password: process.env.DB_PASSWORD || config.database?.password || '',
      database: process.env.DB_NAME || config.database?.database || 'sangsawang_furniture'
    },
    jwt: {
      secret: process.env.JWT_SECRET || config.jwt?.secret || 'sangsawang-furniture-jwt-secret-key-change-in-production'
    },
    server: {
      port: parseInt(process.env.SERVER_PORT || config.server?.port || '7100', 10),
      env: process.env.NODE_ENV || 'development'
    },
    smtp: {
      host: process.env.SMTP_HOST || config.smtp?.host || '',
      port: parseInt(process.env.SMTP_PORT || config.smtp?.port || '587', 10),
      user: process.env.SMTP_USER || config.smtp?.user || '',
      password: process.env.SMTP_PASSWORD || config.smtp?.password || '',
      secure: process.env.SMTP_SECURE === 'true' || config.smtp?.secure === true,
      from: process.env.SMTP_FROM || config.smtp?.from || ''
    },
    app: {
      baseUrl: process.env.APP_BASE_URL || config.app?.baseUrl || 'http://localhost:3001',
      emailVerificationTtlMinutes: parseInt(
        process.env.EMAIL_VERIFICATION_TTL_MINUTES || 
        config.app?.emailVerificationTtlMinutes || 
        '15', 
        10
      ),
      emailOtpLength: parseInt(
        process.env.EMAIL_OTP_LENGTH || 
        config.app?.emailOtpLength || 
        '6', 
        10
      )
    },
    logging: {
      level: process.env.LOG_LEVEL || 'info',
      file: process.env.LOG_FILE || 'logs/app.log'
    }
  };

  return finalConfig;
}

module.exports = loadConfig();

