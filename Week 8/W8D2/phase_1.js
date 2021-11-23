function madLib(verb, adjective, noun) {
    console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`)
}

// madLib('kill','bad', 'Batman');

function isSubstring(searchString, subString){
    return searchString.includes(subString);
}

// console.log(isSubstring('Cabitathabitat', 'cat'));
// console.log(isSubstring('Cabitathabitat', 'abitat'));

function fizzBuzz(array) {
    var new_array = [];
    for (i = 0; i < array.length; i++){
        if (!(array[i] % 3 == 0 || array[i] % 5 == 0)){
            new_array.push(array[i]);
        }
    }
    // console.log(new_array);
}

// fizzBuzz([1,2,3,41,4,55,15]);

function isPrime(number) {
    if (number < 2) { return false }
    for (i = 2; i < number; i++) {
        if (number % i === 0){ return false }
    }
    return true
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(n) {

}
