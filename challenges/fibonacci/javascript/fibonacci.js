/**
   fibonacci.js
   ====================================================
   CREATED: 2018-09-06
   UPDATED:
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Javascript version of Fibonacci sequence
   USAGE: fibonacci.js <value>
   NOTES: According to Wikipedia, there is ambiguity as
          to what the first two numbers in the sequence
   	  are, or rather, what the first number is.
   	  Historically, the first two nubmers were 1, 1
   	  but modernly the sequence is extended by a 0.
	  This implementation uses the historical
	  sequence beginnning with 1, 1.
   ----------------------------------------------------
 */

const cache = [1, 1];
const fibonacci = ({ n }) => {
  if (cache.length > n) return cache[n];
  const fib = fibonacci({"n" : n - 2}) + fibonacci({"n": n - 1});
  cache[n] = fib;
  return fib;
}

module.exports = fibonacci;
