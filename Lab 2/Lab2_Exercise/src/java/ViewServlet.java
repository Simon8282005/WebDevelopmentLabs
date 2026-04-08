import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(urlPatterns = {"/ViewServlet"})
public class ViewServlet extends HttpServlet {

    private ProductDAO productDAO;
    
    
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();
       
       List<Product> productList = productDAO.selectAllUsers();
       
       out.println("<h2>Product List</h2>");
       out.println("<table border = '1'><tr><th>ID</th><th>Name</th><th>Price</th><th>Category</th><th>Quantity</th><th>Action</th></tr>");
       
       for (Product product : productList) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getPrice() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td><a href= 'UpdateServlet?id=" + product.getId() + "'>Edit</a> | ");    
            out.println("<a href='DeleteServlet?id=" + product.getId() + "'>Delete</a></td>");
            out.println("</tr>");
       }
           
        out.print("</table>");
        out.println("<br><a href='index.html'>Add New Product</a>");
    }
    
}
