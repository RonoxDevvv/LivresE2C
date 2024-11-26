// Variable
let Valid = document.querySelector('#Valid');
let number1 = document.querySelector('#number1');
let number2 = document.querySelector('#number2');
let resultHTML = document.querySelector('#Result');

// Function
function makeCalcul() {

    let nombre1 = parseFloat(number1.value);
    let nombre2 = parseFloat(number2.value); 

    if (isNaN(nombre1) || isNaN(nombre2)) {
        resultHTML.innerHTML = `<p>Des chiffres pas des lettres frr</p>`
        //resultat.style.color = "Red"
        console.log("LLLLL")
    } else {
        let resultat = nombre1 + nombre2;
        let messageAddition = `<p>${nombre1} + ${nombre2} = ${resultat}</p>`;
        resultHTML.innerHTML = messageAddition;

        resultat = nombre1 - nombre2;
        let messageSoustraction = `<p>${nombre1} - ${nombre2} = ${resultat}</p>`;
        resultHTML.innerHTML += messageSoustraction;

        resultat = nombre1 * nombre2;
        let messageMultiplication = `<p>${nombre1} * ${nombre2} = ${resultat}</p>`;
        resultHTML.innerHTML += messageMultiplication;

        if (nombre1 === 0 || nombre2 === 0) {
            let DivisionError = `<p>Division by zero is not allowed.</p>`
            resultHTML.innerHTML += DivisionError
        } else {
            resultat = nombre1 / nombre2;
            let messageDivision = `<p>  ${nombre1} / ${nombre2} = ${resultat}</p>`;
            resultHTML.innerHTML += messageDivision;
        }

        resultHTML.style.color = "Red"
    }
}

// Event
Valid.addEventListener("click", makeCalcul)