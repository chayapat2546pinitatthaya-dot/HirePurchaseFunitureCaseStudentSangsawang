import React, { useEffect, useState } from 'react';
import Container from 'react-bootstrap/Container';
import Badge from 'react-bootstrap/Badge';
import Table from 'react-bootstrap/Table';
import Form from 'react-bootstrap/Form';
import Alert from 'react-bootstrap/Alert';
import Spinner from 'react-bootstrap/Spinner';
import Image from 'react-bootstrap/Image';
import axios from 'axios';
import './Cards.css';

const ORDER_STATUS_MAP = {
  pending: { label: 'รออนุมัติ', variant: 'warning' },
  awaiting_payment: { label: 'รอชำระเงิน', variant: 'info' },
  approved: { label: 'อนุมัติแล้ว', variant: 'success' },
  waiting_for_delivery: { label: 'รอจัดส่ง', variant: 'primary' },
  completed: { label: 'ส่งมอบสำเร็จ', variant: 'success' },
  cancelled: { label: 'ยกเลิกโดยผู้ดูแล', variant: 'danger' },
  cancelled_by_customer: { label: 'ยกเลิก', variant: 'danger' }
};

const formatCurrency = (value) => {
  if (value == null) return '-';
  return `฿${parseFloat(value).toLocaleString('th-TH')}`;
};

const formatDate = (value) => {
  if (!value) return '-';
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return '-';
  return date.toLocaleDateString('th-TH');
};

const formatShippingAddress = (value) => {
  if (!value) {
    return '';
  }

  if (typeof value === 'string') {
    const trimmed = value.trim();
    if (!trimmed) {
      return '';
    }
    if (trimmed.startsWith('{')) {
      try {
        return formatShippingAddress(JSON.parse(trimmed));
      } catch (error) {
        console.warn('Failed to parse shipping address JSON:', trimmed, error);
        return trimmed;
      }
    }
    return trimmed;
  }

  if (typeof value === 'object') {
    const recipientName = [value.recipientName, value.recipientSurname]
      .filter(Boolean)
      .join(' ')
      .trim();
    const lines = [];
    if (recipientName) {
      lines.push(recipientName);
    }
    if (value.phone) {
      lines.push(`โทร: ${value.phone}`);
    }
    if (value.address) {
      lines.push(value.address);
    }
    return lines.join('\n');
  }

  return '';
};

/**
 * คำนวณจำนวนเงินผ่อนชำระแต่ละงวดให้ถูกต้องตามหลักบัญชี
 */
const calculateInstallmentAmounts = (totalAmount, periods) => {
  const total = Number(totalAmount);
  const numPeriods = Number(periods);
  
  if (!Number.isFinite(total) || total <= 0 || !Number.isFinite(numPeriods) || numPeriods <= 0) {
    return [];
  }
  
  if (numPeriods === 1) {
    return [total];
  }
  
  const averagePerMonth = total / numPeriods;
  const regularAmount = Math.ceil(averagePerMonth / 10) * 10;
  
  const amounts = [];
  for (let i = 1; i < numPeriods; i++) {
    amounts.push(regularAmount);
  }
  
  const regularTotal = regularAmount * (numPeriods - 1);
  const lastAmount = total - regularTotal;
  amounts.push(lastAmount);
  
  return amounts;
};

const isInstallmentOrder = (order) => {
  if (!order) return false;
  const periods = Number(order.installment_periods) || 0;
  const method = order.payment_method ? String(order.payment_method).toLowerCase() : '';
  if (method.includes('install')) return true;
  if (method.includes('cash')) return false;
  if (periods > 1) return true;
  return periods >= 1 && (Number(order.monthly_payment) || 0) > 0;
};

const getDaysUntilDue = (date) => {
  if (!date) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const due = new Date(date);
  due.setHours(0, 0, 0, 0);
  const diff = due - today;
  return Math.ceil(diff / (1000 * 60 * 60 * 24));
};

