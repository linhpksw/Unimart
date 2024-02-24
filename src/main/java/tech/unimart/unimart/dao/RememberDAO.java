package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.Remember;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class RememberDAO extends DBContext {
    public void createRememberToken(Remember token) {
        String sql = "INSERT INTO remembers (user_id, token, expiration_date) VALUES (?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token.getUserId());
            ps.setString(2, token.getToken());
            ps.setTimestamp(3, new Timestamp(token.getExpirationDate().getTime()));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Remember findByToken(String token) {
        String sql = "SELECT * FROM remembers WHERE token = ?";
        Remember rememberToken = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet resultSet = ps.executeQuery()) {
                // If the token is found and not expired, return it
                if (resultSet.next() && resultSet.getTimestamp("expiration_date").after(new Date())) {
                    rememberToken = new Remember();
                    rememberToken.setUserId(resultSet.getString("user_id"));
                    rememberToken.setToken(resultSet.getString("token"));
                    rememberToken.setExpirationDate(resultSet.getTimestamp("expiration_date"));
                }
            }
        } catch (SQLException e) {
            // Proper exception handling goes here
            System.out.println(e);
        }
        return rememberToken;
    }

    public void invalidateTokensForUser(String userId) {
        // This ensure that all devices are logged out when the user logs out from one device
        String sql = "UPDATE remembers SET expiration_date = NOW() WHERE user_id = ? AND expiration_date > NOW()";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
