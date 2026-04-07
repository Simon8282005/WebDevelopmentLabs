package com.lab.dao;

/**
 *
 * @author user
 */

import com.lab.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/cse3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    protected Connection getConnection() {
        Connection conn = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
    // Insert new user
    public void insertUser(User user) {
        String sql = "INSERT INTO users(username, password, roles) VALUES(?, ?, ?)";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getUername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRoles());
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    // View user (For update)
    public User selectUser(int id) {
        User user = null;
        String sql = "SELECT id, username, password, roles FROM users WHERE id =?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Get all the user data where user id = 1
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String roles = rs.getString("roles");
                
                user = new User(id, username, password, roles);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    // View user (For view, so showing all users)
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String roles = rs.getString("roles");
                users.add(new User(id, username, password, roles));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return users;
    }
    
    public boolean updateUser(User user) {
        boolean rowUpdated = false;
        String sql = "UPDATE users SET username = ?, password = ?, roles = ? WHERE id = ?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Get all the user data where user id = 1
            pstmt.setString(1, user.getUername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRoles());
            pstmt.setInt(4, user.getId());
            
            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
    
    // DELETE 
    public boolean deleteUser(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM users WHERE id=?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
                
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return rowDeleted;
    }
}
