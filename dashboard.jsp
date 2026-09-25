<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Adoption</title>
    <link rel="stylesheet" href="css/styles.css?v=3">
    
    
</head>

<body>
  
   
<!-- Home Section -->
<section id="home" class="page-section">
    <h2>Welcome to PetNest🐾💖</h2>
    <p>Your one-stop destination to find and adopt your next best friend.</p>
    <a href="#pet-listing" class="cta-button">Browse Pets</a>
</section>

<% if (isLoggedIn) { %>
<!-- Pet Listings Section -->
<section id="pet-listing">
    <h2>Available Pets for Adoption</h2>
    
    <!-- Filter Bar -->
        <div class="filters">
            <select id="pet-type">
                <option value="all">All Pets</option>
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="bird">Bird</option>
            </select>
    
            <select id="age-range">
                <option value="all">All Ages</option>
                <option value="puppy">Puppy</option>
                <option value="adult">Adult</option>
                <option value="senior">Senior</option>
            </select>
        </div>
    
        <div class="pet-cards">
            <!-- Pet Card 1 -->
            <div class="pet-card" data-type="dog" data-age="adult">
                <img src="images/dog1.jpg" alt="Buddy the Dog">
                <div class="pet-info">
                    <h3>Buddy</h3>
                    <p>Breed: Indian pariah</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('buddy')">View Details</button>
                </div>
            </div>
    
            <!-- Pet Card 2 -->
            <div class="pet-card" data-type="cat" data-age="Adult">
                <img src="images/cat1.jpg" alt="Whiskers the Cat">
                <div class="pet-info">
                    <h3>Whiskers</h3>
                    <p>Breed: Maine Coon</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('whiskers')">View Details</button>
                </div>
            </div>
    
            <!-- Pet Card 3 -->
            <div class="pet-card" data-type="dog" data-age="Puppy">
                <img src="images/dog2.jpg" alt="Rocky the Dog">
                <div class="pet-info">
                    <h3>Rocky</h3>
                    <p>Breed: Beagle</p>
                    <p>Age: Puppy</p>
                    <button class="adopt-button" onclick="viewPetDetails('rocky')">View Details</button>
                </div>
            </div>


              <!-- Pet Card 4 -->
     <div class="pet-card" data-type="bird" data-age="senior">
        <img src="images/bird1.jpg" alt="Lucy the bird ">
        <div class="pet-info">
            <h3>Lucy</h3>
            <p>Breed: Parrot</p>
            <p>Age: Adult</p>
            <button class="adopt-button" onclick="viewPetDetails('lucy')">View Details</button>
        </div>
    </div>
           

             <!-- Pet Card 5 -->
             <div class="pet-card" data-type="cat" data-age="puppy">
                <img src="images/cat2.jpg" alt="Oreo the Cat">
                <div class="pet-info">
                    <h3>Oreo</h3>
                    <p>Breed: Himaliyan cat</p>
                    <p>Age: Puppy</p>
                    <button class="adopt-button" onclick="viewPetDetails('oreo')">View Details</button>
                </div>
            </div>

             <!-- Pet Card 6 -->
             <div class="pet-card" data-type="dog" data-age="senior">
                <img src="images/dog3.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Jimmyy</h3>
                    <p>Breed: Shiba inu</p>
                    <p>Age: Senior</p>
                    <button class="adopt-button" onclick="viewPetDetails('jimmyy')">View Details</button>                
                </div>
            </div>

             <!-- Pet Card 7 -->
             <div class="pet-card" data-type="bird" data-age="adult">
                <img src="images/bird2.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Ozzy</h3>
                    <p>Breed: Parrot</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('ozzy')">View Details</button>               
                 </div>
            </div>

             <!-- Pet Card 8 -->
             <div class="pet-card" data-type="cat" data-age="adult">
                <img src="images/cat3.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Sophie</h3>
                    <p>Breed: Americam Curl</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('sophie')">View Details</button>       
                 </div>
                </div>
        

             <!-- Pet Card 9 -->
             <div class="pet-card" data-type="bird" data-age="adult">
                <img src="images/bird3.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Tweety</h3>
                    <p>Breed: Parrot</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('tweety')">View Details</button>              
            </div>
            </div>

            <!-- Pet Card 10 -->
            <div class="pet-card" data-type="dog" data-age="Senior">
                <img src="images/dog4.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Cooper</h3>
                    <p>Breed: labrador</p>
                    <p>Age: Senior</p>
                    <button class="adopt-button" onclick="viewPetDetails('cooper')">View Details</button>               
                 </div>
             </div>
            

            <!-- Pet Card 11 -->
            <div class="pet-card" data-type="cat" data-age="puppy">
                <img src="images/cat4.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Lily</h3>
                    <p>Breed: Persian Cat</p>
                    <p>Age: Puppy</p>
                    <button class="adopt-button" onclick="viewPetDetails('lily')">View Details</button>          
                     </div>
             </div>

            <!-- Pet Card 12 -->
            <div class="pet-card" data-type="bird" data-age="adult">
                <img src="images/bird4.jpg" alt="Sunny the Bird">
                <div class="pet-info">
                    <h3>Flossy</h3>
                    <p>Breed: Parrot</p>
                    <p>Age: Adult</p>
                    <button class="adopt-button" onclick="viewPetDetails('Flossy')">View Details</button>               
                 </div>
                </div>
            </div>
             
    
            <!-- More Pet Cards can be added here -->
        </div>
    </section>
    
    <img class="divider" src="images/divider.png" alt="divider image">
   
    <% } %>

