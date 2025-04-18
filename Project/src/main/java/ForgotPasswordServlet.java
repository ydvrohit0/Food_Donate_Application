import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        String jdbcURL = "jdbc:mysql://localhost:3306/food_donate";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            String sql = "UPDATE users_register SET password = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword); // Note: Hash passwords in production!
            stmt.setString(2, email);

            int updated = stmt.executeUpdate();
            conn.close();

            if (updated > 0) {
                // Redirect to login.jsp with success message
                String message = URLEncoder.encode("Password updated successfully! Please log in.", "UTF-8");
                response.sendRedirect("Pages/login.jsp?message=" + message);
            } else {
                // Redirect to forgot_password.jsp with error
                String message = URLEncoder.encode("Email not found. Please try again.", "UTF-8");
                response.sendRedirect("Pages/forgot_password.jsp?message=" + message);
            }

        } catch (Exception e) {
            e.printStackTrace();
            String message = URLEncoder.encode("Something went wrong. Please try again.", "UTF-8");
            response.sendRedirect("Pages/forgot_password.jsp?message=" + message);
        }
    }
}
