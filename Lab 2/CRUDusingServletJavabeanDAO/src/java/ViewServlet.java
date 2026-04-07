import com.lab.dao.UserDAO;
import com.lab.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;
/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/ViewServlet"})
public class ViewServlet extends HttpServlet {

    private UserDAO userDAO;
    
    
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       
       List<User> listUser = userDAO.selectAllUsers();
       
       out.println("<h2>User List</h2>");
       out.println("<table border = '1'><tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th><th>Actions</th></tr>");
       
       for (User user : listUser) {
            out.println("<tr>");
            out.println("<td>" + user.getId() + "</td>");
            out.println("<td>" + user.getUername() + "</td>");
            out.println("<td>" + user.getPassword() + "</td>");
            out.println("<td>" + user.getRoles() + "</td>");
            out.println("<td><a href= 'UpdateServlet?id=" + user.getId() + "'>Edit</a> | ");    
            out.println("<a href='DeleteServlet?id=" + user.getId() + "'>Delete</a></td>");
            out.println("</tr>");
       }
           
        out.print("</table>");
        out.println("<br><a href='index.html'>Add New User</a>");
    }
    
}
