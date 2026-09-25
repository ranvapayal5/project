<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Volunteer Application Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 15px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        label {
            font-size: 14px;
            font-weight: bold;
            text-align: left;
        }
        input {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }
        button {
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #218838;
        }
        .status-message {
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .approved {
            color: green;
        }
        .rejected {
            color: red;
        }
        .pending {
            color: orange;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Check Your Application Status</h2>
    
    <form method="post" action="">
        <label for="email">Enter Your Email:</label>
        <input type="email" name="email" required>
        <button type="submit">Check Status</button>
    </form>

    <%
        String userEmail = request.getParameter("email");

        if (userEmail != null && !userEmail.isEmpty()) {
            try {
               
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

                String query = "SELECT status FROM volunteers WHERE email = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, userEmail);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String status = rs.getString("status");

                    String statusClass = "pending";
                    if ("Approved".equalsIgnoreCase(status)) {
                        statusClass = "approved";
                    } else if ("Rejected".equalsIgnoreCase(status)) {
                        statusClass = "rejected";
                    }

                    out.println("<p class='status-message " + statusClass + "'>Your application status: " + status + "</p>");
                } else {
                    out.println("<p class='status-message'>No application found with this email.</p>");
                }

                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</div>

</body>
</html>
