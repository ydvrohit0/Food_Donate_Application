import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig // This annotation is necessary for file uploads
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Get updated form values
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Get email from session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        // Check session
        if (email == null || email.trim().isEmpty()) {
            session.setAttribute("updateError", "Session expired. Please login again.");
            response.sendRedirect("Pages/user_profile.jsp");
            return;
        }

        // DB credentials
        String jdbcURL = "jdbc:mysql://localhost:3306/food_donate";
        String dbUser = "root";
        String dbPass = "";

        // Default image path
        String newFileName = null;

        // Handle image file upload
        Part filePart = request.getPart("profilePic"); // Retrieve the file part from the form
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + fileName;

            // Create uploads folder if it does not exist
            File uploadDir = new File(getServletContext().getRealPath("") + File.separator + "uploads");
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Save the uploaded file to the server
            filePart.write(uploadPath);

            // Set the new profile image filename
            newFileName = fileName;
        }

        try {
            // Load driver & connect to DB
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            // Update query including image filename
            String sql = "UPDATE users_register SET fullName = ?, phone =	 ?, address = ?, file = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, phone);
            stmt.setString(3, address);
            stmt.setString(4, newFileName); // Save the filename to DB
            stmt.setString(5, email);

            // Execute update
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Update session attributes with new data
                session.setAttribute("fullName", fullName);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                if (newFileName != null) {
                    session.setAttribute("file", newFileName); // Save the filename in session
                }
                session.setAttribute("updateSuccess", "Profile updated successfully.");
            } else {
                session.setAttribute("updateError", "No user found to update.");
            }

            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            session.setAttribute("updateError", "An error occurred while updating your profile. " + e.getMessage());
        }

        // Redirect to profile page
        response.sendRedirect("Pages/user_profile.jsp");
    }

    // Helper method to extract file name from Part object
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 2, cd.length() - 1);
            }
        }
        return null;
    }
}
