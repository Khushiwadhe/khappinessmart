// JavaScript code for countdown timer
document.addEventListener("DOMContentLoaded", function() {
    // Set the date we're counting down to
    var countDownDate = new Date("Jul 24, 2024 23:59:59").getTime();

    // Update the count down every 1 second
    var countdownFunction = setInterval(function() {
        var now = new Date().getTime();
        var distance = countDownDate - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("countdown-timer").innerHTML = days + " days " + hours + " hours " + 
            minutes + " minutes " + seconds + " seconds ";

        if (distance < 0) {
            clearInterval(countdownFunction);
            document.getElementById("countdown-timer").innerHTML = "EXPIRED";
        }
    }, 1000);
});
