package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.utils.PasswordUtil;

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

    public boolean userIdExists(String userId) {
        String sql = "SELECT COUNT(*) FROM users WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0; // true if count > 0
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String checkUserExists(String id, String email, String phone) {
        String sql = "SELECT 'id' FROM users WHERE id = ? " +
                "UNION SELECT 'email' FROM users WHERE email = ? " +
                "UNION SELECT 'phone' FROM users WHERE phone = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, id);
            ps.setString(2, email);
            ps.setString(3, phone);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    // Returns 'id', 'email', or 'phone' if exists
                    return resultSet.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // No duplicates found
    }

    public boolean createUser(User user) {
        String sql = "INSERT INTO users " +
                "(id, email, phone, password, role, name, gender, dob) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getId());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            // Hash the password
            ps.setString(4, PasswordUtil.hashPassword(user.getPassword()));
            // Set the role default to "C" for customer
            ps.setString(5, "C");
            ps.setString(6, user.getName());
            ps.setString(7, user.getGender());
            // Make sure this is in the correct format
            ps.setString(8, user.getDob());

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
