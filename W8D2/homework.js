function madLib(verb, adject, noun) {
    console.log( `We shall ${verb.toUpperCase()} the ${adject.toUpperCase()} ${noun.toUpperCase()}`)
}

// madLib("make", "best", "pho") 

function isSubstring(string, substring) {
  return string.includes(substring);
}

// console.log(isSubstring("Yong", "on")) 

function fizzBuzz(arr) {
  res = [];
  for (let i = 0; i <= arr.length-1; i++) {
    if (arr[i] % 3 === 0 || arr[i] % 5 === 0) {
      res.push(arr[i])
    }
  }
  return res
}

// console.log(fizzBuzz([1,2,3,5,6,9]))

function isPrime(num) {
  for (let i = num-1; i >= 2; i--){
    if (num % i === 0) {
      return false
    }
  }
  return true 
}

// console.log(isPrime(4))

function sumOfNPrimes(num) {
  let count = num;
  let test = 2;
  let sum = 0;
  // arr = [];
  while (count > 0){
    if (isPrime(test)) {
      sum += test;
      // arr.push(test);
      test += 1;
      count -= 1; 
    }
    else {
      test += 1;
    }
  }
  return sum
}

console.log(sumOfNPrimes(4))