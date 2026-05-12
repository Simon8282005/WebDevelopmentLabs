<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>First Database page</title>
    </head>
    <body>
        <%
            int id = 0;
            String name = "";
            String email = "";
            String password = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse3023", "root", "admin");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM firsttable");

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    id = rs.getInt("id");
                    name = rs.getString("name");
                    email = rs.getString("email");
                    password = rs.getString("password");
                }
            } catch (Exception e) {
                System.out.println("Somethings went wrong.." + e.getMessage());
                e.printStackTrace();
            }
        %>

        <h1>Here are some data: </h1>
        <p>ID: <%= id%></p>
        <p>Name: <%= name%></p>
        <p>email: <%= email%></p>
        <p>password: <%= password%></p>
    </body>
</html>
