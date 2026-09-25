<%@ page import="java.sql.*" %>
<%
    try {
        // Get parameters
        int requestId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        // Database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

        // Update adoption request status
        String query = "UPDATE adoption_requests SET status = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, status);
        ps.setInt(2, requestId);

        int result = ps.executeUpdate();

        if (result > 0) {
            response.sendRedirect("manage_adoptions.jsp");  // Redirect back to the admin panel
        } else {
            out.println("Error updating status.");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
