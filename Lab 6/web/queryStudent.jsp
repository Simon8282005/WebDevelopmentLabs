<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Info: </title>
        <style>
            /* ── Page Background ─────────────────────────────── */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f2f5;
                padding: 40px;
            }

            /* ── Table Wrapper ───────────────────────────────── */
            table {
                width: 90%;
                margin: 40px auto;
                border-collapse: collapse;
                background-color: #ffffff;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            /* ── Header Row ──────────────────────────────────── */
            th {
                background-color: #2c3e50;
                color: #ffffff;
                padding: 14px 18px;
                text-align: left;
                font-size: 14px;
                font-weight: 600;
                letter-spacing: 0.5px;
                text-transform: uppercase;
            }

            /* ── Data Cells ──────────────────────────────────── */
            td {
                padding: 12px 18px;
                font-size: 14px;
                color: #34495e;
                border-bottom: 1px solid #e8ecef;
            }

            /* ── Alternating Row Color ───────────────────────── */
            tr:nth-child(even) {
                background-color: #f8f9fa;
            }

            /* ── Hover Effect ────────────────────────────────── */
            tr:hover {
                background-color: #eaf2ff;
            }

            /* skip hover on header row */
            tr:first-child:hover {
                background-color: #2c3e50;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<ArrayList<String>> studentList = new ArrayList<ArrayList<String>>();

            String id = "";
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
                    id = rs.getString("id");
                    name = rs.getString("name");
                    program = rs.getString("program");
                    address = rs.getString("address");

                    ArrayList<String> individualList = new ArrayList<String>();

                    individualList.add(id);
                    individualList.add(name);
                    individualList.add(program);
                    individualList.add(address);

                    studentList.add(individualList);
                }

                System.out.println("Insertion process done.");
            } catch (Exception e) {
                System.out.println("Somethings went wrong.." + e.getMessage());
                e.printStackTrace();
            }
        %>

        <h1>Student Info</h1>
        <table>
            <tr>
                <th>ID </th>
                <th>Name </th>
                <th>Program </th>
                <th>Addresss </th>
            </tr>
            <tr>
            </tr>
            <td><%= studentList.get(0).get(0)%></td>
            <td><%= studentList.get(0).get(1)%></td>
            <td><%= studentList.get(0).get(2)%></td>
            <td><%= studentList.get(0).get(3)%></td>
        </tr>
        <tr>
            <td><%= studentList.get(1).get(0)%></td>
            <td><%= studentList.get(1).get(1)%></td>
            <td><%= studentList.get(1).get(2)%></td>
            <td><%= studentList.get(1).get(3)%></td>
        </tr>
        <tr>
            <td><%= studentList.get(2).get(0)%></td>
            <td><%= studentList.get(2).get(1)%></td>
            <td><%= studentList.get(2).get(2)%></td>
            <td><%= studentList.get(2).get(3)%></td>
        </tr>
    </table>
</body>
</html>
