import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Card from 'react-bootstrap/Card';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import Alert from 'react-bootstrap/Alert';
import InputGroup from 'react-bootstrap/InputGroup';
import axios from 'axios';

export default function AdminRegister() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    username: '',
    password: '',
    fname: '',
    lname: ''
  });
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');
    setIsLoading(true);

    try {
      await axios.post('/api/admin/register', formData);
      setSuccess('สมัครแอดมินสำเร็จ! กำลังพาไปหน้าเข้าสู่ระบบ...');
      setTimeout(() => {
        navigate('/admin/login');
      }, 1800);
    } catch (error) {
      console.error('Admin register error:', error);
      setError(error.response?.data?.error || 'สมัครแอดมินไม่สำเร็จ');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div
      className="login-page"
      style={{
        minHeight: '100vh',
        background: '#f6f1e6',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '20px'
      }}
    >
      <Container>
        <Row className="justify-content-center">
          <Col lg={5} md={6}>
            <Card
              style={{
                backgroundColor: '#ffffff',
                border: 'none',
                borderRadius: '15px',
                boxShadow: '0 10px 30px rgba(58, 47, 39, 0.12)'
              }}
            >
              <Card.Body style={{ padding: '40px' }}>
                <div className="text-center mb-4">
                  <i
                    className="bi bi-person-plus"
                    style={{ fontSize: '32px', color: '#b7895b' }}
                  ></i>
                </div>

                <h2
                  className="text-center mb-2"
                  style={{
                    color: '#3a2f27',
                    fontSize: '30px',
                    fontWeight: 'bold'
                  }}
                >
                  สมัครแอดมินใหม่
                </h2>
                <p
                  className="text-center mb-4"
                  style={{ color: '#796b60', fontSize: '14px' }}
                >
                  กรอกข้อมูลเพื่อสร้างบัญชีผู้ดูแลระบบ
                </p>

                {error && (
                  <Alert
                    variant="danger"
                    dismissible
                    onClose={() => setError('')}
                  >
                    {error}
                  </Alert>
                )}

                {success && (
                  <Alert variant="success">
                    {success}
                  </Alert>
                )}

                <Form onSubmit={handleSubmit}>
                  <Form.Group className="mb-3">
                    <Form.Label>รหัสแอดมิน (Username)</Form.Label>
                    <Form.Control
                      type="text"
                      name="username"
                      value={formData.username}
                      onChange={handleChange}
                      required
                      placeholder="ตั้งชื่อผู้ใช้สำหรับแอดมิน"
                      style={{
                        backgroundColor: '#fff',
                        border: 'none',
                        borderRadius: '10px',
                        padding: '12px',
                        fontSize: '16px',
                        boxShadow: '0 2px 8px rgba(58, 47, 39, 0.08)'
                      }}
                    />
                  </Form.Group>

                  <Form.Group className="mb-3">
                    <Form.Label>รหัสผ่าน</Form.Label>
                    <InputGroup
                      style={{
                        backgroundColor: '#fff',
                        borderRadius: '12px',
                        overflow: 'hidden',
                        boxShadow: '0 2px 8px rgba(58, 47, 39, 0.08)'
                      }}
                    >
                      <Form.Control
                        type={showPassword ? 'text' : 'password'}
                        name="password"
                        value={formData.password}
                        onChange={handleChange}
                        required
                        placeholder="ตั้งรหัสผ่าน"
                        style={{
                          backgroundColor: '#fff',
                          border: 'none',
                          padding: '12px',
                          fontSize: '16px'
                        }}
                      />
                      <Button
                        type="button"
                        variant="link"
                        onClick={() => setShowPassword((prev) => !prev)}
                        style={{
                          border: 'none',
                          background: 'transparent',
                          color: '#b7895b',
                          fontSize: '20px',
                          padding: '0 16px'
                        }}
                      >
                        <i
                          className={`bi ${
                            showPassword ? 'bi-eye-slash' : 'bi-eye'
                          }`}
                        ></i>
                      </Button>
                    </InputGroup>
                  </Form.Group>

                  <Form.Group className="mb-3">
                    <Form.Label>ชื่อจริง</Form.Label>
                    <Form.Control
                      type="text"
                      name="fname"
                      value={formData.fname}
                      onChange={handleChange}
                      required
                      placeholder="ชื่อ"
                      style={{
                        backgroundColor: '#fff',
                        border: 'none',
                        borderRadius: '10px',
                        padding: '12px',
                        fontSize: '16px',
                        boxShadow: '0 2px 8px rgba(58, 47, 39, 0.08)'
                      }}
                    />
                  </Form.Group>

                  <Form.Group className="mb-4">
                    <Form.Label>นามสกุล</Form.Label>
                    <Form.Control
                      type="text"
                      name="lname"
                      value={formData.lname}
                      onChange={handleChange}
                      required
                      placeholder="นามสกุล"
                      style={{
                        backgroundColor: '#fff',
                        border: 'none',
                        borderRadius: '10px',
                        padding: '12px',
                        fontSize: '16px',
                        boxShadow: '0 2px 8px rgba(58, 47, 39, 0.08)'
                      }}
                    />
                  </Form.Group>

                  <Button
                    variant="primary"
                    type="submit"
                    className="w-100 mb-3"
                    disabled={isLoading}
                    style={{
                      background:
                        'linear-gradient(125deg, #b7895b 0%, #cf9356 110%)',
                      border: 'none',
                      borderRadius: '10px',
                      padding: '14px',
                      fontSize: '18px',
                      fontWeight: 'bold',
                      color: '#fff'
                    }}
                  >
                    {isLoading ? 'กำลังสมัครแอดมิน...' : 'สมัครแอดมิน'}
                  </Button>
                </Form>

                <div className="d-flex justify-content-center mt-2">
                  <Button
                    variant="outline-secondary"
                    onClick={() => navigate('/admin/login')}
                    style={{
                      borderRadius: '10px',
                      padding: '10px 18px',
                      fontSize: '14px',
                      borderColor: '#b7895b',
                      color: '#b7895b'
                    }}
                  >
                    กลับไปหน้าเข้าสู่ระบบแอดมิน
                  </Button>
                </div>
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Container>
    </div>
  );
}


