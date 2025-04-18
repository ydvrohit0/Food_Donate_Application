<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body style="margin: 0; padding: 0; font-family: Arial, sans-serif;">

<!-- Navbar Section -->
 <%@ include file="../Components/Navbar.jsp" %>

    <!-- Top Image Section -->
    <div style="width: 100%; height: 350px; overflow: hidden;">
        <img src="../assets/Food.png" alt="Donation Image" style="width: 100%; height: 100%; object-fit: cover;">
    </div>
 <!-- Contact Section -->
    <div style="background: url('hexagon-bg.jpg') no-repeat center center/cover; width: 100%; height: 60vh; display: flex; align-items: center; justify-content: center; padding: 20px;">
        
        <!-- Left Side: Address -->
        <div style="width: 40%; color: black; padding: 70px;">
            <h1 style="color: orange;  ">Contact</h1>
            <h3 style="margin: 5px 0;">Address</h3>
            <p style="margin: 5px 0;">RK University Main Campus, Rajkot Gujarat</p>
            <p style="margin: 5px 0;">Mob- 6299448945</p>
            <!-- Social Icons -->
            <div style="margin-top: 15px;">
                <a href="#"><img src="../assets/facebook.png" alt="" style="width: 30px; height: 30px; margin-right: 10px;"></a>
                <a href="#"><img src="../assets/instagram.png" alt="" style="width: 30px; height: 30px; margin-right: 10px;"></a>
                <a href="#"><img src="../assets/twitter.png" alt="Twitter" style="width: 30px; height: 30px;"></a>
            </div>
        </div>

        <!-- Right Side: Contact Form -->
        <div style="width: 50%; background: rgba(255, 255, 255, 0.1); padding: 20px; border-radius: 10px;">
            <form style="display: flex; flex-direction: column; align-items: center; gap: 10px;">
                <input type="text" placeholder="Full Name" style="padding: 10px; width: 80%; max-width: 400px; border-radius: 5px; border: 1px solid #ccc;">
                <input type="text" placeholder="Mobile No." style="padding: 10px; width: 80%; max-width: 400px; border-radius: 5px; border: 1px solid #ccc;">
                <input type="email" placeholder="Email" style="padding: 10px; width: 80%; max-width: 400px; border-radius: 5px; border: 1px solid #ccc;">
                <textarea  placeholder="Tell me about your query" style="padding: 10px; width: 80%; max-width: 400px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
                <button style="background-color: blue; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; width: 57%;">
                    Submit
                </button>
            </form>
        </div>

    </div>
    
    <!-- Footer Section -->
     <%@ include file="../Components/Footer.jsp" %>
</body>
</html>
