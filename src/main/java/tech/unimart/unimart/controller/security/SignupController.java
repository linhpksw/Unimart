package tech.unimart.unimart.controller.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User user = new User(id, email, password, phone);

        String result = userService.createUser(user);

        if (!"success".equals(result)) {
            request.setAttribute("errorMessage", result);
            request.getRequestDispatcher("/security/signup.jsp").forward(request, response);
        } else {
            request.setAttribute("successMessage", "Account created successfully. Please login.");
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if user is logged in
        User user = userService.checkAndAuthenticateUser(request, response);

        if (user != null) {
            // User is already logged in, redirect to home page
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // No user session or remember me cookie found, show signup page
            request.getRequestDispatcher("/security/signup.jsp").forward(request, response);
        }
    }
}