<!-- Login Modal -->
<div id="login-modal" class="modal" method="post" action="login.jsp">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal('login-modal')">&times;</span>
        <h2>Login</h2>
        <form>
            <input type="email" placeholder="Email" name="email" required>
            <input type="password" placeholder="Password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</div>

<!-- Signup Modal -->
<div id="signup-modal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal('signup-modal')">&times;</span>
        <h2>Sign Up</h2>
        <form>
            <input type="text" placeholder="Full Name" required>
            <input type="email" placeholder="Email" required>
            <input type="password" placeholder="Password" required>
            <button type="submit">Sign Up</button>
        </form>
    </div>
</div>

<% if (isLoggedIn) { %>
<!--apply for volunteer form-->
<section id="apply" class="page-section">
    <div class="container">
        <h2>Be A Volunteer</h2>
    <p>Join us in making a difference in the lives of pets. Fill out the form below to volunteer!</p>
    <h4>Check Your Status if you already fill Up the Form <a href="volunteer_status.jsp">Check</a></h4>
    <form  action="volunteer_submit.jsp" method="POST">
        <div class="form-group">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
        </div>
        <div class="form-group">
            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
        </div>
        <div class="form-group">
            <label for="reason">Why do you want to be a Volunteer?</label>
            <textarea id="reason" name="reason" placeholder="Please tell us why you want to be a Volunteer" rows="4" required></textarea>
        </div>
        <div class="form-group">
            <label for="availability">Availability</label>
            <select id="availability" name="availability" required>
                <option value="" disabled selected>Select availability</option>
                <option value="weekdays">Weekdays</option>
                <option value="weekends">Weekends</option>
                <option value="flexible">Flexible</option>
            </select>
        </div>
        <div class="form-group">
            <button type="submit" class="submit-btn">Submit Application</button>
        </div>
    </form>
    
    </div>
</section>   <% } %> 


    
<img class="divider" src="images/divider1.png" alt="divider image">

    
<!--event section-->
    <section id="events" class="events-section">
        <div class="container">
            <h2>Upcoming Events</h2>
            <p>Join our events to support animal welfare and make a difference.</p>
            <div class="event-cards-scroll">
                <!-- Event Card 1 -->
                <div class="event-card">
                    <h3>Adoption Drive</h3>
                    <p>Date: February 10, 2025</p>
                    <p>Location: Central Park</p>
                    <p>Description: A day to find loving homes for our pets. Come and meet your furry friend!</p>
                </div>
                <!-- Event Card 2 -->
                <div class="event-card">
                    <h3>Fundraiser Gala</h3>
                    <p>Date: March 15, 2025</p>
                    <p>Location: Grand Hotel</p>
                    <p>Description: An evening of dining and entertainment to raise funds for animal welfare.</p>
                </div>
                <!-- Event Card 3 -->
                <div class="event-card">
                    <h3>Pet Health Camp</h3>
                    <p>Date: April 8, 2025</p>
                    <p>Location: City Clinic</p>
                    <p>Description: Free health check-ups and vaccinations for pets.</p>
                </div>
                <!-- Event Card 4 -->
                <div class="event-card">
                    <h3>Volunteer Meetup</h3>
                    <p>Date: May 20, 2025</p>
                    <p>Location: Community Hall</p>
                    <p>Description: Meet like-minded individuals and learn how you can contribute to animal care.</p>
                </div>
                <!-- Event Card 5 -->
                <div class="event-card">
                    <h3>Pet Walkathon</h3>
                    <p>Date: June 5, 2025</p>
                    <p>Location: Riverside Park</p>
                    <p>Description: Bring your pets for a fun walkathon to promote pet fitness and awareness.</p>
                </div>
                <!-- Event Card 6 -->
                <div class="event-card">
                    <h3>Animal Awareness Workshop</h3>
                    <p>Date: July 12, 2025</p>
                    <p>Location: Public Library</p>
                    <p>Description: Learn about animal rights and welfare from experts in the field.</p>
                </div>
                <!-- Event Card 7 -->
                <div class="event-card">
                    <h3>Community Adoption Fair</h3>
                    <p>Date: August 18, 2025</p>
                    <p>Location: Green Valley Grounds</p>
                    <p>Description: A fair where local shelters showcase animals available for adoption.</p>
                </div>
                
            </div>
        </div>
        
    </section>
    
    
    
