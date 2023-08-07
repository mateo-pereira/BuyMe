var eyeicon = document.getElementById("eyeicon");
var password = document.getElementById("password");
eyeicon.onclick = function(){
    if(password.type == "password"){
        password.type = "text";
        eyeicon.src = "./Images/eye-open.png"
    }
    else{
        password.type = "password";
        eyeicon.src = "./Images/eye-close.png"
    }
}

const hamburger = document.querySelector(".hamburger");
const navMenu = document.querySelector(".nav-menu");

hamburger.addEventListener("click", () => {
	hamburger.classList.toggle("active");
	navMenu.classList.toggle("active");
})

document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
	hamburger.classList.remove("active");
	navMenu.classList.remove("active");
}))

window.addEventListener('beforeunload', function (event) {
    // Clear the URL parameters before refreshing
    history.pushState({}, document.title, window.location.pathname);

    // Optionally, you can show a confirmation dialog to the user
    // event.returnValue = 'Are you sure you want to leave this page?';
  });
  
  
