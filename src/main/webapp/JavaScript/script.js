const dropdowns = document.querySelectorAll('.dropdownType');
dropdowns.forEach(dropdown => {
    const select = dropdown.querySelector('.select');
    const caret = dropdown.querySelector('.caret');
    const menu = dropdown.querySelector('.menu');
    const options = dropdown.querySelectorAll('.menu li');
    const selected = dropdown.querySelector('.selected');


    select.addEventListener('click', () => {

        select.classList.toggle('select-clicked');
        caret.classList.toggle('caret-rotate');
        menu.classList.toggle('menu-open');
    });

    options.forEach(option => {
        option.addEventListener('click', () => {
            selected.innerText = option.innerText;
            select.classList.remove('select-clicked');
            caret.classList.remove('caret-rotate');
            menu.classList.remove('menu-open');

            options.forEach(option => {
                option.classList.remove('active');
            });
            option.classList.add('active');
        });
    });
});


const menu = document.getElementById('dropdownMenu');
const formContainers = document.querySelectorAll('.form-container');
menu.addEventListener('change', function() {
    formContainers.forEach(container => {
      container.style.display = 'none';
    });
    const selectedOption = menu.value;
    const selectedForm = document.getElementById('form' + selectedOption);
    selectedForm.style.display = 'block';
  });



const hamburger = document.querySelector(".hamburger");
const navMenu = document.querySelector(".nav-menu");

hamburger.addEventListener("click", () => {
	hamburger.classList.toggle("active");
	navMenu.classList.toggle("active");
})

document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
	hamburger.classList.remove("active");
	navMenu.classList.remove("active");
}));



window.addEventListener('beforeunload', function (event) {
    // Clear the URL parameters before refreshing
    history.pushState({}, document.title, window.location.pathname);

    // Optionally, you can show a confirmation dialog to the user
    // event.returnValue = 'Are you sure you want to leave this page?';
  });
  
  
