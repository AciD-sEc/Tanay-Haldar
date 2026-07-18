<<<<<<< HEAD
let currentIndex = 0;
const quotes = document.querySelectorAll('.quote');
const intervalTime = 5000; // 5 seconds between slides

// Function to show the current quote with smooth transition
function showQuote(index) {
    quotes.forEach((quote, i) => {
        quote.classList.remove('active');
        if (i === index) {
            quote.classList.add('active');
        }
    });
}

// Move to the next quote
function nextQuote() {
    currentIndex = (currentIndex + 1) % quotes.length;
    showQuote(currentIndex);
}

// Move to the previous quote (if needed)
function prevQuote() {
    currentIndex = (currentIndex - 1 + quotes.length) % quotes.length;
    showQuote(currentIndex);
}

// Automatically change quotes every 5 seconds
setInterval(nextQuote, intervalTime);

// Initially show the first quote
showQuote(currentIndex);
=======
let currentIndex = 0;
const quotes = document.querySelectorAll('.quote');
const intervalTime = 5000; // 5 seconds between slides

// Function to show the current quote with smooth transition
function showQuote(index) {
    quotes.forEach((quote, i) => {
        quote.classList.remove('active');
        if (i === index) {
            quote.classList.add('active');
        }
    });
}

// Move to the next quote
function nextQuote() {
    currentIndex = (currentIndex + 1) % quotes.length;
    showQuote(currentIndex);
}

// Move to the previous quote (if needed)
function prevQuote() {
    currentIndex = (currentIndex - 1 + quotes.length) % quotes.length;
    showQuote(currentIndex);
}

// Automatically change quotes every 5 seconds
setInterval(nextQuote, intervalTime);

// Initially show the first quote
showQuote(currentIndex);
>>>>>>> 222d778 (Add SEO-optimized Tanay Haldar portfolio website)
