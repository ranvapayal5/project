<%@ page import="java.sql.*" %>
<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String reason = request.getParameter("reason");
        String availability = request.getParameter("availability");

        
        System.out.println("Received Data:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Reason: " + reason);
        System.out.println("Availability: " + availability);

        
        if (name == null || email == null || phone == null || reason == null || availability == null) {
            message = "Some form fields are missing!";
            System.out.println("ERROR: Some form fields are missing!");
        } else {
            try {
                
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "root", "");

                System.out.println("Database connected!");

                String query = "INSERT INTO volunteers (name, email, phone, reason, availability) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, reason);
                ps.setString(5, availability);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    message = "Application submitted successfully!";
                    System.out.println("✅ Data inserted successfully!");
                } else {
                    message = "Data insertion failed!";
                    System.out.println("❌ Data insertion failed!");
                }

                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();  // Error print karega
                message = "Error submitting application!";
            }
        }
    }
    response.sendRedirect("volunteer_success.jsp");
%>
