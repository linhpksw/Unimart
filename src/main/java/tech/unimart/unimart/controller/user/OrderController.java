package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.Order;
import tech.unimart.unimart.service.OrderService;
import tech.unimart.unimart.utils.JsonUtil;
import tech.unimart.unimart.utils.UUIDUtil;

import java.io.IOException;


@WebServlet(name = "OrderController", value = "/order/*")
public class OrderController extends HttpServlet {
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getPathInfo().substring(1);
        Order order = orderService.getOrderById(orderId);

        if (order != null) {
            String orderJson = JsonUtil.toJson(order);
            request.setAttribute("orderJson", orderJson);
            request.setAttribute("successMessage", "Order created successfully!");
            request.getRequestDispatcher("/user/order.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "The requested order does not exist!");
            request.getRequestDispatcher("/user/order.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order orderData = (Order) request.getAttribute("orderData");

        if (orderData != null) {
            String orderId = UUIDUtil.generateRandomUUID(6);
            orderData.setOrderId(orderId);

            if (orderService.createOrderAndAdjustStock(orderData)) {
                response.sendRedirect(request.getContextPath() + "/order/" + orderId);

            } else {
                // Handle order creation failure
                request.setAttribute("errorMessage", "Failed to create the order!");
                request.getRequestDispatcher("/cart").forward(request, response);
            }
        } else {
            // Handle JSON parsing error or missing order data
            request.setAttribute("errorMessage", "Invalid order data!");
            request.getRequestDispatcher("/cart").forward(request, response);
        }
    }
}
