import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // Added serialVersionUID

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> products = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM products";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                products.add(rs.getString("name"));
            }
            request.setAttribute("products", products);
        } catch (SQLException e) {
            e.printStackTrace(); // In a real application, you should handle exceptions more gracefully
            // For example, log the error or display an error message to the user.
        }

        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}