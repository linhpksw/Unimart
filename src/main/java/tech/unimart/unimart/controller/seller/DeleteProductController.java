package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.service.ProductService;

import java.io.IOException;


@WebServlet(name = "DeleteProductController", value = "/seller/delete/*")

public class DeleteProductController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productItemId = request.getPathInfo().substring(1);
        String result = productService.deleteProductItem(productItemId);

        if ("success".equals(result)) {
            response.sendRedirect(request.getContextPath() + "/seller/stock?delete=success");
        } else {
            request.setAttribute("errorMessage", result);
            request.setAttribute("logicalURI", "/seller/stock");
            request.getRequestDispatcher("/user/user.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
