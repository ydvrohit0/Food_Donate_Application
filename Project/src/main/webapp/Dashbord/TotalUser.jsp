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
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users_register");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> user = new HashMap<>();
            user.put("fullName", rs.getString("fullName"));
            user.put("email", rs.getString("email"));
            user.put("mobile", rs.getString("mobile"));
            user.put("address", rs.getString("address"));
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
        <div class="topbar">Total Users</div>

        <div class="table-container">
            <table border="1" cellpadding="8" cellspacing="0">
                <tr>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>Profile</th>
                </tr>

                <% for (Map<String, String> user : userList) { 
                    String file = user.get("file");
                    String profilePic = (file != null && !file.trim().isEmpty()) ? "../uploads/" + file : "../assets/profile.jpg";
                %>
                    <tr>
                        <td><%= user.get("fullName") %></td>
                        <td><%= user.get("email") %></td>
                        <td><%= user.get("mobile") %></td>
                        <td><%= user.get("address") %></td>
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
