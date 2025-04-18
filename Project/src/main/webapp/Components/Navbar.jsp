<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <a href="/index.jsp">
                <h1>Food Donate</h1>
            </a>
        </div>
        <ul class="nav-links">
            <li><a href="/index.jsp">Home</a></li>
            <li><a href="../Pages/about.jsp">About</a></li>
            <li><a href="../Pages/service.jsp">Service</a></li>
            <li><a href="../Pages/gallery.jsp">Gallery</a></li>
            <li><a href="../Pages/contact.jsp">Contact</a></li>

            <%
                String userEmail = (String) session.getAttribute("userEmail");
                if (userEmail != null) {
            %>
                <li><a href="../Pages/donate.jsp">Donate Now</a></li>
                <li><a href="../Pages/user_profile.jsp">Profile</a></li>
                <li><a href="../LogoutServlet">Logout</a></li>
            <%
                } else {
            %>
                <li><a href="../Pages/login.jsp">Get Started</a></li>
            <%
                }
            %>
        </ul>
    </nav>
</body>
</html>
