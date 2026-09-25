// ================================
// PETNEST AI ASSISTANT
// ================================

function toggleAI() {
    const chatbox = document.getElementById("ai-chatbox");

    if (chatbox.style.display === "block") {
        chatbox.style.display = "none";
    } else {
        chatbox.style.display = "block";
    }
}


function sendAIMessage() {

    const input = document.getElementById("ai-input");
    const messages = document.getElementById("ai-messages");

    const userText = input.value.trim();

    if (userText === "") {
        return;
    }

    // Show user message
    const userMessage = document.createElement("div");
    userMessage.className = "ai-message user";
    userMessage.innerText = userText;

    messages.appendChild(userMessage);

    // Get bot answer
    const answer = getAIAnswer(userText);

    // Show bot message
    const botMessage = document.createElement("div");
    botMessage.className = "ai-message bot";
    botMessage.innerHTML = answer;

    messages.appendChild(botMessage);

    // Clear input
    input.value = "";

    // Scroll to bottom
    messages.scrollTop = messages.scrollHeight;
}


// ================================
// SIMPLE AI ANSWERS
// ================================

function getAIAnswer(question) {

    const text = question.toLowerCase();

    // Greeting
    if (
        text.includes("hi") ||
        text.includes("hello") ||
        text.includes("hey")
    ) {
        return "👋 Hello! Welcome to PetNest. How can I help you?";
    }


    // Adoption
    if (
        text.includes("adopt") ||
        text.includes("adoption")
    ) {
        return "🐶 To adopt a pet, browse the available pets, select a pet you like, view its details, and submit an adoption request.";
    }


    // Pets
    if (
        text.includes("pet") ||
        text.includes("pets") ||
        text.includes("available")
    ) {
        return "🐾 PetNest provides pets looking for loving homes. You can browse the available pets from the <b>Browse Pets</b> section.";
    }


    // Volunteer
    if (
        text.includes("volunteer") ||
        text.includes("volunteering")
    ) {
        return "❤️ You can become a volunteer by visiting the <b>Volunteer</b> section and submitting the volunteer form.";
    }


    // Login
    if (
        text.includes("login") ||
        text.includes("log in") ||
        text.includes("sign in")
    ) {
        return "🔐 Click the <b>Login</b> option and enter your registered email/username and password.";
    }


    // Register
    if (
        text.includes("register") ||
        text.includes("signup") ||
        text.includes("sign up") ||
        text.includes("create account")
    ) {
        return "📝 New to PetNest? Click <b>Register</b> and create your account first.";
    }


    // Events
    if (
        text.includes("event") ||
        text.includes("events")
    ) {
        return "📅 You can check the <b>Events</b> section to see upcoming PetNest events and activities.";
    }


    // Gallery
    if (
        text.includes("gallery") ||
        text.includes("photo") ||
        text.includes("photos")
    ) {
        return "📸 Visit the <b>Gallery</b> section to see PetNest photos and memories.";
    }


    // Contact
    if (
    text.includes("contact") ||
    text.includes("reach") ||
    text.includes("email") ||
    text.includes("phone") ||
    text.includes("address") ||
    text.includes("location") ||
    text.includes("working hours")
) {
    return `
        📩 <b>PetNest Adoption Center</b><br><br>

        📍 <b>Address:</b><br>
        12, Green Valley Road,<br>
        Vivekanand West, Junagadh,<br>
        Gujarat - 362001<br><br>

        📧 <b>Email:</b> contact@PetNest.org<br><br>

        📞 <b>Phone:</b> 0285 224687<br><br>

        🕐 <b>Working Hours:</b><br>
        Monday - Saturday, 9 AM - 6 PM
    `;
}

    // About
    if (
    text.includes("about") ||
    text.includes("petnest") ||
    text.includes("who are you")
) {
    return `
        🐾 <b>About PetNest</b><br><br>
        The PetNest for Adoption is a non-profit organization
        dedicated to helping homeless animals find loving,
        permanent homes.<br><br>

        ❤️ Our mission is to rescue and care for animals,
        promote animal welfare, and encourage responsible
        pet ownership.
    `;
}


    // How to adopt
    if (
        text.includes("how") &&
        text.includes("adopt")
    ) {
        return "🐕 First browse the pets, choose a pet, view its details, and submit the adoption request. The request can then be reviewed by the admin.";
    }


    // Thank you
    if (
        text.includes("thank") ||
        text.includes("thanks")
    ) {
        return "😊 You're welcome! I'm always happy to help.";
    }


    // Default answer
    return "🤔 I'm still a simple PetNest Assistant. You can ask me about <b>adoption, pets, volunteering, login, registration, events, gallery, or contact</b>.";
}


// ================================
// ENTER KEY
// ================================

document.addEventListener("DOMContentLoaded", function () {

    const input = document.getElementById("ai-input");

    if (input) {

        input.addEventListener("keypress", function (event) {

            if (event.key === "Enter") {
                sendAIMessage();
            }

        });

    }

});