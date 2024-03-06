package tech.unimart.unimart.controller.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String credential = request.getParameter("credential");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        boolean isLoginSuccess = userService.loginAndRememberUser(request, response, credential, password, rememberMe);

        if (isLoginSuccess) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("/security/login.jsp").forward(request, response);
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
            // No user session or remember me cookie found, show login page
            request.getRequestDispatcher("/security/login.jsp").forward(request, response);
        }
    }


}
