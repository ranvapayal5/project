<%@ page import="java.sql.*" %>
<%
    // Admin Authentication
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("admin_login.jsp");
    }

    // Initialize counts
    int userCount = 0;
    int adoptionRequestsCount = 0;
    int pastAdoptedCount = 0;

    try {
        // Database Connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

        // Query User Count
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM users"); 
        if (rs.next()) {
            
            userCount = rs.getInt(1);
        }

        // Query Adoption Requests Count (Pending Requests)
        String adoptionRequestsQuery = "SELECT COUNT(*) FROM adoption_requests WHERE status = 'Pending'";
        PreparedStatement ps1 = con.prepareStatement(adoptionRequestsQuery);
        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) {
            adoptionRequestsCount = rs1.getInt(1); // Count of pending adoption requests
        }

        // Query Past Adoptions Count (Approved Requests)
        String pastAdoptedQuery = "SELECT COUNT(*) FROM adoption_requests WHERE status = 'Approved'";
        PreparedStatement ps2 = con.prepareStatement(pastAdoptedQuery);
        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) {
            pastAdoptedCount = rs2.getInt(1); // Count of approved adoption requests
        }

        // Closing resources
        rs.close();
        rs1.close();
        rs2.close();
        stmt.close();
        ps1.close();
        ps2.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.print("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: #f4f4f4;
    display: flex;
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: #333;
    color: white;
    height: 100vh;
    position: fixed;
    padding-top: 20px;
}
.sidebar h2 {
    text-align: center;
}
.sidebar ul {
    list-style: none;
    padding: 0;
}
.sidebar ul li {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid gray;
}
.sidebar ul li a {
    color: white;
    text-decoration: none;
    display: block;
}
.sidebar ul li:hover {
    background: #555;
}

/* Main Content */
.main-content {
    margin-left: 250px;
    padding: 20px;
    width: calc(100% - 250px);
}
h1 {
    font-size: 32px;
    color: #333;
    margin-bottom: 20px;
}

/* Card Styles */
.card {
    background: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-top: 20px;
    transition: transform 0.3s ease;
}

.card:hover {
    transform: scale(1.05);
}

.count {
    font-size: 24px;
    font-weight: bold;
    color: #333;
}

/* Dashboard Stats (Adoption Requests and Past Adoptions) */
.dashboard-stats {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.stat {
    background: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    width: 45%; /* Make sure they fit nicely side by side */
    transition: transform 0.3s ease;
}

.stat:hover {
    transform: scale(1.05);
}

.stat h3 {
    font-size: 24px;
    color: #444;
}

.stat p {
    font-size: 28px;
    font-weight: bold;
    color: #007BFF;
}

    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul>
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="manage_pets.jsp">Manage Pets</a></li>
            <li><a href="manage_users.jsp">Manage Users</a></li>
            <li><a href="manage_adoptions.jsp">Manage Adoption Request</a></li>
            <li><a href="manage_volunteers.jsp">Volunteer Applications</a></li>
            <li><a href="manage_contactus.jsp">Manage Contact Messages</a></li>
            <li><a href="admin_logout.jsp">
                <button style="background: red; color: white; padding: 10px;">Logout</button>
            </a>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Admin Dashboard</h1>
        
        <!-- User Count Card -->
        <div class="card">
            <h3>Total Users</h3>
            <p class="count"><%= userCount %></p>
        </div>

        <!-- Adoption Requests and Past Adoptions Stats -->
        <div class="dashboard-stats">
            <div class="stat">
                <h3>Adoption Requests</h3>
                <p><%= adoptionRequestsCount %> Pending Requests</p>
            </div>

            <div class="stat">
                <h3>Past Adoptions</h3>
                <p><%= pastAdoptedCount %> Adopted Pets</p>
            </div>
        </div>

    </div>

</body>
</html>
