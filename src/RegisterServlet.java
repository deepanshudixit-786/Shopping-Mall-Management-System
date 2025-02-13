import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");  // Get email (but decide if you'll use it)
        String password = request.getParameter("password"); // **HASH THIS PASSWORD BEFORE STORING IT**
        String role = request.getParameter("role");

        try (Connection conn = DBConnection.getConnection()) {
            String query;
            PreparedStatement ps;

            if (email != null && !email.isEmpty()) { // Check if email is provided
                query = "INSERT INTO users (username, password, role, email) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(query);
                ps.setString(4, email); // Set email parameter
            } else {
                query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
                ps = conn.prepareStatement(query);
            }

            ps.setString(1, username);
            ps.setString(2, password); // **HASH THIS PASSWORD BEFORE STORING IT**
            ps.setString(3, role);

            int result = ps.executeUpdate();
            if (result > 0) {
                request.setAttribute("successMessage", "Registration successful!");
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // **Replace with proper logging!**
            request.setAttribute("errorMessage", "Database error: " + e.getMessage()); // Don't expose raw exception details in production
        }

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}