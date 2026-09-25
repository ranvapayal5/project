<%
    session.invalidate(); // Session Destroy
    response.sendRedirect("admin_login.jsp"); // Redirect to Login
%>
