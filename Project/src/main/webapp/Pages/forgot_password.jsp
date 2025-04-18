<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body style="font-family: Arial; background-color: #f0f0f0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.2); width: 300px;">
    
        <h2 style="text-align: center;">Forgot Password</h2>

        <form action="<%= request.getContextPath() %>/ForgotPasswordServlet" method="post">
            <input type="email" name="email" placeholder="Enter your email" required 
                   style="width: 100%; padding: 10px; margin-top: 10px;">
            <input type="password" name="newPassword" placeholder="Enter new password" required 
                   style="width: 100%; padding: 10px; margin-top: 10px;">
            <button type="submit" style="width: 100%; padding: 10px; margin-top: 15px; background: #ff5733; color: white; border: none; cursor: pointer;">Reset Password</button>
           
        </form>

        <% String message = (String) request.getAttribute("message"); 
           if (message != null) {
        %>
            <p style="color: green; margin-top: 15px; text-align: center;"><%= message %></p>
        <% } %>
    </div>
</body>
</html>
