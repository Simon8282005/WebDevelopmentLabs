<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info: </title>
    </head>
    <body>
        <%
            int id = 0;
            String name = "";
            String program = "";
            String address = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");

                String SQL = "SELECT * FROM student";

                PreparedStatement ps = conn.prepareStatement(SQL);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    id = rs.getInt("id");
                    name = rs.getString("name");
                    program = rs.getString("program");
                    address = rs.getString("address");
                }

                System.out.println("Insertion process done.");
            } catch (Exception e) {
                System.out.println("Somethings went wrong.." + e.getMessage());
                e.printStackTrace();
            }
        %>

        <h1>Student Info: </h1>
        <p>ID: <%= id %></p>
        <p>Name: <%= name %></p>
        <p>Program: <%= program %></p>
        <p>Address: <%= address %></p>
    </body>
</html>
