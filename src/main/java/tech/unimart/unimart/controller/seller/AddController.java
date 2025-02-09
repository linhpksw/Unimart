package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.ProductService;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,      // 5 MB
        maxRequestSize = 1024 * 1024 * 5 * 5) // 25 MB

@WebServlet(name = "AddController", value = "/seller/add")
public class AddController extends HttpServlet {

    private final UserService userService = new UserService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("logicalURI", "/seller/add");
        request.getRequestDispatcher("/user/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Part> parts = new ArrayList<>(request.getParts());
        String productName = request.getParameter("product-name");
        String category = request.getParameter("category");
        String about = request.getParameter("about");
        boolean isClassified = Boolean.parseBoolean(request.getParameter("isClassified"));
        String classHeader = request.getParameter("class-header");
        int totalClass = isClassified ? Integer.parseInt(request.getParameter("total-class")) : 0;

        User user = userService.checkAndAuthenticateUser(request, response);
        String storeId = user.getId();

        String result = productService.processProduct(productName, category, about, isClassified, classHeader, totalClass, parts, request.getParameterMap(), storeId, request);

        if (!"success".equals(result)) {
            request.setAttribute("errorMessage", result);
        } else {
            request.setAttribute("successMessage", "Product added successfully!");
        }
        request.setAttribute("logicalURI", "/seller/add");
        request.getRequestDispatcher("/user/user.jsp").forward(request, response);
    }
}