<!--gallary section-->
    <section id="gallery" class="gallery-section">
        <div class="container">
            <h2>Past Event Gallery</h2>
            <p>Browse through the highlights of our past events.</p>
            <div class="gallery-wrapper">
                <!-- Gallery Item 1 -->
                <div class="gallery-item">
                    <img src="images/event1.jpg" alt="Event 1" class="gallery-img">
                    <div class="gallery-overlay">
                        <div class="overlay-text">Charity Walk</div>
                    </div>
                </div>
                <!-- Gallery Item 2 -->
                <div class="gallery-item">
                    <img src="images/event2.jpg" alt="Event 2" class="gallery-img">
                    <div class="gallery-overlay">
                        <div class="overlay-text"> Animal Adoption Drive</div>
                    </div>
                </div>
                <!-- Gallery Item 3 -->
                <div class="gallery-item">
                    <img src="images/event3.jpg" alt="Event 3" class="gallery-img">
                    <div class="gallery-overlay">
                        <div class="overlay-text"> Pet Care Workshop</div>
                    </div>
                </div>
                <!-- Gallery Item 4 -->
                <div class="gallery-item">
                    <img src="images/event4.jpg" alt="Event 4" class="gallery-img">
                    <div class="gallery-overlay">
                        <div class="overlay-text"> Donation Collection</div>
                    </div>
                </div>
                            <!-- Gallery Item 5 -->
            <div class="gallery-item">
                <img src="images/event5.jpg" alt="Event 5" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Pet Adoption Success</div>
                </div>
            </div>
            <!-- Gallery Item 6 -->
            <div class="gallery-item">
                <img src="images/event6.jpg" alt="Event 6" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Volunteer Meet-up</div>
                </div>
            </div>
            <!-- Gallery Item 7 -->
            <div class="gallery-item">
                <img src="images/event7.jpg" alt="Event 7" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Fundraising Dinner</div>
                </div>
            </div>
            <!-- Gallery Item 8 -->
            <div class="gallery-item">
                <img src="images/event8.jpg" alt="Event 8" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Shelter Renovation</div>
                </div>
            </div>
            <!-- Gallery Item 9 -->
            <div class="gallery-item">
                <img src="images/event9.jpg" alt="Event 9" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Awareness Campaign</div>
                </div>
            </div>
            <!-- Gallery Item 10 -->
            <div class="gallery-item">
                <img src="images/event10.jpg" alt="Event 10" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Pet Fashion Show</div>
                </div>
            </div>
            <!-- Gallery Item 11 -->
            <div class="gallery-item">
                <img src="images/event11.jpg" alt="Event 11" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Community Awareness</div>
                </div>
            </div>
            <!-- Gallery Item 12 -->
            <div class="gallery-item">
                <img src="images/event12.jpg" alt="Event 12" class="gallery-img">
                <div class="gallery-overlay">
                    <div class="overlay-text"> Adopt a Senior Pet</div>
                </div>
            </div>
        
            </div>
        </div>
    </section>
        
    <!-- AI Assistant -->
<div id="ai-assistant">

    <button id="ai-toggle" onclick="toggleAI()">
        🤖
    </button>

    <div id="ai-chatbox">

        <div id="ai-header">
            <span>🐾 PetNest Assistant</span>
            <button onclick="toggleAI()">×</button>
        </div>

        <div id="ai-messages">
            <div class="ai-message bot">
                👋 Hi! I'm PetNest Assistant.<br>
                How can I help you?
            </div>
        </div>

        <div id="ai-input-area">

            <input
                type="text"
                id="ai-input"
                placeholder="Ask me something..."
            >

            <button onclick="sendAIMessage()">➤</button>

        </div>

    </div>

</div>


    

   
    <footer id="footer">
        <div class="container">
            <p>&copy; 2025 PetNest. All rights reserved. Made with ❤️ by Payal </p>
           
        </div>
    </footer>
    
    

<script src="js/script.js"></script>
<script src="js/ai-assistant.js?v=2"></script>

</body>
</html>
