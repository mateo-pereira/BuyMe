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

window.addEventListener('beforeunload', function (event) {
    // Clear the URL parameters before refreshing
    history.pushState({}, document.title, window.location.pathname);

    // Optionally, you can show a confirmation dialog to the user
    // event.returnValue = 'Are you sure you want to leave this page?';
  });
  
  
