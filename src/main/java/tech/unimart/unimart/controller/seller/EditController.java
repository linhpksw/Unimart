package tech.unimart.unimart.controller.seller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.ProductService;
import tech.unimart.unimart.service.UserService;
import tech.unimart.unimart.utils.JsonUtil;

import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5,      // 5 MB
        maxRequestSize = 1024 * 1024 * 5 * 5) // 25 MB

@WebServlet(name = "EditController", value = "/seller/edit/*")
public class EditController extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getPathInfo().substring(1);
        ProductDetail productDetail = productService.getProductDetailById(productId);
        ProductDetail productDetailWithoutDescription = productService.getProductDetailById(productId);

        productDetailWithoutDescription.getProduct().setDescription("");

        if (productDetail != null) {
            String productDetailJson = JsonUtil.toJson(productDetailWithoutDescription);

            request.setAttribute("productDetailJson", productDetailJson);
            request.setAttribute("productDetail", productDetail);
            request.setAttribute("logicalURI", "/seller/edit");
            request.getRequestDispatcher("/user/user.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "The requested order does not exist.");
            request.getRequestDispatcher("/user/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Map<String, String[]> parameterMap = request.getParameterMap();
//
//        // Building a StringBuilder to accumulate log message
//        StringBuilder logMessage = new StringBuilder("Request Parameters: \n");
//
//        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
//            String paramName = entry.getKey();
//            String[] paramValues = entry.getValue();
//            logMessage.append(paramName).append(": ").append(Arrays.toString(paramValues)).append("\n");
//        }
//
//        // Now logMessage contains all parameter names and their values
//        System.out.println(logMessage); // Or use your preferred logging framework

        String productId = request.getPathInfo().substring(1);
        String productName = request.getParameter("product-name");
        String category = request.getParameter("category");
        String about = request.getParameter("about");

        User user = userService.getUserFromSession(request);
        String storeId = user.getId();

        // Instead of creating a new product, we update the existing one
        String result = productService.editProduct(productId, productName, category, about, request.getParameterMap(), storeId);

        if (!"success".equals(result)) {
            request.setAttribute("errorMessage", result);
            request.getRequestDispatcher("/user/user.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/seller/stock"); // Redirect to the stock page or wherever appropriate
        }
    }
}
