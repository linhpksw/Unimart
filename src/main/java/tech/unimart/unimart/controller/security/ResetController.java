package tech.unimart.unimart.controller.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "ResetController", value = "/reset")
public class ResetController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        // Verify the token and show the password reset form
        // This can also check if the token has expired based on the time in the 'forgots' table
        boolean tokenValid = userService.validatePasswordResetToken(token);

        if (tokenValid) {
            request.setAttribute("token", token);
            request.getRequestDispatcher("/security/reset-password.jsp").forward(request, response);
        } else {
            // Handle invalid or expired token
            response.sendRedirect(request.getContextPath() + "/security/invalid-token.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        // Process the password reset
        boolean passwordReset = userService.resetPassword(token, newPassword);

        if (passwordReset) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            // Handle password reset failure
            request.setAttribute("errorMessage", "Failed to reset password");
            request.getRequestDispatcher("/security/reset-password.jsp").forward(request, response);
        }
    }
}
