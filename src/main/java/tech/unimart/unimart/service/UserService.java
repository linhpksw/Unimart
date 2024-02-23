package tech.unimart.unimart.service;
import tech.unimart.unimart.dao.RememberDAO;
import tech.unimart.unimart.dao.UserDAO;
import tech.unimart.unimart.model.Remember;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.utils.PasswordUtil;

import java.util.Date;
import java.util.UUID;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    private final RememberDAO rememberDAO = new RememberDAO(); // Set up this DAO with a connection

    public User authenticate(String credential, String password) {
        User user = userDAO.findByCredential(credential);
        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    public String createAndStoreRememberToken(User user) {
        String token = UUID.randomUUID().toString(); // Generate a secure random token
        Date expirationDate = new Date(System.currentTimeMillis() + (30L * 24 * 60 * 60 * 1000)); // Set the token expiration for 30 days from now

        Remember rememberToken = new Remember();
        rememberToken.setUserId(user.getId());
        rememberToken.setToken(token);
        rememberToken.setExpirationDate(expirationDate);

        // Store the new remember-me token in the database
//        rememberDAO.createRememberMeToken(rememberToken);

        return token;
    }

    public User authenticateByRememberToken(String token) {
        Remember rememberToken = rememberDAO.findByToken(token);
        if (rememberToken != null) {
            // The token is valid; find the associated user
            return userDAO.findByCredential(rememberToken.getUserId());
        }
        // Token is not valid or expired
        return null;
    }

    public void invalidateUserRememberToken(String userId) {
        rememberDAO.invalidateTokensForUser(userId);
    }

    public void removeRememberToken(String token) {
        rememberDAO.deleteToken(token);
    }

    public boolean isTokenExpired(String token) {
        Remember rememberToken = rememberDAO.findByToken(token);
        if (rememberToken != null) {
            return rememberToken.getExpirationDate().before(new Date()); // Check if the token's expiration date is before the current date
        }
        return true; // If the token does not exist, consider it expired
    }

}
