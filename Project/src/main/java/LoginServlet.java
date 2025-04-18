import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email and password must not be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Database credentials
        String jdbcURL = "jdbc:mysql://localhost:3306/food_donate";
        String dbUser = "root";
        String dbPass = "";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Step 1: Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            // Step 2: Create SQL query
            String sql = "SELECT * FROM users_register WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            // Step 3: Execute the query
            rs = stmt.executeQuery();

            // Step 4: Check if user exists
            if (rs.next()) {
                // Fetch user details from the database
                String fullName = rs.getString("fullName");
                String phone = rs.getString("mobile");
                String address = rs.getString("address");
                String fileName = rs.getString("file");
				/* String city = rs.getString("city"); */
//                String pincode = rs.getString("pincode");
//                String ngo = rs.getString("ngo");

                // Store user details in session
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);
                session.setAttribute("fullName", fullName);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                session.setAttribute("file", fileName);
//                session.setAttribute("city", city);
//                session.setAttribute("pincode", pincode);
//                session.setAttribute("ngo", ngo);

                // Redirect to user profile page
                response.sendRedirect("Pages/index.jsp");
            } else {
                // Invalid credentials
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("Pages/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Log the exception to the console
            e.printStackTrace();
            // Provide more specific error messages based on the exception
            String errorMessage = "Something went wrong. Please try again.";
            if (e instanceof SQLException) {
                errorMessage = "Database error: " + e.getMessage();
            } else if (e instanceof ClassNotFoundException) {
                errorMessage = "JDBC driver not found: " + e.getMessage();
            }
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("Pages/login.jsp").forward(request, response);
        } finally {
            try {
                // Clean up resources
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
