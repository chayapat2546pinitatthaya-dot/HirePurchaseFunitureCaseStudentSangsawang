import React, { useState, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Card from 'react-bootstrap/Card';
import Table from 'react-bootstrap/Table';
import Badge from 'react-bootstrap/Badge';
import Button from 'react-bootstrap/Button';
import Spinner from 'react-bootstrap/Spinner';
import Alert from 'react-bootstrap/Alert';
import axios from 'axios';
import AdminHeader from '../../components/AdminHeader';
import NotificationBell from '../../components/NotificationBell';
import './AdminDashboard.css';

const formatCurrency = (value) => {
  const number = Number(value) || 0;
  return `฿${number.toLocaleString('th-TH', {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  })}`;
};

const formatDate = (value) => {
  if (!value) {
    return '-';
  }
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) {
    return '-';
  }
  return date.toLocaleDateString('th-TH', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  });
};

const getDaysUntilDue = (dueDate) => {
  if (!dueDate) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const due = new Date(dueDate);
  due.setHours(0, 0, 0, 0);
  const diffTime = due - today;
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  return diffDays;
};

export default function AdminPaymentConfirmation({
  admin,
  logout,
  isSidebarCollapsed,
  toggleSidebar,
  adminNotifications,
  markAdminOrdersSeen,
  markAdminCustomersSeen,
  markAdminPaymentsSeen
}) {
  const navigate = useNavigate();
  const [installments, setInstallments] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [lastFetchedAt, setLastFetchedAt] = useState(null);
  const [message, setMessage] = useState({ show: false, text: '', variant: '' });
  const [actionLoadingId, setActionLoadingId] = useState(null);
  const toDateInput = (date) => date.toISOString().split('T')[0];
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const defaultEnd = new Date(today);
  defaultEnd.setDate(defaultEnd.getDate() + 5);
  const [startDate, setStartDate] = useState(toDateInput(today));
  const [endDate, setEndDate] = useState(toDateInput(defaultEnd));
  const [viewMode, setViewMode] = useState('upcoming'); // 'upcoming' | 'history'

  const fetchUpcomingPayments = useCallback(async () => {
    setIsLoading(true);
    try {
      const response = await axios.get('/api/admin/payment-confirmations', {
        params: {
          start_date: startDate,
          end_date: endDate,
          status: viewMode === 'history' ? 'paid' : 'pending'
        }
      });
      // ตรวจสอบว่า response.data เป็น array
      const data = Array.isArray(response.data) ? response.data : [];
      setInstallments(data);
      setLastFetchedAt(new Date());
    } catch (error) {
      console.error('Error fetching upcoming payments:', error);
      setMessage({
        show: true,
        text: error.response?.data?.error || 'ไม่สามารถโหลดข้อมูลได้',
        variant: 'danger'
      });
      // ตั้งค่าเป็น array ว่างเมื่อเกิด error
      setInstallments([]);
    } finally {
      setIsLoading(false);
    }
  }, [startDate, endDate, viewMode]);

  useEffect(() => {
    // ตรวจสอบว่ามี token ก่อนเรียก API
    const adminToken = localStorage.getItem('admin_token');
    if (!adminToken) {
      setMessage({
        show: true,
        text: 'กรุณาเข้าสู่ระบบใหม่',
        variant: 'danger'
      });
      setIsLoading(false);
      return;
    }
    
    // ตรวจสอบ token expiration (ถ้าเป็น JWT)
    try {
      const tokenParts = adminToken.split('.');
      if (tokenParts.length === 3) {
        const payload = JSON.parse(atob(tokenParts[1]));
        const expirationTime = payload.exp * 1000; // Convert to milliseconds
        if (Date.now() >= expirationTime) {
          setMessage({
            show: true,
            text: 'Session หมดอายุ กรุณาเข้าสู่ระบบใหม่',
            variant: 'danger'
          });
          setIsLoading(false);
          // ลบ token ที่หมดอายุ
          localStorage.removeItem('admin_token');
          localStorage.removeItem('admin_user');
          return;
        }
      }
    } catch (error) {
      // ถ้า parse ไม่ได้ อาจไม่ใช่ JWT หรือ format ผิด
      console.warn('Token validation error:', error);
    }
    
    // ตั้งค่า Authorization header ก่อนเรียก API
    axios.defaults.headers.common['Authorization'] = `Bearer ${adminToken}`;
    fetchUpcomingPayments();
    
    // Auto-refresh every 30 seconds
    const interval = setInterval(() => {
      fetchUpcomingPayments();
    }, 30000);
    
    return () => clearInterval(interval);
  }, [fetchUpcomingPayments]);

  const handleMarkPaid = async (orderId, installmentId) => {
    if (!window.confirm('ยืนยันการบันทึกว่าชำระเงินแล้ว?')) {
      return;
    }

    setActionLoadingId(installmentId);
    try {
      await axios.put(`/api/orders/${orderId}/installments/${installmentId}/mark-paid`);
      setMessage({
        show: true,
        text: 'บันทึกสถานะการชำระเงินเรียบร้อยแล้ว',
        variant: 'success'
      });
      
      // รีเฟรชข้อมูล
      await fetchUpcomingPayments();
      
      setTimeout(() => setMessage({ show: false }), 3000);
    } catch (error) {
      console.error('Error marking installment paid:', error);
      setMessage({
        show: true,
        text: error.response?.data?.error || 'ไม่สามารถบันทึกสถานะการชำระเงินได้',
        variant: 'danger'
      });
      setTimeout(() => setMessage({ show: false }), 5000); // Error message แสดงนานกว่า
    } finally {
      setActionLoadingId(null);
    }
  };

  const handleViewOrder = (orderId) => {
    navigate(`/admin/orders`);
    // เปิด order detail ในหน้า orders
    setTimeout(() => {
      const event = new CustomEvent('admin-view-order', { detail: { orderId } });
      window.dispatchEvent(event);
    }, 100);
  };

  const getUrgencyBadge = (daysUntilDue) => {
    if (daysUntilDue === null) return null;
    if (daysUntilDue < 0) {
      return <span className="dashboard-status-badge" style={{ backgroundColor: '#dc3545' }}>เลยกำหนด</span>;
    } else if (daysUntilDue === 0) {
      return <span className="dashboard-status-badge" style={{ backgroundColor: '#ffc107' }}>วันนี้</span>;
    } else if (daysUntilDue <= 2) {
      return <span className="dashboard-status-badge" style={{ backgroundColor: '#ffc107' }}>{daysUntilDue} วัน</span>;
    } else {
      return <span className="dashboard-status-badge" style={{ backgroundColor: '#0dcaf0' }}>{daysUntilDue} วัน</span>;
    }
  };

  if (isLoading) {
    return (
      <div className="admin-dashboard">
        <AdminHeader
          admin={admin}
          onLogout={logout}
          isCollapsed={isSidebarCollapsed}
          onToggleSidebar={toggleSidebar}
        />
        <div className="admin-dashboard__loading">
          <Spinner animation="border" role="status" variant="primary">
            <span className="visually-hidden">Loading...</span>
          </Spinner>
          <p className="mt-3 text-muted">กำลังรวบรวมข้อมูล...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="admin-dashboard">
      <AdminHeader
        admin={admin}
        onLogout={logout}
        isCollapsed={isSidebarCollapsed}
        onToggleSidebar={toggleSidebar}
        adminNotifications={adminNotifications}
        markAdminOrdersSeen={markAdminOrdersSeen}
        markAdminCustomersSeen={markAdminCustomersSeen}
        markAdminPaymentsSeen={markAdminPaymentsSeen}
      />

      <NotificationBell
        adminNotifications={adminNotifications}
        markAdminOrdersSeen={markAdminOrdersSeen}
        markAdminCustomersSeen={markAdminCustomersSeen}
        markAdminPaymentsSeen={markAdminPaymentsSeen}
      />

      <Container fluid className="admin-dashboard__container">
        {/* Header Section */}
        <section className="admin-dashboard__header">
          <div className="admin-dashboard__header-content">
            <div>
                <h1 className="admin-dashboard__title">
                  {viewMode === 'history' ? 'ประวัติการชำระเงิน' : 'ยืนยันการชำระเงิน'}
                </h1>
                <p className="admin-dashboard__subtitle">
                  {viewMode === 'history'
                    ? 'ดูงวดที่บันทึกชำระเงินแล้วในช่วงวันที่ที่เลือก'
                    : 'รายการงวดการชำระเงินที่กำลังถึงวันกำหนดภายใน 5 วัน (หรือช่วงที่เลือก)'}
                </p>
            </div>
            <div className="admin-dashboard__header-meta">
              <span className="admin-dashboard__date">
                <i className="bi bi-calendar3"></i>
                {new Date().toLocaleDateString('th-TH', {
                  weekday: 'long',
                  year: 'numeric',
                  month: 'long',
                  day: 'numeric'
                })}
              </span>
              {lastFetchedAt && (
                <span className="admin-dashboard__last-updated">
                  <i className="bi bi-clock"></i>
                  อัปเดตล่าสุด: {lastFetchedAt.toLocaleTimeString('th-TH')}
                </span>
              )}
            </div>
          </div>

          <div className="admin-dashboard__header-actions">
            <div className="d-flex align-items-center gap-2 flex-wrap">
              <div className="d-flex align-items-center gap-2">
                <label className="fw-semibold">โหมด</label>
                <select
                  className="form-select"
                  value={viewMode}
                  onChange={(e) => setViewMode(e.target.value)}
                >
                  <option value="upcoming">รอยืนยัน</option>
                  <option value="history">ประวัติชำระแล้ว</option>
                </select>
              </div>
              <div className="d-flex align-items-center gap-2">
                <label className="fw-semibold">จาก</label>
                <input
                  type="date"
                  className="form-control"
                  value={startDate}
                  onChange={(e) => setStartDate(e.target.value)}
                />
              </div>
              <div className="d-flex align-items-center gap-2">
                <label className="fw-semibold">ถึง</label>
                <input
                  type="date"
                  className="form-control"
                  value={endDate}
                  min={startDate}
                  onChange={(e) => setEndDate(e.target.value)}
                />
              </div>
            </div>
            <Button variant="primary" className="admin-dashboard__refresh-btn" onClick={fetchUpcomingPayments}>
              <i className="bi bi-arrow-repeat"></i>
              รีเฟรชข้อมูล
            </Button>
          </div>
        </section>

        {message.show && (
          <Alert
            variant={message.variant}
            dismissible
            onClose={() => setMessage({ show: false })}
            className="mb-4"
          >
            {message.text}
          </Alert>
        )}

        {/* Main Content - Payment Confirmations */}
        <Card className="admin-dashboard__panel">
          <div className="admin-dashboard__panel-header">
            <div>
              <h2>{viewMode === 'history' ? 'ประวัติการชำระเงิน' : 'รายการที่ต้องยืนยันการชำระเงิน'}</h2>
              <p>
                {viewMode === 'history'
                  ? `งวดที่บันทึกชำระแล้วในช่วงวันที่ที่เลือก ทั้งหมด ${installments.length.toLocaleString('th-TH')} รายการ`
                  : `รายการงวดการชำระเงินที่กำลังถึงวันกำหนดภายใน 5 วัน (หรือช่วงที่เลือก) ทั้งหมด ${installments.length.toLocaleString('th-TH')} รายการ`}
              </p>
            </div>
          </div>
          <div className="admin-dashboard__panel-body">
            {installments.length > 0 ? (
              <Table responsive hover className="admin-dashboard__table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>เลขที่คำสั่งซื้อ</th>
                    <th>ลูกค้า</th>
                    <th>เบอร์ติดต่อ</th>
                    <th>งวดที่</th>
                    <th>ยอดชำระ</th>
                    <th>{viewMode === 'history' ? 'วันที่ชำระ' : 'กำหนดชำระ'}</th>
                    <th>{viewMode === 'history' ? 'สถานะ' : 'เหลืออีก'}</th>
                    <th className="text-end">{viewMode === 'history' ? 'การดำเนินการ' : 'จัดการ'}</th>
                  </tr>
                </thead>
                <tbody>
                  {installments.map((item, index) => {
                    if (!item || !item.installment_id) {
                      return null; // Skip invalid items
                    }
                    
                    const daysUntilDue = viewMode === 'history' ? null : getDaysUntilDue(item.payment_due_date);
                    const customer = item.customer || {};
                    const customerName = `${customer.customer_fname || ''} ${customer.customer_lname || ''}`.trim() || 'ไม่ระบุชื่อ';
                    const orderId = item.order_id || item.order?.order_id || null;
                    const installmentId = item.installment_id;
                    const dateDisplay = viewMode === 'history'
                      ? formatDate(item.payment_date)
                      : formatDate(item.payment_due_date);
                    
                    return (
                      <tr key={installmentId}>
                        <td className="fw-semibold">{index + 1}</td>
                        <td>
                          {orderId ? (
                            <Button
                              variant="link"
                              className="p-0 text-decoration-none fw-semibold"
                              style={{ color: '#000' }}
                              onClick={() => handleViewOrder(orderId)}
                            >
                              #{orderId}
                            </Button>
                          ) : (
                            <span className="text-muted">-</span>
                          )}
                        </td>
                        <td>
                          <div className="admin-dashboard__customer-info">
                            <strong>{customerName}</strong>
                          </div>
                        </td>
                        <td>{customer.customer_tel || '-'}</td>
                        <td>{item.installment_number || '-'}</td>
                        <td className="admin-dashboard__amount">{formatCurrency(item.installment_amount || 0)}</td>
                        <td>{dateDisplay}</td>
                        <td>
                          {viewMode === 'history'
                            ? <Badge bg="success">ชำระแล้ว</Badge>
                            : getUrgencyBadge(daysUntilDue)}
                        </td>
                        <td className="text-end">
                          {viewMode === 'history' ? (
                            <Button
                              variant="outline-secondary"
                              size="sm"
                              className="admin-dashboard__action-btn"
                              title="ดูคำสั่งซื้อ"
                              onClick={() => handleViewOrder(orderId)}
                            >
                              <i className="bi bi-box-arrow-up-right"></i>
                            </Button>
                          ) : (
                            <>
                              {orderId && installmentId ? (
                                <Button
                                  variant="outline-success"
                                  size="sm"
                                  className="admin-dashboard__action-btn admin-dashboard__action-btn--approve"
                                  title="ยืนยันการชำระเงิน"
                                  disabled={actionLoadingId === installmentId}
                                  onClick={() => handleMarkPaid(orderId, installmentId)}
                                >
                                  {actionLoadingId === installmentId ? (
                                    <Spinner animation="border" size="sm" role="status">
                                      <span className="visually-hidden">Processing...</span>
                                    </Spinner>
                                  ) : (
                                    <i className="bi bi-check-circle"></i>
                                  )}
                                </Button>
                              ) : (
                                <span className="text-muted">-</span>
                              )}
                            </>
                          )}
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </Table>
            ) : (
              <div className="admin-dashboard__empty-state">
                <i className="bi bi-check-circle"></i>
                <strong>{viewMode === 'history' ? 'ไม่มีประวัติการชำระเงินในช่วงนี้' : 'ไม่มีรายการที่ต้องยืนยัน'}</strong>
                <p>
                  {viewMode === 'history'
                    ? 'ไม่มีงวดที่ถูกบันทึกว่าชำระแล้วในช่วงวันที่ที่เลือก'
                    : 'ไม่มีงวดการชำระเงินที่กำลังถึงวันกำหนดในช่วงวันที่ที่เลือก'}
                </p>
              </div>
            )}
          </div>
        </Card>
      </Container>
    </div>
  );
}

