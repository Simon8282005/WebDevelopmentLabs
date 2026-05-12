<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
        
        String SQL = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
        
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        
        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, firstname);
        ps.setString(4, lastname);
        
        ps.executeUpdate();
        
        System.out.println("Insertion process done.");
        
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        System.out.println("Somethings went wrong.." + e.getMessage());
        e.printStackTrace();
    }
%>