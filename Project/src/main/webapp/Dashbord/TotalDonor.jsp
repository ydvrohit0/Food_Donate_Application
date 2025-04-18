<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*" %>
<%@ page session="true" %>

<%
    // Session check
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
      
    }

    // List to store all users
    List<Map<String, String>> userList = new ArrayList<>();

    // JDBC code
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_donate", "root", "");
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM donations");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> user = new HashMap<>();
            user.put("name", rs.getString("name"));
            user.put("email", rs.getString("email"));
            user.put("phone", rs.getString("phone"));
            user.put("foodtype", rs.getString("foodtype"));
            user.put("location", rs.getString("location"));
            user.put("quantity", rs.getString("quantity"));
            user.put("notes", rs.getString("notes"));
            user.put("file", rs.getString("file"));
           
            userList.add(user);
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Total Users</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <!-- Sidebar -->
    <jsp:include page="Sidebar.jsp"/>

    <div class="main-content">
        <div class="topbar">Total Donation</div>

        <div class="table-container">
            <table border="1" cellpadding="8" cellspacing="0">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>FoodType</th>
                    <th>Location</th>
                    <th>Quantity</th>
                    <th>notes</th>
                    <th>Image</th>
                    
                </tr>

                <% for (Map<String, String> user : userList) { 
                    String file = user.get("file");
                    String profilePic = (file != null && !file.trim().isEmpty()) ? "../uploads/" + file : "../assets/profile.jpg";
                %>
                    <tr>
                        <td><%= user.get("name") %></td>
                        <td><%= user.get("email") %></td>
                        <td><%= user.get("phone") %></td>
                        <td><%= user.get("foodtype") %></td>
                        <td><%= user.get("location") %></td>
                        <td><%= user.get("quantity") %></td>
                        <td><%= user.get("notes") %></td>
                        
                        <td>
                            <img src="<%= profilePic %>" width="50" height="50" style="border-radius: 50%;">
                        </td>
                    </tr>
                <% } %>
            </table>
        </div>
    </div>

</body>
</html>
