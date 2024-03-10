package tech.unimart.unimart.dao;

import tech.unimart.unimart.context.DBContext;
import tech.unimart.unimart.model.User;
import tech.unimart.unimart.utils.PasswordUtil;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public boolean deleteUser(String userId) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> findAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet resultSet = ps.executeQuery()) {
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getString("id"));
                user.setAbout(resultSet.getString("about"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
                user.setName(resultSet.getString("name"));
                user.setGender(resultSet.getString("gender"));
                user.setDob(resultSet.getDate("dob").toLocalDate().toString());
                user.setAddress(resultSet.getString("address"));
                user.setBanned(resultSet.getBoolean("is_banned"));
                user.setCreatedAt(resultSet.getTimestamp("created_at").toLocalDateTime().toString());
                user.setUpdatedAt(resultSet.getTimestamp("updated_at").toLocalDateTime().toString());
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

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
                    user.setAbout(resultSet.getString("about"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    // Assuming password is hashed
                    user.setPassword(resultSet.getString("password"));
                    user.setRole(resultSet.getString("role"));
                    user.setName(resultSet.getString("name"));
                    user.setGender(resultSet.getString("gender"));
                    user.setDob(resultSet.getString("dob"));
                    user.setAddress(resultSet.getString("address"));
                    user.setBanned(resultSet.getBoolean("is_banned"));
                    user.setCreatedAt(resultSet.getString("created_at"));
                    user.setUpdatedAt(resultSet.getString("updated_at"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
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
            ps.setString(5, "customer");
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

    public boolean updateUser(User user) {
        String sql = "UPDATE users " +
                "SET email = ?, phone = ?, role = ?, name = ?, " +
                "gender = ?, dob = ?, address = ?, about = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getName());
            ps.setString(5, user.getGender());
            // Assuming dob is stored in a format compatible with SQL DATE (yyyy-[m]m-[d]d)
            // If dob is a String, ensure it's in the correct format or convert accordingly
            ps.setDate(6, Date.valueOf(user.getDob()));
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getAbout());
            ps.setString(9, user.getId());

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public String checkUserExistsExcludingId(String id, String email, String phone) {
        String sql = "SELECT 'email' FROM users WHERE email = ? AND id != ? " +
                "UNION SELECT 'phone' FROM users WHERE phone = ? AND id != ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, id);
            ps.setString(3, phone);
            ps.setString(4, id);
            try (ResultSet resultSet = ps.executeQuery()) {
                if (resultSet.next()) {
                    // Returns 'email' or 'phone' if a duplicate exists
                    return resultSet.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // No duplicates found
    }

    public boolean updateUserPassword(String userId, String hashedPassword) {
        String sql = "UPDATE users SET password = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, hashedPassword);
            ps.setString(2, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
