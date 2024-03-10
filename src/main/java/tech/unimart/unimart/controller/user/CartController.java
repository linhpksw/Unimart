package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.Cart;
import tech.unimart.unimart.model.Order;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.CartService;
import tech.unimart.unimart.service.UserService;
import tech.unimart.unimart.utils.JsonUtil;

import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private final UserService userService = new UserService();
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.getUserFromSession(request);
        String action = request.getParameter("action");

        if ("deleteCartItem".equals(action)) {
            String productItemId = request.getParameter("productItemId");
            if (user != null && productItemId != null) {
                cartService.removeItemFromCart(user.getId(), productItemId);
            }
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        if (user != null) {
            String userId = user.getId();
            Cart cart = cartService.getCartByUserId(userId);

            if (cart != null) {
                cartService.enrichCartItemDetails(cart);
                String cartJson = JsonUtil.toJson(cart);
                request.setAttribute("cartJson", cartJson);
            }
            request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderDataJson = request.getParameter("cart-data");
        Order orderData = JsonUtil.fromJson(orderDataJson, Order.class);

        if (orderData == null) {
            // Handle parsing error
            request.setAttribute("errorMessage", "Invalid cart data.");
            request.getRequestDispatcher("/user/error.jsp").forward(request, response);
        } else {
            CartService cartService = new CartService();
            String validationMessage = cartService.validateCartItemsStock(orderData);

            if (validationMessage != null) {
                // One or more items exceed current stock, show an error message to the user
                request.setAttribute("errorMessage", validationMessage);
                request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
            } else {
                // All items are valid, proceed to place order
                request.setAttribute("orderData", orderData);
                request.getRequestDispatcher("/order").forward(request, response);
            }
        }
    }
}
