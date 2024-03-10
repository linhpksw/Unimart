package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.Product;
import tech.unimart.unimart.service.ProductService;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/categories")
public class CategoryController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sort = request.getParameter("sort");
        String categoriesParam = request.getParameter("category");
        String searchKeyword = request.getParameter("search");

        // Decode category parameter and split into a list
        List<String> categories = categoriesParam != null && !categoriesParam.isEmpty()
                ? Arrays.asList(URLDecoder.decode(categoriesParam, StandardCharsets.UTF_8).split(","))
                : Collections.emptyList();

        List<Product> products;

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            products = productService.searchProducts(searchKeyword);
        } else if ((sort == null || sort.isEmpty()) && (categories.isEmpty() || categories.contains("All categories"))) {
            products = productService.getAllProducts();
        } else {
            products = productService.filterProducts(sort, categories);
        }

        request.setAttribute("products", products);
        request.setAttribute("selectedSort", sort);
        request.setAttribute("selectedCategories", categories);
        request.getRequestDispatcher("/user/category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
