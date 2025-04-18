<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        
        return;
    }

    String fullName = (String) session.getAttribute("fullName");
    String phone = (String) session.getAttribute("phone");
    String address = (String) session.getAttribute("address");
    String fileName = (String) session.getAttribute("file");
    String profilePic = (fileName != null && !fileName.trim().isEmpty())
                        ? "../uploads/" + fileName
                        : "../assets/profile.jpg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555555;
        }

        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
        }

        img {
            display: block;
            margin: 10px auto;
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #ccc;
        }

        button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="POST" enctype="multipart/form-data">
        <h2>Edit Profile</h2>

        <img src="<%= profilePic %>" alt="Current Profile Picture" />

        <div>
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= fullName %>" required>
        </div>
        <div>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required>
        </div>
        <div>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="<%= address %>" required>
        </div>
        <div>
            <label for="profilePic">Upload New Profile Picture:</label>
            <input type="file" id="profilePic" name="profilePic" accept="image/*">
        </div>

        <button type="submit">Update Profile</button>
    </form>

</body>
</html>
