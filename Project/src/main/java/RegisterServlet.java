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
import java.sql.ResultSet;

@WebServlet("/RegisterServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_donate", "root", "");

            // 🔒 Check if email already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT id FROM users_register WHERE email = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Email already registered
                request.setAttribute("errorMessage", "Email already registered!");
                request.getRequestDispatcher("/Pages/Register.jsp").forward(request, response);
                return;
            }

            // ✅ Insert new user
            PreparedStatement ps = con.prepareStatement("INSERT INTO users_register (fullName, email, password, mobile, address, file) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, fName);
            ps.setString(2, email);
            ps.setString(3, password); // Recommend hashing later!
            ps.setString(4, mobile);
            ps.setString(5, address);
            ps.setString(6, fileName);

            int i = ps.executeUpdate();

            if (i > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Registration Successful!");
                response.sendRedirect(request.getContextPath() + "/Pages/login.jsp");
            } else {
                response.getWriter().print("<h3>Registration Failed!</h3>");
            }

            con.close();
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
