package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.Forgot;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class ForgotDAO extends DBContext {
    public void createPasswordChangeRequest(String userId, String token) {
        String sql = "INSERT INTO forgots (id, user_id) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            // Assuming the token is already hashed
            ps.setString(1, token);
            ps.setString(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getUserIdByToken(String token) {
        String sql = "SELECT user_id FROM forgots WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("user_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Forgot getForgotRequestByToken(String token) {
        String sql = "SELECT * FROM forgots WHERE id = ? AND time > (NOW() - INTERVAL 10 MINUTE)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    Date time = resultSet.getTimestamp("time");
                    String userId = resultSet.getString("user_id");
                    return new Forgot(token, time, userId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // No valid request found or an error occurred
    }


    public void invalidateToken(String token) {
        String sql = "DELETE FROM forgots WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
