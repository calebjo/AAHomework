// let callback = function() {
//     console.log('HAMMERTIME!');
// }
// let timeToWait = 5000;

// setTimeout(callback, timeToWait);

// Because we can use the website as the setTimeout occurs, this
// means that setTimeout is asynchronous.

// function hammerTime(time){
//     let callback = function() {
//         console.log(`${time} is hammertime!`);
//     }
//     let timeToWait = time;
    
//     setTimeout(callback, timeToWait);
// }

// hammerTime(3000);

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
    let first, second;

    reader.question('Would you like some tea?', (res) => {
        first = res;
        console.log(`You replied ${res}.`);
    });

    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
  
    reader.question('Would you like some biscuits?', (res2) => {
      second = res;
      console.log(`You replied ${res2}.`);
    });
  
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';

    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
}

teaAndBiscuits();





// // Simple Timeout

// window.setTimeout(function () {
//     alert('HAMMER TIME!');
//   }, 5000);
  
//   // // Timeout with a Closure
  
//   function hammerTime (time) {
//     window.setTimeout(function () {
//       alert(`${time} is HAMMER TIME!`);
//     });
//   }
  
//   // Some tea? Some biscuits?
  
//   const readline = require('readline');
  
//   const reader = readline.createInterface({
//     // it's okay if this part is magic; it just says that we want to
//     // 1. output the prompt to the standard output (console)
//     // 2. read input from the standard input (again, console)
  
//     input: process.stdin,
//     output: process.stdout
//   });
  
//   function teaAndBiscuits () {
//     reader.question('Would you like some tea?', function (res) {
//       console.log(`You replied ${res}.`);
//       reader.question('Would you like some biscuits?', function (res2) {
//         console.log(`You replied ${res2}.`);
        
//         const first = (res === 'yes') ? 'do' : 'don\'t';
//         const second = (res2 === 'yes') ? 'do' : 'don\'t';
  
//         console.log(`So you ${first} want tea and you ${second} want biscuits.`);
//         reader.close();
//       });
//     });
//   }