package tech.unimart.unimart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;


import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private final UserService userService = new UserService();

    public void init() {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String credential = request.getParameter("credential");
        String password = request.getParameter("password");  // This is the plaintext password
        String rememberMe = request.getParameter("rememberMe");

        User user = userService.authenticate(credential, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Store user in session

            if ("on".equals(rememberMe)) {
                String token = userService.createAndStoreRememberToken(user); // Store the token and get it back
                Cookie rememberCookie = new Cookie("remember", token); // Use the correct token variable
                rememberCookie.setMaxAge(60 * 60 * 24 * 30); // Set cookie to expire in 30 days
                rememberCookie.setHttpOnly(true); // Make it HttpOnly for security reasons
                response.addCookie(rememberCookie);
            }

            response.sendRedirect("/"); // Redirect to home page
        } else {
            request.setAttribute("errorMessage", "Invalid credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
