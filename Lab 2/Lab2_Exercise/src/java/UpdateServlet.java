import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    public void init() {
        productDAO = new ProductDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        
        Product existingProduct = productDAO.selectProduct(id);
        
        out.println("<h2>Update Product</h2>");
        out.println("<form action='UpdateServlet' method='POST'>");
        out.println("<input type='hidden' name='id' value='" + existingProduct.getId() + "'>");
        out.println("Name: <input type='text' name='name' value='" + existingProduct.getName() + "' required><br><br>");
        out.println("Category: <input type='text' name='category' value='" + existingProduct.getCategory() + "' required><br><br>");
        out.println("Price: <input type='number' name='price' value='" + existingProduct.getPrice() + "' required><br><br>");
        out.println("Quantity: <input type='number' name='quantity' value='" + existingProduct.getQuantity() + "' required><br><br>");
        
        String currentCategory = existingProduct.getCategory();
        out.println("Role: <select name='roles'>");
        out.println("<option value='Vegetable' " + (currentCategory.equals
        ("Vegetable") ? "selected" : "") + ">Vegetable</option>");
        out.println("<option value='Meal' " + (currentCategory.equals
        ("Meal") ? "selected" : "") + ">Meal</option>");
        out.println("<option value='Fruit' " + (currentCategory.equals("Fruit") ? "selected" : "") + ">Accessores</option>");
        out.println("</select><br><br>");
        out.println("<input type='submit' value='Update Product'>");
        out.println("</form>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        Product product = new Product(id, name, category, price, quantity);
        productDAO.updateProduct(product);
        
        response.sendRedirect("ViewServlet");
    }
}
