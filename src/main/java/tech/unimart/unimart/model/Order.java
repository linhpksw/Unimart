package tech.unimart.unimart.model;

import java.util.Date;
import java.util.List;

public class Order {
    private String orderId;
    private String userId;
    private List<OrderItem> items;
    private double subTotal;
    private double shipping;
    private double tax;
    private double total;
    private Date orderDate;
    public Order() {
    }

    public Order(String orderId, String userId, List<OrderItem> items, double subTotal, double shipping, double tax, double total, Date orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.items = items;
        this.subTotal = subTotal;
        this.shipping = shipping;
        this.tax = tax;
        this.total = total;
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", userId='" + userId + '\'' +
                ", items=" + items +
                ", subTotal=" + subTotal +
                ", shipping=" + shipping +
                ", tax=" + tax +
                ", total=" + total +
                ", orderDate=" + orderDate +
                '}';
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getShipping() {
        return shipping;
    }

    public void setShipping(double shipping) {
        this.shipping = shipping;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
