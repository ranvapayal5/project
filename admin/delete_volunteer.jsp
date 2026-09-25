<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");

    try {
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM volunteers WHERE id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("manage_volunteers.jsp");
%>
