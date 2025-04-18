<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Food Donation</title>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f8f8f8;">

<!-- Navbar Section -->
 <%@ include file="../Components/Navbar.jsp" %>
   
<div class="banner">
        <img src="../assets/img2.jpg" alt="">
    </div>

<!-- Container -->
    <div style="display: flex; justify-content: center; gap: 20px; margin-top: 50px; font-family: Arial, sans-serif; text-align: center; ">

        <!-- Donors Section -->
        <div style="border: 2px solid black; padding: 20px; width:47%; 
                    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2); border-radius: 10px;background-color:#fff">
            <h2 style="margin: 0; padding-bottom: 10px;">Donors</h2>
            <ul style="list-style-type: none; padding: 0; margin: 0;">
                <li style="margin-bottom: 8px;">🔴 <b>Individuals</b> – Anyone with extra packaged or fresh food can donate.</li>
                <li style="margin-bottom: 8px;">🔴 <b>Restaurants & Cafés</b> – Can contribute unsold but safe-to-eat meals.</li>
                <li style="margin-bottom: 8px;">🔴 <b>Supermarkets</b> – Can donate surplus grocery items safe-to-eat meals.</li>
            </ul>
        </div>

        <!-- Receivers Section -->
        <div style="border: 2px solid black; padding: 20px; width:47%; 
                    box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2); border-radius: 10px;background-color:#fff">
            <h2 style="margin: 0; padding-bottom: 10px;">Receives</h2>
            <ul style="list-style-type: none; padding: 0; margin: 0;">
                <li style="margin-bottom: 8px;">⚫ <b>NGOs</b> – Distribute food to homeless, orphanages, and disaster.</li>
                <li style="margin-bottom: 8px;">⚫ <b>Shelters & Community Centers</b> – Provide meals to the needy.</li>
                <li style="margin-bottom: 8px;">⚫ <b>Needy Individuals & Families</b> – Support for low-income groups.</li>
            </ul>
        </div>

    </div>

    <!-- Time Availability Section -->
    <div style="margin-top: 30px; border: 2px solid black; padding: 20px; width: 95%; 
                margin-left: auto; margin-right: auto; text-align: center; font-family: Arial, sans-serif;
                box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2); border-radius: 10px;background-color:#fff;">
        <h2 style="margin: 0; padding-bottom: 10px;">Time</h2>
        <p style="font-size: 24px; margin: 0;"><b>24x7 Available</b></p>
    </div>






    <!-- Our Location Section -->
    <div style="width: 100%; padding: 40px; background: #e8e8e8; margin-top: 40px;">
        <h2 style="text-align: center; color: #2c3e50; font-size: 32px;">Our Location</h2>
        <p style="text-align: center; color: #555; font-size: 18px;">Visit our headquarters or find a nearby donation center in Rajkot, India.</p>

        <!-- Google Maps Embed -->
        <div style="width: 100%; display: flex; justify-content: center; margin-top: 20px;">
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.969716370864!2d70.78292827462602!3d22.303894079672494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959cb2b5ab813d1%3A0x364bc84e6aeb9b27!2sRajkot%2C%20Gujarat%2C%20India!5e0!3m2!1sen!2sin!4v1707654321000!5m2!1sen!2sin" 
                width="90%" 
                height="450" 
                style="border:0; border-radius: 8px;" 
                allowfullscreen=""
                    loading="lazy">
                </iframe>
            </div>
        </div>

    </div>
    
     <!-- Footer Section -->

    <%@ include file="../Components/Footer.jsp" %>

    

</body>
</html>
