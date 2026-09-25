<%@ page import="java.sql.*" %>
<%
    try {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

       
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("user", email);
            out.print("success");
        } else {
            out.print("error");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.print("error: " + e.getMessage());
    }
%>
