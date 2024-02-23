package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DBContext {
    public User findByCredential(String credential) {
        String sql = "SELECT * FROM users WHERE id = ? OR email = ? OR phone = ?";
        User user = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, credential);
            ps.setString(2, credential);
            ps.setString(3, credential);

            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getString("id"));
                    user.setName(resultSet.getString("name"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    user.setPassword(resultSet.getString("password")); // Assuming password is hashed
                    // ... set other fields
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
