/**
   evenFib.js
   ====================================================
   CREATED: 2018-09-06
   MODIFIED:
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   CHALLENGE: By considering the terms in the Fibonacci sequence
   whose values do not exceed four million, find the sum of
   the even-valued terms.
   NOTES: Be sure to use the Fibonacci module
   ----------------------------------------------------
 */
const fibonacci = require('../../fibonacci/javascript/fibonacci.js');

/* {"m": <value>}, where value represents maximum fibonacci term (exclusive) */
const evenFib = ({ m }) => {
  let total = 0;
  let n = 0; /* fibonacci sequence number */
  let fib;

  while ((fib = fibonacci({ "n": n++ })) < m) {
    total += !(fib % 2) ? fib : 0;
  }
  return total;
}

module.exports = evenFib;
