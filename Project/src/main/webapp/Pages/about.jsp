<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="../CSS/style.css">
    <style>
        .carousel-img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
        }
        .btn1 {
            background: transparent;
            border: 2px solid black;
            padding: 8px 16px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        
    </style>
</head>
<body>

<!-- Navbar -->
<%@ include file="../Components/Navbar.jsp" %>

<!-- Banner -->
<div class="text-center">
    <img src="../assets/p6.png" alt="Banner" class="img-fluid">
</div>

<!-- Carousel Section -->
<div class="container my-4">
    <div class="carousel slide" id="aboutCarousel" data-bs-ride="carousel">
        <div class="carousel-inner">

            <div class="carousel-item active">
                <div class="row">
                    <div class="col-md-6">
                        <img src="../assets/p7.jpg" class="carousel-img" alt="Slide 1">
                    </div>
                    <div class="col-md-6 d-flex flex-column justify-content-center">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry...</p>
                        <h4>JK Kushwaha</h4>
                        <button class="btn btn-outline-dark w-50">Read More</button>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="row">
                    <div class="col-md-6">
                        <img src="../assets/rohit.jpg" class="carousel-img" alt="Slide 2">
                    </div>
                    <div class="col-md-6 d-flex flex-column justify-content-center">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry...</p>
                        <h4>Rohit Yadav</h4>
                        <button class="btn btn-outline-dark w-50">Read More</button>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="row">
                    <div class="col-md-6">
                        <img src="../assets/satish.jpg" class="carousel-img" alt="Slide 3">
                    </div>
                    <div class="col-md-6 d-flex flex-column justify-content-center">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry...</p>
                        <h4>Satish Das</h4>
                        <button class="btn btn-outline-dark w-50">Read More</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Mission & Vision Section -->
<div class="container my-4">
    <div class="row g-4">
        <div class="col-md-6">
            <div class="bg-secondary text-white p-4 text-center rounded h-100">
                <h2>Our Mission</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry...</p>
                <button class="btn btn-dark">Read More</button>
            </div>
        </div>
        <div class="col-md-6">
            <div class="bg-secondary text-white p-4 text-center rounded h-100">
                <h2>Our Vision</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry...</p>
                <button class="btn btn-dark">Read More</button>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="../Components/Footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
