package com.lab.dao;

/**
 *
 * @author user
 */

import com.lab.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    
    // URL that connect to MySQL
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
    
    // Insert new product
    public void insertProduct(Product product) {
        String sql = "INSERT INTO product(name, category, price, quantity) VALUES(?, ?, ?, ?)";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    // View product (For update)
    public Product selectProduct(int id) {
        Product product = null;
        String sql = "SELECT id, name, category, price, quantity FROM product WHERE id =?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Get all the user data where user id = 1
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                product = new Product(id, name, category, price, quantity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return product;
    }
    
    // View user (For view, so showing all users)
    public List<Product> selectAllUsers() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                // Add new product in the list
                products.add(new Product(id, name, category, price, quantity));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return products;
    }
    
    // Update product database
    public boolean updateProduct(Product product) {
        boolean rowUpdated = false;
        String sql = "UPDATE product SET name = ?, category = ?, price = ?, quantity = ? WHERE id = ?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Get all the user data where user id = 1
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());
            
            rowUpdated = pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
    
    // DELETE 
    public boolean deleteProduct(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM product WHERE id=?";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
                
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return rowDeleted;
    }
}
