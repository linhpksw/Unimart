package tech.unimart.unimart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "ForgotController", urlPatterns = {"/forgot"})
public class ForgotController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String credential = request.getParameter("credential");

        String resetStatus = userService.initiatePasswordReset(credential, request);

        if ("success".contains(resetStatus)) {
            // If the reset email was successfully sent, redirect to a confirmation page
            request.setAttribute("status", resetStatus);
            request.getRequestDispatcher(request.getContextPath() + "/reset-confirm.jsp").forward(request, response);

        } else {
            // If there was an error (e.g., the credential does not exist), show the forgot form again with an error message
            request.setAttribute("errorMessage", resetStatus);
            request.getRequestDispatcher("/forgot.jsp").forward(request, response);
        }
    }
}
