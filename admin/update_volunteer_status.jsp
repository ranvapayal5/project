<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("status");

    if (id != null && status != null) {
        try {
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

            String query = "UPDATE volunteers SET status = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, Integer.parseInt(id));

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Volunteer ID " + id + " updated to " + status);
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Manage Volunteers Page Pe Redirect
    response.sendRedirect("manage_volunteers.jsp");
%>
