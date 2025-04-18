<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Donate</title>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body>

<!-- Navbar Section -->
<%@ include file="../Components/Navbar.jsp" %>

<!-- Image Section -->
<div class="banner">
    <img src="../assets/p8.jpg" alt="">
</div>

<div style="display: flex; align-items: center; justify-content: center; width: 80%; margin: 50px auto;">

    <!-- Left Side: Image -->
    <div style="flex: 1; text-align: center;">
        <img src="../assets/p8.jpg" alt="Donate Now"
             style="width: 100%; height:600px; border-radius: 10px;">
    </div>

    <!-- Right Side: Form -->
    <div style="flex: 1; padding: 20px;">

        <% 
            String msg = (String) session.getAttribute("msg");
            if (msg != null) {
        %>
            <div style="background-color: #d1fae5; color: #065f46; padding: 10px; border-radius: 5px; margin-bottom: 15px; text-align: center;">
                <%= msg %>
            </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!-- Donation Form -->
       <form action="<%= request.getContextPath() %>/DonateServlet" method="POST" enctype="multipart/form-data"
              style="max-width:600px; margin: auto; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">

            <!-- Name Field -->
            <input type="text" name="name" placeholder="Name*" required
                   style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">

            <!-- Email Field -->
            <input type="email" name="email" placeholder="Email*" required
                   style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">

            <!-- WhatsApp Number Field -->
            <input type="tel" name="phone" placeholder="WhatsApp Number*" required
                   style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">

            <!-- Food Type Field -->
            <label>Food Type*</label><br>
            <div style="display: flex; gap: 20px;">
                <label><input type="radio" name="food_Type" value="Veg" required> Veg</label>
                <label><input type="radio" name="food_Type" value="Non-Veg" required> Non-Veg</label>
            </div>

            <br>

            <!-- Address Field -->
            <label for="location">Address*</label>
            <input type="text" name="location" placeholder="Enter location" required
                   style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">

            <!-- Quantity Field -->
            <label for="quantity">Food Quantity (Kg)*</label>
            <input type="text" name="quantity" placeholder="Enter food quantity in Kg" required
                   style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">
                   
            <!-- Image Upload Field (Optional) -->
			<label for="image">Upload Image </label>
			<input type="file" name="image"
       				style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;">

            <!-- Additional Notes (Optional) -->
            <label for="notes">Additional Notes </label>
            <textarea name="notes" rows="4" placeholder="Add any extra details if needed..."
                      style="width: 100%; padding: 12px; margin: 10px 0; border: 2px solid #ccc; border-radius: 8px; font-size: 16px;"></textarea>

            <!-- Submit Button -->
            <button type="submit"
                    style="width: 100%; padding: 12px; border: none; background-color: #007bff; color: white; border-radius: 8px; font-size: 16px; cursor: pointer;">
                Donate Now
            </button>
        </form>
    </div>
</div>

<!-- Note Section -->
<div style="width: 95%; margin: 30px auto; padding: 20px; 
            border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-family: Arial, sans-serif; font-size: 16px; line-height: 1.6;">
    <h2 style="margin-bottom: 10px;">Note:</h2>
    <ul style="list-style: none; padding-left: 0;">
        <li style="display: flex; align-items: flex-start; margin-bottom: 10px;">
            <span style="font-size: 20px; color: black; margin-right: 10px;">●</span> 
            It costs us ₹1,500 to provide nutritious, hygienic, and tasty mid-day meals to a child for a year.*
        </li>
        <li style="display: flex; align-items: flex-start; margin-bottom: 10px;">
            <span style="font-size: 20px; color: black; margin-right: 10px;">●</span> 
            We thank the Central Government and various State Governments and UT Administrations for supporting us in serving mid-day meals to children.
        </li>
        <li style="display: flex; align-items: flex-start; margin-bottom: 10px;">
            <span style="font-size: 20px; color: black; margin-right: 10px;">●</span> 
            If you are an account holder of Indian banks and have debit/credit cards issued by these banks, then please select Indian Donors as your donation mode.
        </li>
        <li style="display: flex; align-items: flex-start; margin-bottom: 10px;">
            <span style="font-size: 20px; color: black; margin-right: 10px;">★</span> 
            The ask is for 232 meals per child for an academic year. The equivalent number of meals can also be served for a shorter period for a higher number of children. The amount can also be used for improving school infrastructure or meals.
        </li>
    </ul>
</div>

<!-- Auto scroll Img Section -->
<div style="width: 100%; overflow: hidden; white-space: nowrap;">
    <marquee behavior="scroll" direction="left" scrollamount="5">
        <img src="https://images.pexels.com/photos/29321658/pexels-photo-29321658/free-photo-of-modern-indoor-staircase-with-neon-lights.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="Image 1" style="width: 300px; height: 200px; margin: 10px; border-radius: 10px;">
        <img src="https://images.pexels.com/photos/30122027/pexels-photo-30122027/free-photo-of-photographer-in-yellow-jacket-capturing-fall-nature.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="Image 2" style="width: 300px; height: 200px; margin: 10px; border-radius: 10px;">
        <img src="https://images.pexels.com/photos/30079902/pexels-photo-30079902/free-photo-of-pristine-snowfall-captured-in-winter-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="Image 3" style="width: 300px; height: 200px; margin: 10px; border-radius: 10px;">
        <img src="https://images.pexels.com/photos/30173365/pexels-photo-30173365/free-photo-of-minimalist-flatlay-of-modern-home-office-supplies.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="Image 4" style="width: 300px; height: 200px; margin: 10px; border-radius: 10px;">
    </marquee>
</div>

<!-- Footer Section-->
<%@ include file="../Components/Footer.jsp" %>

</body>
</html>
