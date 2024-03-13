package tech.unimart.unimart.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountController", value = "/admin/account")
public class AccountController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userService.findAllUsers();

        String deleted = request.getParameter("deleted");
        if (deleted != null) {
            request.setAttribute("successMessage", "User deleted successfully!");
        }

        if (users != null) {
            request.setAttribute("users", users);
        } else {
            request.setAttribute("errorMessage", "No users found!");
        }
        request.setAttribute("logicalURI", "/admin/account");
        request.getRequestDispatcher("/user/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
