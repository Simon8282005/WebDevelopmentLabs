/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author user
 */
public class registerServlet extends HttpServlet {

    String URL = "jdbc:mysql://localhost:3306/cse3023";
    String USERNAME = "root";
    String PASSWORD = "admin";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            String SQL = "INSERT INTO mini_project_student (name, subject, mark) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("subjectList"));
            ps.setFloat(3, Float.parseFloat(request.getParameter("mark")));

            ps.executeUpdate();

            System.out.println("Insert new student record successfully. ");

            ps.close();
            conn.close();

            response.sendRedirect(request.getContextPath() + "/viewStudentList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/registerStudent.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return null;
    }
}
