import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    // Added serialVersionUID to resolve the serialization warning
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Try-with-resources for database connection
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {
            
            // Set prepared statement parameters
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Valid user, create session
                    HttpSession session = request.getSession();
                    session.setAttribute("user", username);
                    
                    // Optional: You might want to set a timeout for the session
                    session.setMaxInactiveInterval(30 * 60); // 30 minutes
                    
                    response.sendRedirect("home.jsp");
                } else {
                    // Invalid login
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            // Log the error (replace with proper logging in production)
            System.err.println("Database error during login: " + e.getMessage());
            
            // Send user to an error page
            request.setAttribute("errorMessage", "A database error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            // Catch any unexpected errors
            System.err.println("Unexpected error during login: " + e.getMessage());
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}