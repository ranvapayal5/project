<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");
    PreparedStatement checkUser = con.prepareStatement("SELECT * FROM users WHERE email=?");
    checkUser.setString(1, email);
    ResultSet rs = checkUser.executeQuery();

    if (rs.next()) {
        out.print("exists");
    } else {
        PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        int i = ps.executeUpdate();
        
        if (i > 0) {
            out.print("success");
        } else {
            out.print("error");
        }
    }
    con.close();
%>
