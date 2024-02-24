package tech.unimart.unimart.service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.unimart.unimart.dao.RememberDAO;
import tech.unimart.unimart.dao.UserDAO;
import tech.unimart.unimart.model.Remember;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.utils.PasswordUtil;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    private final RememberDAO rememberDAO = new RememberDAO();

    public String createUser(User user) {
        // Check for duplicates
        String id = user.getId();
        String email = user.getEmail();
        String phone = user.getPhone();
        String exists = userDAO.checkUserExists(id, email, phone);
        if (exists != null) {
            return exists + " exists";
        }

        // Attempt to create the user
        boolean created = userDAO.createUser(user);
        if (!created) {
            return "Failed to create user";
        }

        return "success";
    }

    public User checkAndAuthenticateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null && hasRememberCookie(request)) {
            user = authenticateByRememberToken(request);
            if (user != null) {
                // User authenticated by remember me cookie, set user in session
                // Create a new session if one doesn't exist
                session = request.getSession(true);
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/");
                return user;
            }
        }

        return user; // Return null if no user is authenticated
    }

    public boolean loginAndRememberUser(HttpServletRequest request, HttpServletResponse response, String credential, String password, String rememberMe) throws IOException {
        User user = authenticate(credential, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user); // Store user in session

            if ("on".equals(rememberMe)) {
                String token = createAndStoreRememberToken(user);
                Cookie rememberCookie = new Cookie("remember", token);
                rememberCookie.setMaxAge(60 * 60 * 24 * 30); // 30 days
                rememberCookie.setHttpOnly(true);
                response.addCookie(rememberCookie);
            }
            return true;
        } else {
            return false;
        }
    }

    public void logoutUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                rememberDAO.invalidateTokensForUser(user.getId());
            }
            // Invalidate the session
            session.invalidate();
        }

        // Clear the Remember Me cookie
        Cookie rememberMeCookie = new Cookie("remember", null);
        // Delete the cookie
        rememberMeCookie.setMaxAge(0);
        // Ensure this matches the path where the cookie was set
        rememberMeCookie.setPath(request.getContextPath() + "/");
        response.addCookie(rememberMeCookie);
    }

    private User authenticate(String credential, String password) {
        User user = userDAO.findByCredential(credential);
        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    private String createAndStoreRememberToken(User user) {
        // Generate a secure random token
        String token = UUID.randomUUID().toString();

        // Set the token expiration for 30 days from now
        Date expirationDate = new Date(System.currentTimeMillis() + (30L * 24 * 60 * 60 * 1000));

        Remember rememberToken = new Remember();
        rememberToken.setUserId(user.getId());
        rememberToken.setToken(token);
        rememberToken.setExpirationDate(expirationDate);

        // Store the new remember-me token in the database
        rememberDAO.createRememberToken(rememberToken);

        return token;
    }

    private boolean hasRememberCookie(HttpServletRequest httpRequest) {
        Cookie[] cookies = httpRequest.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("remember".equals(cookie.getName())) {
                    return true;
                }
            }
        }
        return false;
    }

    private User authenticateByRememberToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if ("remember".equals(cookie.getName())) {
                String token = cookie.getValue();
                Remember rememberToken = rememberDAO.findByToken(token);
                if (rememberToken != null) {
                    // The token is valid; find the associated user
                    return userDAO.findByCredential(rememberToken.getUserId());
                }
            }
        }
        return null;
    }
}
