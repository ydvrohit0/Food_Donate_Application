<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Gallery</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
           
        }
        .gallery-container {
            max-width: 90%;
            margin: auto;
        }
        .gallery-item {
            position: relative;
            overflow: auto;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        .gallery-item:hover {
            transform: scale(1.05);
        }
        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }
       
    </style>
</head>
<body>

<!-- Navbar Section -->
<%@ include file="../Components/Navbar.jsp" %>
 
 <!--Image Section -->
 <div class="banner">
        <img src="../assets/p6.png" alt="">
    </div>

<br>

<!-- Gallery Image  Section-->
<div class="container gallery-container">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/11.png" alt="Gallery Image 1">
            </div>
        </div>
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/I2.jpeg" alt="Gallery Image 2">
            </div>
        </div>
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/I3.jpeg" alt="Gallery Image 3">
            </div>
        </div>
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/I4.jpg" alt="Gallery Image 4">
            </div>
        </div>
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/I5.jpg" alt="Gallery Image 5">
            </div>
        </div>
        <div class="col-md-4">
            <div class="gallery-item">
                <img src="../assets/I6.jpg" alt="Gallery Image 6">
            </div>
        </div>
    </div>
</div>
<br>

<!-- Footer Section -->
    <%@ include file="../Components/Footer.jsp" %>

</body>
</html>
