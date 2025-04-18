

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditProfileServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Fetch user data from session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            response.sendRedirect("login.jsp"); // redirect if not logged in
            return;
        }

        // Send the current user info to the edit profile page
        request.setAttribute("email", session.getAttribute("userEmail"));
        request.setAttribute("fullName", session.getAttribute("fullName"));
        request.setAttribute("phone", session.getAttribute("phone"));
        request.setAttribute("address", session.getAttribute("address"));
        request.getRequestDispatcher("Pages/edit_profile.jsp").forward(request, response);
	}

}
