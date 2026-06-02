package com.dao;

/**
 *
 * @author user
 */

import java.sql.*;
import com.model.Car;
import java.util.ArrayList;

public class CarDAO {
    private Connection conn;
    String URL = "jdbc:mysql://localhost:3306/carshop";
    String USERNAME = "root";
    String PASSWORD = "admin";
    
    private int id = 100;
    
    public CarDAO() {
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
    public ArrayList<Car> findAllCar() {        
        String sql = "SELECT * FROM carpricelist";
        ArrayList<Car> carList = new ArrayList<>();
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                carList.add(new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
                ));
            }
            
            return carList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Select single record
    public Car findCar(int id) {
        String sql = "SELECT * FROM carpricelist WHERE Car_id = ?";
        Car car = null;
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                car = new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
                );
            }
            
            return car;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    // Insert record
    public boolean insertNewCar(String Brand, String Model, int Cyclinder, double Price) {
        String sql = "INSERT INTO carpricelist (Car_id, Brand, Model, Cyclinder, Price) VALUES (?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, generateId());
            ps.setString(2, Brand);
            ps.setString(3, Model);
            ps.setInt(4, Cyclinder);
            ps.setDouble(5, Price);
            int rows = ps.executeUpdate();
            
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // Update record
    public boolean updateCar(int id, String Brand, String Model, int Cyclinder, double Price) {
        String sql = "UPDATE carpricelist SET Brand = ?, Model = ?, Cyclinder = ?, Price = ? WHERE Car_id = ?";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Brand);
            ps.setString(2, Model);
            ps.setInt(3, Cyclinder);
            ps.setDouble(4, Price);
            ps.setInt(5, id);
            int rows = ps.executeUpdate();
            
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
  
    // Delete record
    public boolean deleteCar(int id) {
        String sql = "DELETE FROM carpricelist WHERE Car_id = ?";
        
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
        String SQL = "SELECT Car_id FROM carpricelist ORDER BY Car_id DESC LIMIT 1";
        int numericId = 0;
        
        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ResultSet rs = ps.executeQuery();
            
            if (!rs.next()) {
                numericId += 1;
                return numericId;
            }
            
            while(rs.next()) {
                String currentId = rs.getString("Car_id");
                numericId = Integer.parseInt(currentId);
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
