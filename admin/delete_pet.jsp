<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminLoggedIn") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    int petId = Integer.parseInt(request.getParameter("id"));

    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM pets WHERE id = ?");
        ps.setInt(1, petId);

        int result = ps.executeUpdate();
        if (result > 0) {
            response.sendRedirect("manage_pets.jsp?msg=deleted");
        } else {
            response.sendRedirect("manage_pets.jsp?msg=error");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("manage_pets.jsp?msg=error");
    }
%>
