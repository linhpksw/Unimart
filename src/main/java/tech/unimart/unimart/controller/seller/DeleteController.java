package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.service.ProductService;

import java.io.IOException;

@WebServlet(name = "DeleteController", value = "/seller/delete/*")
public class DeleteController extends HttpServlet {
    private final ProductService productService = new ProductService(); // Initialize as appropriate

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productItemId = request.getPathInfo().substring(1);
        String result = productService.deleteProductItem(productItemId);

        if ("success".equals(result)) {
            response.sendRedirect(request.getContextPath() + "/seller/stock");
        } else {
            request.setAttribute("errorMessage", result);
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
