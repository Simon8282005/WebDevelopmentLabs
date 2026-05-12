<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String username = request.getParameter("name");
    String password = request.getParameter("password");
    String currentPassword = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");

        String SQL = "SELECT * FROM userprofile WHERE username = ?";

        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            currentPassword = rs.getString("password");
            break;
        }
        
        if (password.equals(currentPassword)) {
            RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }

        System.out.println("Insertion process done.");
    } catch (Exception e) {
        System.out.println("Somethings went wrong.." + e.getMessage());
        e.printStackTrace();
    }
%>
