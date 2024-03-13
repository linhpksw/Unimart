package tech.unimart.unimart.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.service.UserService;

import java.io.IOException;

@WebServlet(name = "ProfileController", value = "/user/profile")
public class ProfileController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("logicalURI", "/user/profile");
        request.getRequestDispatcher("/user/user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("username");
        String about = request.getParameter("about");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String shopActivated = request.getParameter("shopActivated");
        String role = "true".equals(shopActivated) ? "seller" : "customer";

        User user = new User(id, about, email, phone, role, name, gender, dob, address);

        try {
            String result = userService.updateUser(request, user);

            if (!"success".equals(result)) {
                request.setAttribute("errorMessage", result);
            } else {
                request.setAttribute("successMessage", "Profile updated successfully");
            }
        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("errorMessage", "An error occurred while updating the profile: " + e.getMessage() + "!");
        } finally {
            // This will execute whether an exception occurred or not
            request.setAttribute("logicalURI", "/user/profile");
            request.getRequestDispatcher("/user/user.jsp").forward(request, response);
        }
    }
}
