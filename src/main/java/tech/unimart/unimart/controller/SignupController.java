package tech.unimart.unimart.controller;

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

        User user = new User(id, email, password);
        System.out.println("User: " + user);

        String result = userService.createUser(user);

        if (!"success".equals(result)) {
            request.setAttribute("errorMessage", result);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
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
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
