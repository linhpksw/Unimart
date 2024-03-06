package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.service.ProductService;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "ProductController", value = "/product/*")
public class ProductController extends HttpServlet {
    private final ProductService productService;

    public ProductController() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo(); // Gets the requested product ID

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/categories"); // Redirect to categories page if product ID is missing
            return;
        }

        String productId = pathInfo.substring(1);

        ProductDetail productDetail = productService.getProductDetailsById(productId);

        if (productDetail != null) {
            Map<String, Set<String>> attributesMap = new HashMap<>();

            productDetail.getProductItems().forEach(item -> {
                item.getAttributes().forEach((attributeName, attributeValue) -> {
                    attributesMap.computeIfAbsent(attributeName, k -> new LinkedHashSet<>()).add(attributeValue);
                });
            });

            request.setAttribute("attributesMap", attributesMap);
            request.setAttribute("productDetail", productDetail);
            request.getRequestDispatcher("/user/product.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Product not found");
            request.getRequestDispatcher("/user/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
