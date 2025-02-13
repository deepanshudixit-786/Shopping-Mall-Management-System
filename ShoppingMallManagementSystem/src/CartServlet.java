import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    // Added serialVersionUID to resolve the serialization warning
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get or create session
        HttpSession session = request.getSession();
        
        // Retrieve product and price parameters
        String product = request.getParameter("product");
        String price = request.getParameter("price");
        
        // Validate input
        if (product == null || price == null || product.trim().isEmpty() || price.trim().isEmpty()) {
            // Handle invalid input
            response.sendRedirect("error.jsp");
            return;
        }
        
        // Safely cast or create cart
        @SuppressWarnings("unchecked")
        ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new ArrayList<>();
        }
        
        // Add item to cart
        try {
            // Optionally, you could add more validation here
            cart.add(product + " - ₹" + price);
            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            // Log the error (in a real application, use proper logging)
            System.err.println("Error adding item to cart: " + e.getMessage());
            response.sendRedirect("error.jsp");
        }
    }
}