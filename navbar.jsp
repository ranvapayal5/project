 <%
    // 🛑 Check if user is logged in
    boolean isLoggedIn = (session.getAttribute("user") != null);
%>

<header>
    <nav class="<%= isLoggedIn ? "logged-in" : "" %>">  
        <ul>
            <li><a href="#home" class="nav-link">Home</a></li>

            <% if (isLoggedIn) { %>
                <li><a href="#pet-listing" class="nav-link">Browse Pets</a></li>
                <li><a href="#apply" class="nav-link">Volunteer</a></li>
            <% } %>

            <li><a href="#events" class="nav-link">Events</a></li>
            <li><a href="#gallery" class="nav-link">Gallery</a></li>
            <li><a href="adopt.html">How to Adopt</a></li>
            <li><a href="sucess.html">Success Stories</a></li>
            <li><a href="about.html">About Us</a></li>
            <li><a href="contactus.html">Contact Us</a></li>

            <% if (isLoggedIn) { %>
                <li><p>Welcome: <%= session.getAttribute("user") %></p></li>
                <li><a href="logout.jsp">Logout</a></li>
            <% } else { %>
                <li><a href="index.html">Login</a></li>
            <% } %>
        </ul>
    </nav>
</header>

