<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
</head>
<body>

    <!-- Navbar section -->
    <%@ include file="../Components/Navbar.jsp" %>

    <!-- ✅ Welcome message after login -->
    <%
        if (session.getAttribute("email") != null) {
    %>
        <div class="container mt-3">
            <div class="alert alert-success text-center">
                Welcome, <strong><%= session.getAttribute("email") %></strong>! You're logged in.
            </div>
        </div>
    <%
        }
    %>

    <!-- Carousel section -->
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../assets/p1.png" class="d-block w-100 carousel-image" alt="Slide 1">
            </div>
            <div class="carousel-item">
                <img src="../assets/I6.jpg" class="d-block w-100 carousel-image" alt="Slide 2">
            </div>
            <div class="carousel-item">
                <img src="../assets/p3.jpeg" class="d-block w-100 carousel-image" alt="Slide 3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Impact Data Section -->
    <div class="container text-center mt-5">
        <h2 class="impact-title">CREATING IMPACT SINCE 2025</h2>
        <p class="impact-description">
            For over 2 years, Jeevan Asha has been working for the upliftment of <br> 
            the underserved communities through Education and Health
        </p>
        <div class="row justify-content-center mt-4">
            <div class="col-md-3 impact-box">
                <h3 class="impact-number">4822KG</h3>
                <p class="impact-text">Total donate us</p>
            </div>
            <div class="col-md-3 impact-box">
                <h3 class="impact-number">2491KG</h3>
                <p class="impact-text">Total Quantity of Food</p>
            </div>
            <div class="col-md-3 impact-box">
                <h3 class="impact-number">40000KG</h3>
                <p class="impact-text">Total Donate & Receive</p>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <%@ include file="../Components/Footer.jsp" %>

</body>
</html>
