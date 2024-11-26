/*let userName = "delagx_"
let age = "17"
let size = "1m75"
let isCool = true

console.log(userName, age, size, isCool)

isCool = false

console.log(isCool)

let a = 65
let b = 876

console.log(a*b, a+b, a-b, a%b, a/b)

let n1 = parseFloat(prompt("Nombre 1 ?")), n2 = parseFloat(prompt("Nombre 2 ?"));
isNaN(n1) || isNaN(n2) ? console.log("Nombres invalides !") : console.log(n1 + n2, n1 - n2, n1 * n2, n2 ? n1 / n2 : "Div 0 !");


let Cool = true;

if (Cool === true) {
    console.log("Je suis cool");
} else {
    console.log("Je suis pas cool");
}

if (isNaN(nombre1) || isNaN(nombre2)) {
    console.log("Wsh frro pourquoi ta mis des lettres ???");
} else {
    let resultat = nombre1 + nombre2;
    console.log(`${nombre1} + ${nombre2} = ${resultat}`);

    resultat = nombre1 - nombre2;
    console.log(`${nombre1} - ${nombre2} = ${resultat}`);

    resultat = nombre1 * nombre2;
    console.log(`${nombre1} * ${nombre2} = ${resultat}`);

    if (nombre1 + nombre2 !== 0) {
        resultat = nombre1 / nombre2;
        console.log(`${nombre1} / ${nombre2} = ${resultat}`);
    } else {
        console.log("Division by zero is not allowed.");
    }
}

for(let i  = 1; i<1; i++) {
    console.log(`${i} - bonjour`)
}

*/

let resultHTML = document.querySelector('#Result');


let nombre1 = parseFloat(prompt("Donne un nombre frro"));

while(isNaN(nombre1)) {
    nombre1 = parseFloat(prompt("On t'a dit un nombre bruh"))
}

let nombre2 = parseFloat(prompt("Donne un deuxième nombre frro"));

while(isNaN(nombre2)) {
    nombre2 = parseFloat(prompt("On t'a dit un nombre bruh"))
}

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
    let DivisionError = "Division by zero is not allowed.";
    resultHTML.innerHTML += DivisionError
} else {
    resultat = nombre1 / nombre2;
    let messageDivision = `${nombre1} / ${nombre2} = ${resultat}`;
    resultHTML.innerHTML += messageDivision;
}