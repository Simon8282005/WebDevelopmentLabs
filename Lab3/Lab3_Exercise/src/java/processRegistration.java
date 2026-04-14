import com.object.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author user
 */

/*
    Using session to store the user data
*/

@WebServlet(urlPatterns = {"/processRegistration"})
public class processRegistration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentName = request.getParameter("name");
        String matricNum = request.getParameter("matric");
        String club = request.getParameter("club");
        
        // Create the session
        // true means create one if no one is created
        HttpSession session = request.getSession(true);
        
        // Get the list from the previous session
        ArrayList<Student> studentList = (ArrayList<Student>) session.getAttribute("studentList");
        
        if (studentList == null) {
            studentList = new ArrayList<>();
        }
        
        studentList.add(new Student(studentName, matricNum, club));
        
        // Save and upadte list into the session
        session.setAttribute("studentList", studentList);
        
        // Redirect to other page to display result
        response.sendRedirect("memberDirectory.jsp");
    }
}
