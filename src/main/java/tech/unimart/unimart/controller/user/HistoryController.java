package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.Order;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.OrderService;
import tech.unimart.unimart.service.UserService;
import tech.unimart.unimart.utils.JsonUtil;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HistoryController", value = "/user/history")
public class HistoryController extends HttpServlet {
    private final UserService userService = new UserService();

    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.checkAndAuthenticateUser(request, response);
        String userId = user.getId();

        List<Order> orders = orderService.getOrdersByUserId(userId);

        if (orders != null) {
            String ordersJson = JsonUtil.toJson(orders);
            request.setAttribute("ordersJson", ordersJson);
        } else {
            request.setAttribute("errorMessage", "The requested order does not exist!");
        }
        request.setAttribute("logicalURI", "/user/history");
        request.getRequestDispatcher("/user/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
