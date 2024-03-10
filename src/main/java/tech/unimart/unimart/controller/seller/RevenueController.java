package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.Order;
import tech.unimart.unimart.model.OrderItem;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.OrderService;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RevenueController", value = "/seller/revenue")
public class RevenueController extends HttpServlet {
    private final OrderService orderService = new OrderService();
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.getUserFromSession(request);
        String storeId = user.getId();

        List<Order> orders = orderService.getOrdersByStoreId(storeId);
        double totalRevenue = 0;
        int totalItemsSold = 0;

        if (orders != null) {
            for (Order order : orders) {
                totalRevenue += order.getTotal();
                for (OrderItem item : order.getItems()) {
                    totalItemsSold += item.getQuantity();
                }
            }
            int totalOrders = orders.size();

            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalItemsSold", totalItemsSold);

            request.setAttribute("orders", orders);
            request.setAttribute("logicalURI", "/seller/revenue");
            request.getRequestDispatcher("/user/user.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "The requested order does not exist.");
            request.getRequestDispatcher("/user/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