export default function Cards() {
  const [orders, setOrders] = useState([]);
  const [selectedOrderId, setSelectedOrderId] = useState(null);
  const [orderDetail, setOrderDetail] = useState(null);
  const [isOrdersLoading, setIsOrdersLoading] = useState(true);
  const [isDetailLoading, setIsDetailLoading] = useState(false);
  const [ordersError, setOrdersError] = useState('');
  const [detailError, setDetailError] = useState('');
  const [installmentFilter, setInstallmentFilter] = useState('all'); // all | pending | paid | overdue

  useEffect(() => {
    const fetchOrders = async () => {
      setIsOrdersLoading(true);
      setOrdersError('');
      try {
        const response = await axios.get('/api/customer/orders');
        const rawData = Array.isArray(response.data) ? response.data : [];
        const filtered = rawData.filter(
          (order) =>
            order.order_status !== 'cancelled_by_customer' &&
            order.order_status !== 'cancelled' &&
            isInstallmentOrder(order)
        );

        if (filtered.length === 0) {
          setOrders([]);
          setSelectedOrderId(null);
          setOrdersError(
            rawData.length > 0
              ? 'ยังไม่มีคำสั่งซื้อที่อยู่ในแผนผ่อนชำระ (รายการที่ยกเลิกจะไม่แสดงในหน้านี้)'
              : 'ยังไม่มีคำสั่งซื้อ'
          );
          return;
        }

        setOrders(filtered);
        setOrdersError('');
        setSelectedOrderId(filtered[0].order_id);
      } catch (error) {
        console.error('Error fetching customer orders:', error);
        setOrdersError(error.response?.data?.error || 'ไม่สามารถโหลดข้อมูลคำสั่งซื้อได้');
      } finally {
        setIsOrdersLoading(false);
      }
    };

    fetchOrders();
  }, []);

  useEffect(() => {
    if (!selectedOrderId) {
      setOrderDetail(null);
      return;
    }

    const fetchOrderDetail = async () => {
      setIsDetailLoading(true);
      setDetailError('');
      try {
        const response = await axios.get(`/api/orders/${selectedOrderId}`);
        setOrderDetail(response.data);
      } catch (error) {
        console.error('Error fetching order detail:', error);
        setDetailError(error.response?.data?.error || 'ไม่สามารถโหลดรายละเอียดคำสั่งซื้อได้');
        setOrderDetail(null);
      } finally {
        setIsDetailLoading(false);
      }
    };

    fetchOrderDetail();
  }, [selectedOrderId]);

  const filteredInstallments = React.useMemo(() => {
    if (!orderDetail?.installments) return [];
    return orderDetail.installments.filter((item) => {
      if (installmentFilter === 'paid') return item.payment_status === 'paid';
      if (installmentFilter === 'pending') return item.payment_status !== 'paid';
      if (installmentFilter === 'overdue') {
        const days = getDaysUntilDue(item.payment_due_date);
        return item.payment_status !== 'paid' && days !== null && days < 0;
      }
      return true;
    });
  }, [orderDetail, installmentFilter]);

  const upcomingCount = orderDetail?.installments?.filter((i) => i.payment_status !== 'paid').length || 0;
  const paidCount = orderDetail?.installments?.filter((i) => i.payment_status === 'paid').length || 0;

  return (
    <div className="cards-page">
      <Container>
        <header className="cards-contract__header-only">
          <div>
            <span className="cards-contract__eyebrow">แผนการผ่อนชำระ</span>
            <h1>สถานะการผ่อนชำระ</h1>
            <p className="text-muted">
              เลือกคำสั่งซื้อเพื่อดูรายละเอียดการผ่อนชำระแต่ละงวดได้ที่นี่
            </p>
          </div>
          <div className="cards-contract__selector-shell">
            <Form.Select
              value={selectedOrderId ?? ''}
              onChange={(event) => setSelectedOrderId(event.target.value || null)}
              disabled={isOrdersLoading || orders.length === 0}
              className="cards-contract__selector"
            >
              {orders.length === 0 && <option value="">ยังไม่มีคำสั่งซื้อ</option>}
              {orders.map((order) => {
                const primaryItem = order.items?.[0];
                return (
                  <option key={order.order_id} value={order.order_id}>
                    #{order.order_id} • {primaryItem?.product_name || 'ไม่ระบุสินค้า'}
                  </option>
                );
              })}
            </Form.Select>
            <div className="cards-contract__selector-display">
              {isOrdersLoading ? (
                <span>กำลังโหลด...</span>
              ) : selectedOrderId ? (
                (() => {
                  const selectedOrder = orders.find((order) => order.order_id === Number(selectedOrderId));
                  const primaryItem = selectedOrder?.items?.[0];
                  const statusKey = orderDetail?.order_status;
                  const statusConfig = ORDER_STATUS_MAP[statusKey] || {
                    label: statusKey || '-',
                    variant: 'secondary'
                  };
                  const isCancelled =
                    statusKey === 'cancelled' || statusKey === 'cancelled_by_customer';
                  const isPending = statusKey === 'pending';
                  const isAwaitingPayment = statusKey === 'awaiting_payment';
                  const badgeClasses = [
                    'cards-status-badge',
                    isCancelled ? 'cards-status-badge--cancelled' : '',
                    isPending ? 'cards-status-badge--pending' : '',
                    isAwaitingPayment ? 'cards-status-badge--awaiting' : ''
                  ]
                    .filter(Boolean)
                    .join(' ');
                  return (
                    <>
                      <div className="selector-product">
                        <Image
                          src={primaryItem?.product_image || 'https://via.placeholder.com/80'}
                          alt={primaryItem?.product_name || 'สินค้า'}
                          rounded
                        />
                        <div>
                          <strong>{primaryItem?.product_name || `คำสั่งซื้อ #${selectedOrder?.order_id || '-'}`}</strong>
                          <span>
                            {formatDate(selectedOrder?.order_date)} • {formatCurrency(selectedOrder?.total_amount)}
                          </span>
                        </div>
                      </div>
                      <Badge
                        bg={statusConfig.variant}
                        className={badgeClasses}
                      >
                        {statusConfig.label}
                      </Badge>
                    </>
                  );
                })()
              ) : (
                <span>เลือกคำสั่งซื้อ</span>
              )}
            </div>
          </div>
        </header>

        {ordersError && (
          <Alert variant="danger" className="cards-contract__alert">
            {ordersError}
          </Alert>
        )}

        {orderDetail && (
          <div className="cards-summary">
            <div className="cards-summary__item">
              <span className="label">ยอดรวมสัญญา</span>
              <strong>{formatCurrency(orderDetail.total_amount)}</strong>
            </div>
            <div className="cards-summary__item">
              <span className="label">จำนวนงวดทั้งหมด</span>
              <strong>{orderDetail.installment_periods || '-'}</strong>
            </div>
            <div className="cards-summary__item">
              <span className="label">งวดยอดปัจจุบัน</span>
              <strong>
                {isInstallmentOrder(orderDetail)
                  ? (() => {
                      const amounts = calculateInstallmentAmounts(
                        Number(orderDetail.total_amount) || 0,
                        Number(orderDetail.installment_periods) || 0
                      );
                      return formatCurrency(amounts.length > 0 ? amounts[0] : orderDetail.monthly_payment || 0);
                    })()
                  : formatCurrency(orderDetail.monthly_payment || 0)}
              </strong>
            </div>
            <div className="cards-summary__item">
              <span className="label">ที่อยู่จัดส่ง</span>
              <p className="cards-summary__address">
                {formatShippingAddress(orderDetail.shipping_address) || 'ไม่ได้ระบุที่อยู่จัดส่ง'}
              </p>
            </div>
          </div>
        )}

        {detailError && !isDetailLoading && (
          <Alert variant="danger" className="cards-contract__alert">
            {detailError}
          </Alert>
        )}

        {isDetailLoading ? (
          <div className="cards-contract__loading">
            <Spinner animation="border" role="status" size="sm" className="me-2" />
            <span>กำลังโหลดตารางผ่อนชำระ...</span>
          </div>
        ) : (
          <>
            {orderDetail?.installments?.length ? (
              <div className="cards-contract__table-wrapper">
                <div className="cards-contract__summary">
                  <Badge bg="light" text="dark">
                    เหลืออีก {upcomingCount} งวด • ชำระแล้ว {paidCount}
                  </Badge>
                  {(() => {
                    const summaryStatus = orderDetail.order_status;
                    const summaryClasses = ['cards-status-badge'];
                    if (summaryStatus === 'cancelled' || summaryStatus === 'cancelled_by_customer') {
                      summaryClasses.push('cards-status-badge--cancelled');
                    }
                    if (summaryStatus === 'pending') {
                      summaryClasses.push('cards-status-badge--pending');
                    }
                    if (summaryStatus === 'awaiting_payment') {
                      summaryClasses.push('cards-status-badge--awaiting');
                    }
                    return (
                      <Badge
                        bg={ORDER_STATUS_MAP[orderDetail.order_status]?.variant || 'secondary'}
                        className={summaryClasses.join(' ')}
                      >
                        {ORDER_STATUS_MAP[orderDetail.order_status]?.label || orderDetail.order_status}
                      </Badge>
                    );
                  })()}
                </div>
                <div className="cards-contract__filters">
                  <Form.Select
                    value={installmentFilter}
                    onChange={(e) => setInstallmentFilter(e.target.value)}
                    size="sm"
                  >
                    <option value="all">ทุกสถานะ</option>
                    <option value="pending">รอชำระ</option>
                    <option value="overdue">เลยกำหนด</option>
                    <option value="paid">ชำระแล้ว</option>
                  </Form.Select>
                </div>
                <Table responsive hover className="cards-contract__table">
                  <thead>
                    <tr>
                      <th>งวดที่</th>
                      <th>ยอดชำระ</th>
                      <th>กำหนดชำระ</th>
                      <th>วันที่ชำระ</th>
                      <th>สถานะ</th>
                    </tr>
                  </thead>
                  <tbody>
                    {filteredInstallments.map((item) => {
                      const days = getDaysUntilDue(item.payment_due_date);
                      const isPaid = item.payment_status === 'paid';
                      const isOverdue = !isPaid && days !== null && days < 0;
                      const isDueSoon = !isPaid && days !== null && days >= 0 && days <= 3;
                      return (
                        <tr key={item.installment_id}>
                          <td>{item.installment_number}</td>
                          <td>{formatCurrency(item.installment_amount)}</td>
                          <td>{formatDate(item.payment_due_date)}</td>
                          <td>{formatDate(item.payment_date)}</td>
                          <td>
                            <div className="d-flex align-items-center gap-2 flex-wrap">
                              <Badge bg={isPaid ? 'success' : 'secondary'}>
                                {isPaid ? 'ชำระแล้ว' : 'รอชำระ'}
                              </Badge>
                              {isOverdue && <Badge bg="danger">เลยกำหนด</Badge>}
                              {isDueSoon && <Badge bg="warning" text="dark">ครบกำหนดใน {days} วัน</Badge>}
                            </div>
                          </td>
                        </tr>
                      );
                    })}
                    {filteredInstallments.length === 0 && (
                      <tr>
                        <td colSpan={5} className="text-center text-muted py-3">
                          ไม่มีงวดตามเงื่อนไขที่เลือก
                        </td>
                      </tr>
                    )}
                  </tbody>
                </Table>
              </div>
            ) : null}
          </>
        )}
      </Container>
    </div>
  );
}

