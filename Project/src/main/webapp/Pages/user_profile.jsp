<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    // Retrieve user details from session
    String fullName = (String) session.getAttribute("fullName");
    String email = (String) session.getAttribute("userEmail");
    String phone = (String) session.getAttribute("phone");
    String address = (String) session.getAttribute("address");
    String fileName = (String) session.getAttribute("file");

    // Set a default profile picture if none is uploaded
    String profilePic = (fileName != null && !fileName.trim().isEmpty()) 
                            ? "../uploads/" + fileName 
                            : "../assets/profile.jpg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body style="background-color: #f3f4f6; display: flex; justify-content: center; align-items: center; min-height: 100vh;">

    <div style="background-color: white; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border-radius: 10px; padding: 20px; width: 100%; max-width: 350px; border: 1px solid #d1d5db;">
        
        <!-- Profile Header -->
        <div style="display: flex; align-items: center; gap: 10px;">
            <img src="<%= profilePic %>" alt="Profile Picture" style="border-radius: 50%; width: 50px; height: 50px; border: 2px solid #d1d5db;">
            <div>
                <h2 style="font-size: 18px; font-weight: bold; margin: 0;"><%= fullName %></h2>
            </div>
            <form action="<%= request.getContextPath() %>/EditProfileServlet" method="GET" style="margin-left: auto;">
                <button type="submit" style="background-color: #1e40af; color: white; padding: 5px 10px; border-radius: 6px; font-size: 14px; border: none; cursor: pointer;">
                    ✎ Edit
                </button>
            </form>
        </div>

        <!-- ✅ Success/Error Messages -->
        <div style="margin-top: 10px;">
        <%
            String success = (String) session.getAttribute("updateSuccess");
            String error = (String) session.getAttribute("updateError");

            if (success != null) {
        %>
            <p style="color: green; font-weight: bold;"><%= success %></p>
        <%
                session.removeAttribute("updateSuccess");
            } else if (error != null) {
        %>
            <p style="color: red; font-weight: bold;"><%= error %></p>
        <%
                session.removeAttribute("updateError");
            }
        %>
        </div>

        <!-- About Section -->
        <div style="margin-top: 15px;">
            <h3 style="font-size: 16px; font-weight: bold;">Information</h3>
            <p style="color: #374151; margin: 5px 0;">
                <strong>📞 Phone:</strong> <%= phone %>
            </p>
            <p style="color: #374151; margin: 5px 0;">
                <strong>✉️ Email:</strong> <%= email %>
            </p>
        </div>

        <!-- Address Section -->
        <div>
            <p style="color: #374151; margin: 5px 0;">
                <strong>📍 Address:</strong> <%= address %>
            </p>
        </div>

    </div>

</body>
</html>
