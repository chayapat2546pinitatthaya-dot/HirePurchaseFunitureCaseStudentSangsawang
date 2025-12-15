// Test setup file
// This file can be used to configure test environment

// Set test environment variables
process.env.NODE_ENV = 'test';
process.env.DB_NAME = 'sangsawang_furniture_test';
process.env.JWT_SECRET = 'test-jwt-secret';
process.env.SERVER_PORT = '7101';

// Increase timeout for database operations
jest.setTimeout(30000);

