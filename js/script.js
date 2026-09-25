// Adding smooth scrolling behavior
document.querySelectorAll('.nav-link').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();

        // Scroll smoothly to the section
        const targetId = this.getAttribute('href').substring(1);
        const targetSection = document.getElementById(targetId);
        
        targetSection.scrollIntoView({
            behavior: 'smooth'
        });
    });
});


//pet listing section
// Event listeners for the filter inputs
document.getElementById('pet-type').addEventListener('change', filterPets);
document.getElementById('age-range').addEventListener('change', filterPets);

function filterPets() {
    const petType = document.getElementById('pet-type').value.toLowerCase();
    const ageRange = document.getElementById('age-range').value.toLowerCase();

    const petCards = document.querySelectorAll('.pet-card');
    
    petCards.forEach(card => {
        // Get data from the card
        const type = card.getAttribute('data-type').toLowerCase();
        const age = card.getAttribute('data-age').toLowerCase();

        // Check if the card matches the filter values
        const matchesType = petType === 'all' || type.includes(petType);
        const matchesAge = ageRange === 'all' || age.includes(ageRange);

        // If it matches both selected filters, show it; otherwise, hide it
        if (matchesType && matchesAge) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}



// Function to open other modals (login/signup)
function openModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "flex";
}

// Function to close a modal
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "none";
}

// Close modal when clicking outside the modal content
window.onclick = function (event) {
    const modals = document.querySelectorAll(".modal");
    modals.forEach(modal => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
};





//login and signup model
// Function to open a modal
function openModal(modalId) {
    document.getElementById(modalId).style.display = 'flex';
}

// Function to close a modal
function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
}

// Function to switch between modals (e.g., login to signup)
function switchModal(currentModalId, targetModalId) {
    closeModal(currentModalId);
    openModal(targetModalId);
}

// Close modals if clicking outside content
window.onclick = function(event) {
    const modals = document.querySelectorAll('.modal');
    modals.forEach(modal => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
};




// Toggle FAQ answers visibility
document.querySelectorAll('.faq-item').forEach(item => {
    item.addEventListener('click', () => {
        item.classList.toggle('open');
    });
});

//view details of pets
function viewPetDetails(petName) {
    // Save the pet details to localStorage so they can be accessed on the details page
    const pets = {
        buddy: {
            name: "Buddy",
            breed: " Indian pariah",
            age: "Adult",
            description: "Buddy is a friendly and active Indian pariah who loves playing fetch and going on walks. He is looking for a loving home.",
            image: "images/dog1.jpg"
        },
        whiskers: {
            name: "Whiskers",
            breed: "Maine Coon",
            age: "Adult",
            description: "Whiskers is an adorable Maine Coon kitten who loves cuddles and playing with toys.",
            image: "images/cat1.jpg"
        },
        rocky: {
            name: "Rocky",
            breed: "Beagle",
            age: "Puppy",
            description: "Rocky is a calm and wise Puppy Beagle who enjoys leisurely walks and naps.",
            image: "images/dog2.jpg"
        },
        lucy: {
            name: "Lucy",
            breed: "Parrot",
            age: "Adult",
            description: "Lucy is a vibrant and talkative parrot who enjoys singing and mimicking sounds.",
            image: "images/bird1.jpg"
        },
        oreo: {
            name: "Oreo",
            breed: "Himaliyan Cat",
            age: "Puppy",
            description: "Oreo is a fluffy and affectionate Himalayan cat who loves lounging in cozy spots and receiving gentle attention.",
            image: "images/cat2.jpg"
        },
        jimmyy: {
            name: "Jimmyy",
            breed: "Shiba inu",
            age: "Senior",
            description: "Jimmy is a gentle and loving senior Shiba Inu who enjoys cozy naps and calm companionship.",
            image: "images/dog3.jpg"
        },
        ozzy: {
            name: "Ozzy",
            breed: "Parrot",
            age: "Adult",
            description: "Ozzy is a intelligent parrot who enjoys mimicking sounds, and brightening up the room with his vibrant personality.",
            image: "images/bird2.jpg"
        },
        sophie: {
            name: "Sophie",
            breed: "American curl",
            age: "Adult",
            description: "Sophie is a charming and playful American Curl with unique curled ears and a loving, affectionate nature.",
            image: "images/cat3.jpg"
        },
        tweety: {
            name: "Tweety",
            breed: "Parrot",
            age: "Adult",
            description: "Tweety is a cheerful and social parrot who loves to chatter, sing, and bring joy with playful antics.",
            image: "images/bird3.jpg"
        },
        cooper: {
            name: "Cooper",
            breed: "Labrador",
            age: "Senior",
            description: "Cooper is a friendly and energetic Labrador who loves playtime, belly rubs, and being everyone’s best friend.",
            image: "images/dog4.jpg"
        },
        lily: {
            name: "Lily",
            breed: "persian Cat",
            age: "puppy",
            description: "Lily is a graceful and affectionate Persian cat with a luxurious coat and a love for peaceful cuddles.",
            image: "images/cat4.jpg"
        },
        Flossy: {
            name: "Flossy",
            breed: "Parrot",
            age: "Adult",
            description: "Flossy is a calm and wise senior German Shepherd who enjoys leisurely walks and naps.",
            image: "images/bird4.jpg"
        }  
    };



    // Ensure the pet name is valid
    if (pets[petName]) {
        // Store the pet's details in localStorage
        localStorage.setItem('selectedPet', JSON.stringify(pets[petName]));

        // Redirect to the pet details page
        window.location.href = 'pet-details.html';
    } else {
        console.error("Pet details not found for: " + petName);
    }
}

