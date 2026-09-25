<%@ page import="java.sql.*" %>
<%
    // Ensure user is logged in
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("user_login.jsp");
        return;
    }
    
    int petId = Integer.parseInt(request.getParameter("id"));
    int userId = (Integer) session.getAttribute("user_id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Request Adoption</title>
</head>
<body>
    <h2>Request Adoption</h2>
    <form action="process_adoption.jsp" method="post">
        <input type="hidden" name="user_id" value="<%= userId %>">
        <input type="hidden" name="pet_id" value="<%= petId %>">
        
        <label>Why do you want to adopt this pet?</label><br>
        <textarea name="reason" required></textarea><br>

        <label>Your Address:</label><br>
        <input type="text" name="address" required><br>

        <label>Phone Number:</label><br>
        <input type="text" name="phone" required><br>

        <button type="submit">Submit Request</button>
    </form>
</body>
</html>
