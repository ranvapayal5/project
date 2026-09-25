<%@ page import="java.sql.*" %>
<%
    // Retrieve adoption form data
    String reason = request.getParameter("reason");
    String petName = request.getParameter("pet_name");
    String petBreed = request.getParameter("pet_breed");
    String petAge = request.getParameter("pet_age");

    // You don't need to fetch user_id from session
    try {
        // Establish connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

        // Prepare the SQL statement to insert the adoption request
        PreparedStatement stmt = con.prepareStatement("INSERT INTO adoption_requests (pet_name, pet_breed, pet_age, reason, request_date) VALUES (?, ?, ?, ?, ?)");
        stmt.setString(1, petName);    // Pet Name
        stmt.setString(2, petBreed);   // Pet Breed
        stmt.setString(3, petAge);     // Pet Age
        stmt.setString(4, reason);     // Reason for adoption
        stmt.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis())); // Request date as current timestamp

        // Execute the SQL query
        int result = stmt.executeUpdate();

        if (result > 0) {
            response.sendRedirect("adopt_success.jsp?msg=success");
        } else {
            response.sendRedirect("adopt_failure.jsp?msg=error");
        }

        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("adopt_failure.jsp?msg=error");
    }
%>
