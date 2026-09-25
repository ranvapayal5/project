<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Pets</title>
    <style>
       body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background: #333; color: white; }
        .btn { padding: 5px 10px; text-decoration: none; color: white; border-radius: 3px; }
        .delete { background: red; }
        .dashboard-btn { display: inline-block; background: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold; transition: background 0.3s ease-in-out; }
        .dashboard-btn:hover {background: #1e7e34; }
        h2 { text-align: center; }
    
    </style>
</head>
<body>
    <a href="dashboard.jsp" class="dashboard-btn">🏠 Go to Dashboard</a>
    <h2>Manage Pets</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Breed</th>
            <th>Age</th>
            <th>Description</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        <%
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM pets");
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("breed") %></td>
            <td><%= rs.getString("age") %></td>
            <td><%= rs.getString("description") %></td>
            <td><img src="<%= rs.getString("image") %>" width="100"></td>
            <td>
                <a href="delete_pet.jsp?id=<%= rs.getInt("id") %>" class="btn delete" onclick="return confirm('Are you sure you want to delete this pet?');">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
