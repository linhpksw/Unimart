package tech.unimart.unimart.service;

import tech.unimart.unimart.dao.OrderDAO;
import tech.unimart.unimart.model.Order;

import java.util.List;

public class OrderService {
    private final OrderDAO orderDAO = new OrderDAO();

    public List<Order> getOrdersByStoreId(String storeId) {
        return orderDAO.getOrdersByStoreId(storeId);
    }

    public List<Order> getOrdersByUserId(String userId) {
        return orderDAO.getOrdersByUserId(userId);
    }

    public boolean createOrderAndAdjustStock(Order order) {
        return orderDAO.createOrderAndAdjustStock(order);
    }

    public Order getOrderById(String orderId) {
        return orderDAO.getOrderById(orderId);
    }

}
