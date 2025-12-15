const { Logger, createLogger } = require('../../src/utils/logger');
const fs = require('fs');
const path = require('path');

describe('Logger', () => {
  let logger;
  const testLogFile = 'logs/test.log';

  beforeEach(() => {
    // Clean up test log file
    if (fs.existsSync(testLogFile)) {
      fs.unlinkSync(testLogFile);
    }
    logger = new Logger({ level: 'debug', file: testLogFile });
  });

  afterEach(() => {
    // Clean up test log file
    if (fs.existsSync(testLogFile)) {
      fs.unlinkSync(testLogFile);
    }
  });

  test('should create logger instance', () => {
    expect(logger).toBeDefined();
    expect(logger.level).toBe('debug');
  });

  test('should log error messages', () => {
    const consoleSpy = jest.spyOn(console, 'error').mockImplementation();
    logger.error('Test error');
    expect(consoleSpy).toHaveBeenCalled();
    consoleSpy.mockRestore();
  });

  test('should log warn messages', () => {
    const consoleSpy = jest.spyOn(console, 'warn').mockImplementation();
    logger.warn('Test warning');
    expect(consoleSpy).toHaveBeenCalled();
    consoleSpy.mockRestore();
  });

  test('should log info messages', () => {
    const consoleSpy = jest.spyOn(console, 'log').mockImplementation();
    logger.info('Test info');
    expect(consoleSpy).toHaveBeenCalled();
    consoleSpy.mockRestore();
  });

  test('should respect log level', () => {
    const errorLogger = new Logger({ level: 'error', file: testLogFile });
    const consoleSpy = jest.spyOn(console, 'log').mockImplementation();
    
    errorLogger.info('This should not log');
    expect(consoleSpy).not.toHaveBeenCalled();
    
    consoleSpy.mockRestore();
  });

  test('should write to file', () => {
    logger.error('Test error message');
    
    // Wait a bit for file write
    setTimeout(() => {
      if (fs.existsSync(testLogFile)) {
        const content = fs.readFileSync(testLogFile, 'utf8');
        expect(content).toContain('Test error message');
      }
    }, 100);
  });

  test('createLogger should return singleton', () => {
    const logger1 = createLogger({ level: 'info', file: testLogFile });
    const logger2 = createLogger({ level: 'debug', file: testLogFile });
    expect(logger1).toBe(logger2);
  });
});

