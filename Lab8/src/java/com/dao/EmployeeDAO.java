package com.dao;

/**
 *
 * @author user
 */

import java.sql.*;
import com.model.Employee;
import java.util.ArrayList;

public class EmployeeDAO {
    private Connection conn;
    String URL = "jdbc:mysql://localhost:3306/cse3023";
    String USERNAME = "root";
    String PASSWORD = "admin";
    
    private int id = 100;
    
    public EmployeeDAO() {
        conn = getConnection();
    }
    
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        
            return connection;
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Select all record
    public ArrayList<Employee> findAllEmployees() {        
        String sql = "SELECT * FROM employees";
        ArrayList<Employee> employeeList = new ArrayList<>();
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                employeeList.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("Name"),
                    rs.getString("Email"),
                    rs.getString("Position")
                ));
            }
            
            return employeeList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Select single record
    public Employee findEmployee(int id) {
        String sql = "SELECT * FROM employees WHERE id = ?";
        Employee emp = null;
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                emp = new Employee(
                    rs.getInt("id"),
                    rs.getString("Name"),
                    rs.getString("Email"),
                    rs.getString("Position")
                );
            }
            
            return emp;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Insert record
    public boolean insertNewEmployee(String name, String email, String position) {
        String sql = "INSERT INTO employees (id, name, email, position) VALUES (?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, generateId());
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, position);
            int rows = ps.executeUpdate();
            
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // Update record
    public boolean updateEmployee(int id, String name, String email, String position) {
        String sql = "UPDATE employees SET name = ?, email = ?, position = ? WHERE id = ?";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, position);
            ps.setInt(4, id);
            int rows = ps.executeUpdate();
            
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
  
    // Delete record
    public boolean deleteEmployee(int id) {
        String sql = "DELETE FROM employees WHERE id = ?";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    private int generateId() {
        String SQL = "SELECT id FROM employees ORDER BY id DESC LIMIT 1";
        
        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                String currentId = rs.getString("id");
                int numericId = Integer.parseInt(currentId);
                numericId += 1;
                System.out.println(numericId);
                return numericId++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return -1;
    }
}
