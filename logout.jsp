<%
    session.invalidate(); // 🔹 Session destroy (User logout)
    response.sendRedirect("index.html"); // 🔹 Redirect to login page
%>
