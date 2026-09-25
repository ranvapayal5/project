<%@ page import="java.sql.*" %>
<%
    int requestId = Integer.parseInt(request.getParameter("id"));
    
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");
        String updateQuery = "UPDATE adoption_requests SET status = 'rejected' WHERE id = ?";
        PreparedStatement stmt = con.prepareStatement(updateQuery);
        stmt.setInt(1, requestId);
        
        int result = stmt.executeUpdate();
        
        if (result > 0) {
            response.sendRedirect("manage_adoptions.jsp?msg=Request Rejected");
        } else {
            response.sendRedirect("manage_adoptions.jsp?msg=Error rejecting request");
        }
        
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("manage_adoptions.jsp?msg=Error rejecting request");
    }
%>
