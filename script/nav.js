const navLinks = document.getElementById('NavLinks');
const expandButton = document.getElementById('ExpandButton');

// Lorsque l'utilisateur clique sur le bouton, on bascule entre les états (agrandissement/fermeture)
expandButton.addEventListener('click', () => {
    if (navLinks.classList.contains('expanded')) {
        navLinks.classList.remove('expanded'); // Fermer le menu et réapparaître le carré
        //expandButton.style.display = 'block';
    } else {
        navLinks.classList.add('expanded'); // Agrandir le menu et cacher le carré
        expandButton.style.backgroundColor = 'transparent';
    }
});
