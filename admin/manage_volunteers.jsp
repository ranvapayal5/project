<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Volunteers</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }
        th { background: #333; color: white; }
        .approve-btn { background: green; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .reject-btn { background: red; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        .dashboard-btn { display: inline-block; background: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; font-weight: bold; transition: background 0.3s ease-in-out; }
        .dashboard-btn:hover {background: #1e7e34; }
        h2 { text-align: center; }
       
    </style>
</head>
<body>
    <a href="dashboard.jsp" class="dashboard-btn">🏠 Go to Dashboard</a>
<h2>Manage Volunteers</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Reason</th>
        <th>Availability</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        try {
           
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

            String query = "SELECT * FROM volunteers";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
    %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("reason") %></td>
                    <td><%= rs.getString("availability") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <% if (!rs.getString("status").equals("Approved")) { %>
                            <a href="update_volunteer_status.jsp?id=<%= rs.getInt("id") %>&status=Approved">
                                <button class="approve-btn">Approve</button>
                            </a>
                        <% } %>
                        <% if (!rs.getString("status").equals("Rejected")) { %>
                            <a href="update_volunteer_status.jsp?id=<%= rs.getInt("id") %>&status=Rejected">
                                <button class="reject-btn">Reject</button>
                            </a>
                        <% } %>
                    </td>
                </tr>
    <%
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</table>

</body>
</html>
