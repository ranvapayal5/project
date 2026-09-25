<%@ page import="java.sql.*" %>
<%
    // Retrieve form data
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/Your_db";
    String user = "root";  // Change if your MySQL username is different
    String password = "";  // Change if you have a MySQL password

    try {
        
       

        // Establish Connection
        Connection con = DriverManager.getConnection(url, user, password);

        // Insert Query
        String query = "INSERT INTO contactus (name, email, message) VALUES (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, message);

        // Execute Insert
        int result = ps.executeUpdate();

        // Close resources
        ps.close();
        con.close();

        if (result > 0) {
%>
            <script>
                alert("Your message has been submitted successfully!");
                window.location.href = "contactus.html"; // Redirect back to form
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to submit message. Please try again.");
                window.location.href = "contactus.html";
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error: <%= e.getMessage() %>");
            window.location.href = "contactus.html";
        </script>
<%
    }
%>
