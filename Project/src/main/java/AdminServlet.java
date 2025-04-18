import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email and password must not be empty.");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/food_donate";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	
            	String username = rs.getString("username");
            	String phone = rs.getString("phone");
            	String address = rs.getString("address");
            	
            	
                HttpSession session = request.getSession();
                session.setAttribute("adminemail", email);
                session.setAttribute("username", username);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                

                response.sendRedirect(request.getContextPath() + "/Dashbord/Dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("/admin.jsp").forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
        }
    }
}
