const config = require('../src/config');

describe('Configuration', () => {
  test('should load database configuration', () => {
    expect(config.database).toBeDefined();
    expect(config.database.host).toBeDefined();
    expect(config.database.user).toBeDefined();
    expect(config.database.database).toBeDefined();
  });

  test('should load JWT configuration', () => {
    expect(config.jwt).toBeDefined();
    expect(config.jwt.secret).toBeDefined();
  });

  test('should load server configuration', () => {
    expect(config.server).toBeDefined();
    expect(config.server.port).toBeDefined();
    expect(typeof config.server.port).toBe('number');
  });

  test('should load SMTP configuration', () => {
    expect(config.smtp).toBeDefined();
    expect(config.smtp.port).toBeDefined();
    expect(typeof config.smtp.port).toBe('number');
  });

  test('should load app configuration', () => {
    expect(config.app).toBeDefined();
    expect(config.app.baseUrl).toBeDefined();
    expect(config.app.emailVerificationTtlMinutes).toBeDefined();
    expect(config.app.emailOtpLength).toBeDefined();
  });
});

