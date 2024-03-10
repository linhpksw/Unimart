package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.ProductService;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StockController", value = "/seller/stock")
public class StockController extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.checkAndAuthenticateUser(request, response);

        List<ProductDetail> productsStock = productService.getProductsByStoreId(user.getId());

        if (productsStock != null) {
            request.setAttribute("productsStock", productsStock);
            request.setAttribute("logicalURI", "/seller/stock");
            String deleteSuccess = request.getParameter("delete");
            if ("success".equals(deleteSuccess)) {
                request.setAttribute("successMessage", "Product deleted successfully.");
            }
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
