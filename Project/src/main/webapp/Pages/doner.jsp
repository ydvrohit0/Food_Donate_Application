<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doner</title>
</head>

<body style="background-color: #f3f4f6; display: flex; justify-content: center; align-items: center; min-height: 100vh;">

    <div style="background-color: white; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border-radius: 10px; padding: 20px; width: 100%; max-width: 350px; border: 1px solid #d1d5db;">
        
        <!-- Profile Header -->
        <div style="display: flex; align-items: center; gap: 10px;">
            <img src="../assets/profile.jpg" alt="Profile Picture" style="border-radius: 50%; width: 50px; height: 50px; border: 2px solid #d1d5db;">
            <div>
                <h2 style="font-size: 18px; font-weight: bold; margin: 0;">Joshan Kumar Kushwaha</h2>
            </div>
            <button style="margin-left: auto; display: flex; align-items: center; background-color: #1e40af; color: white; padding: 5px 10px; border-radius: 6px; font-size: 14px; border: none; cursor: pointer;">
                <span style="margin-right: 5px;">✎</span> Edit
            </button>
        </div>

        <!-- About Section -->
        <div style="margin-top: 15px;">
            <h3 style="font-size: 16px; font-weight: bold;">Information</h3>
            <p style="color: #374151; margin: 5px 0;">
                <span style="margin-right: 5px;">📞</span> <strong>Phone:</strong> 1234567890
            </p>
            <p style="color: #374151; margin: 5px 0;">
                <span style="margin-right: 5px;">✉️</span> <strong>Email:</strong> example@gmail.com
            </p>
            
        </div>

        <hr style="margin: 15px 0; border: none; border-top: 1px solid #d1d5db;">

        <!-- Address Section -->
        <div>
            
            <p style="color: #374151; margin: 5px 0;">
                <span style="margin-right: 5px;">📍</span> <strong>Address:</strong> RK University
            </p>
            <p style="color: #374151; margin: 5px 0;">
                <span style="margin-right: 5px;">🏙️</span> <strong>City:</strong> Rajkot (Gujarat)
            </p>
            <p style="color: #374151; margin: 5px 0;">
                <span style="margin-right: 5px;">📮</span> <strong>PinCode:</strong> 360020
            </p>
        </div>

    </div>

</body>
</html>
