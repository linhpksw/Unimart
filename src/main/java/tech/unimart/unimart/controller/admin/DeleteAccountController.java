package tech.unimart.unimart.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "DeleteAccountController", value = "/admin/delete/*")
public class DeleteAccountController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String userId = pathInfo.substring(1);

        User user = userService.checkAndAuthenticateUser(request, response);

        String result = userService.deleteUserById(userId);

        if ("success".equals(result)) {
            if (user.getId().equals(userId)) {
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/account");
            }
        } else {
            request.setAttribute("errorMessage", "Failed to delete user.");
            request.getRequestDispatcher("/admin/errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
