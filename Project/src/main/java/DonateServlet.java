import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/DonateServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class DonateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String foodType = request.getParameter("food_Type");
        String location = request.getParameter("location");
        String quantity = request.getParameter("quantity");
        String notes = request.getParameter("notes");

        // Handle image upload
        Part filePart = request.getPart("image");
        String fileName = getFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Save to DB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/food_donate", "root", ""
            );

            // Make sure DB table columns match these names
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO donations (name, email, phone, foodType, location, quantity, notes, file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, foodType);
            ps.setString(5, location);
            ps.setString(6, quantity);
            ps.setString(7, notes);
            ps.setString(8, fileName);

            int i = ps.executeUpdate();

            HttpSession session = request.getSession();
            if (i > 0) {
                session.setAttribute("msg", "Donation successful!");
            } else {
                session.setAttribute("msg", "Donation failed!");
            }

            con.close();

            // Redirect properly to JSP page
            response.sendRedirect(request.getContextPath() + "/Pages/index.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default_file";
    }
}
