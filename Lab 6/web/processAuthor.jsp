<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
        
        String SQL = "INSERT INTO author (authno, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
        
        String authno = request.getParameter("id");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        
        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setString(1, authno);
        ps.setString(2, name);
        ps.setString(3, address);
        ps.setString(4, city);
        ps.setString(5, state);
        ps.setString(6, zip);
        
        ps.executeUpdate();
        
        System.out.println("Insertion process done.");
    } catch (Exception e) {
        System.out.println("Somethings went wrong.." + e.getMessage());
        e.printStackTrace();
    }
%>