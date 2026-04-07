import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/ViewServlet"})
public class ViewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       
       out.println("<h2>User List</h2>");
       out.println("<table border = '1'><tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th><th>Actions</th></tr>");
       
       try {
           Class.forName("com.mysql.cj.jdbc.Drive");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin");
           
           Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery("SELECT * FROM users");
           
           while(rs.next()) {
                int id = rs.getInt("id");
                out.println("<tr>");
                out.println("<td>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + rs.getString("username") + "</td>");
                out.println("<td>" + rs.getString("password") + "</td>");
                out.println("<td>" + rs.getString("roles") + "</td>");
                out.println("<td><a href= 'UpdateServlet?id=" + id + ">Edit</a> |");    
                out.println("<a href='DeleteServlet?id=" + id + "'>Delete</a></td>'");
                out.println("</tr>");
           }
           
           out.print("</table>");
           out.println("<br><a href='index.html'>Add New User</a>");
           
           rs.close();
           stmt.close();
           conn.close();
           
       } catch (Exception e) {
           e.printStackTrace();
       }
    }
}
