<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
        
        String SQL = "INSERT INTO student (id, name, program, address) VALUES (?, ?, ?, ?)";
        
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String program = request.getParameter("program");
        String address = request.getParameter("address");
        
        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, program);
        ps.setString(4, address);
        
        ps.executeUpdate();
        
        System.out.println("Insertion process done.");
        
        response.sendRedirect("displayStudent.jsp");
    } catch (Exception e) {
        System.out.println("Somethings went wrong.." + e.getMessage());
        e.printStackTrace();
    }
%>