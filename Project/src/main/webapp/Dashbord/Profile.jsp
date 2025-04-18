<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("adminemail");
    if (userEmail == null) {
       
    }

    // Retrieve user details from session
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("adminemail");
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>

    <style>
        /* Add some basic styles here */
    </style>


</head>
<body>

    <!-- Include Sidebar -->
    <jsp:include page="Sidebar.jsp"/>

    <!-- Main Content -->
    <div class="main-content">
        <div class="topbar">Profile</div>

        <!-- Profile Section -->
        <div class="profile-container">
            <img src="profile.jpg" alt="Profile Picture" class="profile-pic" >
            <div class="profile-info">
                <h3><%= username %></h3>
                <p><strong>Username:</strong> <%= username %></p>
                <p><strong>Email:</strong> <%=email %></p>
                <p><strong>Phone:</strong> <%= phone %></p>
                <p><strong>Address:</strong> <%= address %></p>
                
            </div>
           
        </div>
    </div>

</body>
</html>
