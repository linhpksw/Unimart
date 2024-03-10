package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.CartService;
import tech.unimart.unimart.service.ProductService;
import tech.unimart.unimart.service.UserService;
import tech.unimart.unimart.utils.JsonUtil;

import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product/*")
public class ProductController extends HttpServlet {
    private final CartService cartService = new CartService();
    private final UserService userService = new UserService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); // Gets the requested product ID

        if (pathInfo == null || pathInfo.equals("/")) {
            // Redirect to categories page if product ID is missing
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }

        String productId = pathInfo.substring(1);
        ProductDetail productDetail = productService.getProductDetailById(productId);

        if (productDetail != null) {
            String productDetailJson = JsonUtil.toJson(productDetail);
            String productItemsJson = JsonUtil.toJson(productDetail.getProductItems());

            request.setAttribute("productDetailJson", productDetailJson);
            request.setAttribute("productItemsJson", productItemsJson);

            request.setAttribute("productDetail", productDetail);
            request.getRequestDispatcher("/user/product.jsp").forward(request, response);
        } else {
            System.out.println("Product not found");
            request.setAttribute("errorMessage", "Product not found");
            request.getRequestDispatcher("/user/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        User user = userService.checkAndAuthenticateUser(request, response);

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String productId = request.getParameter("productId");
        String productItemId = request.getParameter("productItemId");
        String storeId = request.getParameter("storeId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Common logic to add product to cart
        String result = cartService.addProductToCart(user.getId(), productId, productItemId, quantity, storeId);

        if ("success".equals(result)) {
            if ("buyNow".equals(action)) {
                response.sendRedirect(request.getContextPath() + "/cart");
            } else if ("addToCart".equals(action)) {
                // Stay on product page but possibly show a success message
                response.sendRedirect(request.getContextPath() + "/product/" + productId);
            }
        } else {
            // Handle failure to add product
            response.sendRedirect(request.getContextPath() + "/user/error.jsp?message=Failed to add product");
        }
    }
}
