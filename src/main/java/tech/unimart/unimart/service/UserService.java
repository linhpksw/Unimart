package tech.unimart.unimart.service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.unimart.unimart.dao.ForgotDAO;
import tech.unimart.unimart.dao.RememberDAO;
import tech.unimart.unimart.dao.UserDAO;
import tech.unimart.unimart.model.Forgot;
import tech.unimart.unimart.model.Remember;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.utils.EmailUtil;
import tech.unimart.unimart.utils.PasswordUtil;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    private final RememberDAO rememberDAO = new RememberDAO();

    private final ForgotDAO forgotDAO = new ForgotDAO();

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

    public String updateUser(HttpServletRequest request, User user) {
        // First, check if updating to the new email or phone would cause duplication
        String duplicateField = userDAO.checkUserExistsExcludingId(user.getId(), user.getEmail(), user.getPhone());

        if (duplicateField != null) {
            return duplicateField + " already exists";
        }

        // Attempt to update the user
        boolean updated = userDAO.updateUser(user);
        if (!updated) {
            return "Failed to update user";
        }

        // Update the user object in the session
        // Get the current session without creating a new one
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Update the user object in the session
            session.setAttribute("user", user);
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
            // Store user in session
            session.setAttribute("user", user);

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

    public User getUserFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return (session != null) ? (User) session.getAttribute("user") : null;
    }

    public String initiatePasswordReset(String credential, HttpServletRequest request) {
        User user = userDAO.findByCredential(credential);
        String userId = user.getId();
        String email = user.getEmail();

        String token = UUID.randomUUID().toString();
        String hashedToken = PasswordUtil.hashPassword(token);

        forgotDAO.createPasswordChangeRequest(userId, hashedToken);

        String baseUrl = request.getScheme() + "://" + request.getServerName();
        if (request.getServerPort() != 80 && request.getServerPort() != 443) {
            baseUrl += ":" + request.getServerPort();
        }
        baseUrl += request.getContextPath();

        String resetLink = baseUrl + "/reset?token=" + token;

        boolean emailSent = EmailUtil.sendPasswordResetEmail(email, resetLink);

        return emailSent ? email + " sending success" : email + " sending failed";
    }

    public boolean validatePasswordResetToken(String token) {
        // Logic to validate the token, including checking if it's expired
        // This would involve querying the `forgots` table for the hashed token and comparing timestamps
        // Return true if valid and not expired, false otherwise
        Forgot forgotRequest = forgotDAO.getForgotRequestByToken(token);
        if (forgotRequest != null) {
            long timeElapsed = new Date().getTime() - forgotRequest.getTime().getTime();
            long tenMinutesInMillis = 600000; // 10 minutes in milliseconds
            // Token is valid if it's been less than 10 minutes
            return timeElapsed < tenMinutesInMillis;
        }
        return false;
    }

    public boolean resetPassword(String token, String newPassword) {
        // Get the user ID associated with the token
        String userId = forgotDAO.getUserIdByToken(token);

        // Hash the new password
        String hashedPassword = PasswordUtil.hashPassword(newPassword);

        // Update the user's password in the database
        boolean passwordUpdated = userDAO.updateUserPassword(userId, hashedPassword);

        // Invalidate the token after use
        forgotDAO.invalidateToken(token);

        return passwordUpdated;
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
