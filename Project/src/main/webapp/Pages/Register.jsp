<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body style="margin: 0; padding: 0; font-family: Arial, sans-serif; background-color: #d1d1d1;
             display: flex; justify-content: center; align-items: center; height: 100vh;">

    <div style="display: flex; width: 50%; min-height: 500px; border-radius: 10px; 
                overflow: hidden; background: white; box-shadow: 0px 4px 10px rgba(0,0,0,0.1);">
        
        <!-- Left Section (Welcome) -->
        <div style="width: 50%; background: #ff5c5c; color: white; text-align: center; padding: 40px; 
                    display: flex; flex-direction: column; justify-content: center;">
            <h2>Hello, Friend!</h2>
            <p style="margin-top: 10px;">Join us today and experience the best services.</p>
           <a href="<%= request.getContextPath() %>/Pages/login.jsp"  
   			style="display: inline-block; background: white; color: #ff5c5c; padding: 10px 20px; 
          	border-radius: 20px; margin-top: 20px; cursor: pointer; text-decoration: none;">
    		SIGN IN
			</a>

        </div>
       
        
        <!-- Right Section (Sign Up) -->
        <div style="width: 50%; padding: 40px; text-align: center; display: flex; flex-direction: column; justify-content: center;">
            <h2 style="margin-bottom: 20px;">Sign up</h2>

            <%-- ✅ Show error if email already exists --%>
            <%
                String error = (String) request.getAttribute("errorMessage");
                if (error != null) {
            %>
                <div style="color: red; font-weight: bold; margin-bottom: 10px;"><%= error %></div>
            <%
                }
            %>

            <form action="<%= request.getContextPath() %>/RegisterServlet" method="POST" enctype="multipart/form-data" style="width: 100%;">
                <input type="text" placeholder="Full Name" name="fullName" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <input type="email" placeholder="Email" name="email" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <input type="password" placeholder="Password" name="password" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <input type="text" placeholder="Mobile No." name="mobile" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <input type="text" placeholder="Address" name="address" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <input type="file" name="file" required 
                       style="width: 90%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; display: block;">
                <button type="submit" 
                        style="background: #ff5733; color: white; padding: 10px 20px; 
                               border: none; border-radius: 5px; margin-top: 20px; cursor: pointer; outline: none;">
                    SIGN UP
                </button>
            </form>
        </div>
    </div>
</body>
</html>
