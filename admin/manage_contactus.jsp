<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Contact Messages</title>
    <style>
        
        body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background: #333; color: white; }
        h2 { text-align: center; }
        .dashboard-btn { display: inline-block; background: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold; transition: background 0.3s ease-in-out; }
    .dashboard-btn:hover {background: #1e7e34; }
    
    </style>
</head>
<body>
    <a href="dashboard.jsp" class="dashboard-btn">🏠 Go to Dashboard</a>
<h2>Contact Us Messages</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Submitted At</th>
    </tr>

    <%
        try {
            // Database Connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Your_db", "root", "");

            // Check if "submitted_at" column exists
            DatabaseMetaData metaData = con.getMetaData();
            ResultSet columns = metaData.getColumns(null, null, "contactus", "submitted_at");

            boolean hasSubmittedAt = columns.next(); // true if column exists
            String orderColumn = hasSubmittedAt ? "submitted_at" : "id"; // Use submitted_at if exists, else id

            // Retrieve Contact Messages
            String query = "SELECT * FROM contactus ORDER BY " + orderColumn + " DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
    %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("message") %></td>
                    <td><%= hasSubmittedAt ? rs.getTimestamp("submitted_at") : "N/A" %></td>
                </tr>
    <%
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <tr><td colspan="5">Error: <%= e.getMessage() %></td></tr>
    <%
        }
    %>

</table>

</body>
</html>
