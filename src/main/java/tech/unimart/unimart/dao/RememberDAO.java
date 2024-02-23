package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.Remember;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class RememberDAO extends DBContext {
    public void createrememberToken(Remember token) {
        String sql = "INSERT INTO remember (userId, token, expirationDate) VALUES (?, ?, ?)";
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
        String sql = "SELECT * FROM remember WHERE token = ?";
        Remember rememberToken = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next() && resultSet.getTimestamp("expiration_date").after(new Date())) { // check whether the token's expiration date is after the current date (ensuring the token is not expired)

                    rememberToken = new Remember();
                    rememberToken.setTokenId(resultSet.getString("token_id"));
                    rememberToken.setUserId(resultSet.getString("user_id"));
                    rememberToken.setToken(resultSet.getString("token"));
                    rememberToken.setExpirationDate(resultSet.getTimestamp("expiration_date"));
                }
            }
        } catch (SQLException e) {
            // Proper exception handling goes here
        }
        return rememberToken;
    }

    public void invalidateTokensForUser(String userId) {
        String sql = "UPDATE remember SET expiration_date = NOW() WHERE user_id = ? AND expiration_date > NOW()";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteToken(String token) {
        String sql = "DELETE FROM remember WHERE token = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


}
