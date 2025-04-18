<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">  <!-- Correct path to style.css -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
</head>
<body>

    <!-- Sidebar -->
    <jsp:include page="Sidebar.jsp"/> <!-- Ensure Sidebar.jsp exists at this path -->

    <!-- Main Content -->
    <div class="main-content">
        <div class="topbar">
            <h1>Dashboard</h1>
            <!-- Profile Picture as a Clickable Link -->
            <a href="Profile.jsp" class="profile-link">
                <div class="profile-icon">&#128100;</div>
            </a>
        </div>
        
        <!-- Cards Section -->
        <div class="cards">
            <div class="card blue">Total Donation<br>40Kg</div>
            <div class="card green">Weekly Donation<br>40kg</div>
            <div class="card cyan">Daily Donation<br>0Kkg</div>
        </div>

        <!-- Charts Section -->
        <div class="charts">
            <div class="chart">
                <h3>📊 Bar Chart</h3>
                <canvas id="barChart"></canvas>
            </div>
            <div class="chart">
                <h3>🥧 Pie Chart</h3>
                <canvas id="pieChart"></canvas>
            </div>
        </div>
    </div>

    <!-- JavaScript for Charts -->
    <script>
        // Bar Chart
        const barCtx = document.getElementById('barChart').getContext('2d');
        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['2019', '2020', '2021', '2022', '2023', '2024'],
                datasets: [{
                    label: 'Clients',
                    data: [200, 250, 300, 400, 500, 520],
                    backgroundColor: '#007BFF',
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // Pie Chart
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['Community Food', 'Federal Food', 'State Dollars', 'Northwest Harvest Food', 'Community Dollars'],
                datasets: [{
                    data: [33, 17, 11, 17, 22],
                    backgroundColor: ['#E74C3C', '#007BFF', '#2ECC71', '#F39C12', '#FFC107'],
                }]
            },
            options: { responsive: true }
        });
    </script>

</body>
</html>
