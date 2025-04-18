<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <script>
        function validateForm() {
            const email = document.forms["loginForm"]["email"].value.trim();
            const password = document.forms["loginForm"]["password"].value.trim();

            if (email === "" || password === "") {
                alert("Email and Password are required!");
                return false;
            }

            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!email.match(emailPattern)) {
                alert("Invalid email format.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body style="margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #d1d1d1; 
             display: flex; justify-content: center; align-items: center; height: 100vh; flex-direction: column;">

<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>
    <div style="color: green; font-weight: bold; margin-bottom: 20px;"><%= msg %></div>
<%
        session.removeAttribute("msg");
    }

    String error = (String) session.getAttribute("errorMessage");
    if (error != null) {
%>
    <div style="color: red; font-weight: bold; margin-bottom: 10px;"><%= error %></div>
<%
        session.removeAttribute("errorMessage");
    }
%>

<div style="display: flex; width: 50%; min-height: 400px; border-radius: 10px; overflow: hidden; 
            background: white; box-shadow: 0px 4px 10px rgba(0,0,0,0.1);">
    
    <!-- Left Section -->
    <div style="width: 50%; padding: 40px; text-align: center; display: flex; flex-direction: column; justify-content: center;">
        <h2 style="margin-bottom: 20px;">Admin Login</h2>
        
        <form name="loginForm" action="<%= request.getContextPath() %>/AdminServlet" method="POST" onsubmit="return validateForm();" style="width: 100%;">
            <input type="email" name="email" placeholder="Email" required 
                   style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc;">
            <input type="password" name="password" placeholder="Password" required 
                   style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc;">
            <a href="#" style="display: block; margin-top: 10px; color: blue; text-decoration: none;">Forgot Password?</a>
            <button type="submit" style="background: #ff5733; color: white; padding: 10px 20px; border: none; 
                    border-radius: 5px; margin-top: 20px; cursor: pointer;">
                LOGIN
            </button>
        </form>
    </div>

    <!-- Right Section -->
    <div style="width: 50%; background: #ff5c5c; color: white; text-align: center; padding: 40px; display: flex; flex-direction: column; justify-content: center;">
        <h2>Hello, Admin!</h2>
        <p style="margin-top: 10px;">Log in to access the admin dashboard.</p>
    </div>
</div>

</body>
</html>
