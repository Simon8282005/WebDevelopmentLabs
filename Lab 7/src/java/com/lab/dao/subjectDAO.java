package com.lab.dao;

import com.lab.bean.subjectBean;
import java.sql.*;
import java.util.ArrayList;

public class subjectDAO {

    String URL = "jdbc:mysql://localhost:3306/cse3023";
    Connection conn = null;
    int id = 0;
    ArrayList<subjectBean> subjectList = new ArrayList<>();

    public subjectDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, "root", "admin");

            System.out.println("Database connected. ");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Create new subject
    public boolean insertSubject(String matric_no, String subjectName, String subjectCode) {
        String SQL = "INSERT INTO registered_subjects(id, matric_no, subject_name, subject_code) VALUES(?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, generateSubjectId());
            ps.setString(2, matric_no);
            ps.setString(3, subjectName);
            ps.setString(4, subjectCode);
            ps.executeUpdate();

            System.out.println("Insert new subject succesfully.");

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update current subject
    public boolean updateSubject(String subjectName, String subjectCode, String id) {
        String SQL = "UPDATE registered_subjects SET subject_name = ?, subject_code = ? WHERE id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, subjectName);
            ps.setString(2, subjectCode);
            ps.setString(3, subjectCode);
            ps.executeUpdate();

            System.out.println("Update database successfully.");

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Read subject (List)
    public ArrayList<subjectBean> viewSubject() {
        try {
            String SQL = "SELECT * FROM registered_subjects";
            PreparedStatement ps = conn.prepareStatement(SQL);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                subjectList.add(new subjectBean(
                        rs.getString("matric_no"),
                        rs.getString("subject_name"),
                        rs.getString("subject_code"))
                );
            }

            return subjectList;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Read subject by subject code
    public subjectBean viewSubjectBySubjectCode(String subjectCode) {
        try {
            String SQL = "SELECT * FROM registered_subjects WHERE subject_code = ?";
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, subjectCode);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return (new subjectBean(
                        rs.getString("matric_no"),
                        rs.getString("subject_name"),
                        rs.getString("subject_code")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Delete specific subject
    public boolean deleteSubject(int subjectId) {
        return false;
    }

    // Gain the last id from database
    public String generateSubjectId() {
        try {
            String SQL = "SELECT * FROM registered_subjects ORDER BY id DESC LIMIT 1";
            PreparedStatement ps = conn.prepareStatement(SQL);

            ResultSet rs = ps.executeQuery();

            int numericId = 0;
            String newId = "";

            if (rs.next()) {
                numericId = rs.getInt("id");
            } else {
                numericId = 0;
            }

            numericId++;
            newId = String.format("A%03d", numericId);

            return newId;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "";
    }
}
