<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/pet";
    String dbUser = "root"; // Change this if needed
    String dbPass = ""; // Change this if needed

    Connection conn = null;
    PreparedStatement checkStmt = null;
    PreparedStatement insertStmt = null;
    ResultSet rs = null;

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Step 1: Check if Username or Email Exists
        String checkQuery = "SELECT * FROM users WHERE username=? OR email=?";
        checkStmt = conn.prepareStatement(checkQuery);
        checkStmt.setString(1, username);
        checkStmt.setString(2, email);
        rs = checkStmt.executeQuery();

        if (rs.next()) {
            out.println("<h3 style='color:red;'>Error: Username or Email already exists!</h3>");
        } else {
            // Step 2: Insert New User
            String insertQuery = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, username);
            insertStmt.setString(2, email);
            insertStmt.setString(3, password); // Note: Hash passwords before storing
            int rows = insertStmt.executeUpdate();

            if (rows > 0) {
                out.println("<h3 style='color:green;'>Signup Successful!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Error: Signup Failed!</h3>");
            }
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (rs != null) rs.close();
        if (checkStmt != null) checkStmt.close();
        if (insertStmt != null) insertStmt.close();
        if (conn != null) conn.close();
    }
%>
