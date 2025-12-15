const fs = require('fs');
const path = require('path');

/**
 * Simple logging utility
 * Supports different log levels: error, warn, info, debug
 */
class Logger {
  constructor(config = {}) {
    this.level = config.level || 'info';
    this.logFile = config.file || 'logs/app.log';
    this.levels = { error: 0, warn: 1, info: 2, debug: 3 };
    
    // Ensure logs directory exists
    const logDir = path.dirname(this.logFile);
    if (!fs.existsSync(logDir)) {
      fs.mkdirSync(logDir, { recursive: true });
    }
  }

  shouldLog(level) {
    return this.levels[level] <= this.levels[this.level];
  }

  formatMessage(level, message, data = null) {
    const timestamp = new Date().toISOString();
    const prefix = `[${timestamp}] [${level.toUpperCase()}]`;
    
    if (data) {
      return `${prefix} ${message} ${JSON.stringify(data)}`;
    }
    return `${prefix} ${message}`;
  }

  writeToFile(message) {
    try {
      fs.appendFileSync(this.logFile, message + '\n', 'utf8');
    } catch (error) {
      console.error('Failed to write to log file:', error.message);
    }
  }

  log(level, message, data = null) {
    if (!this.shouldLog(level)) return;

    const formattedMessage = this.formatMessage(level, message, data);
    
    // Console output
    const consoleMethod = level === 'error' ? console.error :
                         level === 'warn' ? console.warn :
                         console.log;
    
    if (data) {
      consoleMethod(formattedMessage);
    } else {
      consoleMethod(formattedMessage);
    }

    // File output (only for error and warn in production)
    if (this.level !== 'debug' || level === 'error' || level === 'warn') {
      this.writeToFile(formattedMessage);
    }
  }

  error(message, data = null) {
    this.log('error', message, data);
  }

  warn(message, data = null) {
    this.log('warn', message, data);
  }

  info(message, data = null) {
    this.log('info', message, data);
  }

  debug(message, data = null) {
    this.log('debug', message, data);
  }
}

// Create singleton instance
let loggerInstance = null;

function createLogger(config) {
  if (!loggerInstance) {
    loggerInstance = new Logger(config);
  }
  return loggerInstance;
}

module.exports = { Logger, createLogger };

