/**
   challenges/palindrome/javascript/palindrome.js
   ====================================================
   CREATED: 2018-07-06
   UPDATED: 2018-07-06
   VERSION: v1.0.0
   AUTHOR: wlharvey4
   ABOUT: Given a string, return true if the string is a
   palindrome or false if it is not.
   NOTES:
   CHANGE-LOG:
   ----------------------------------------------------
 */

function palindrome(input) {
  const str   = input.str;

  const len   = str.length;
  const half  = Math.floor(len/2); // can ignore the middle
  const left  = str.slice(0, half);
  // half the work of reversing and comparing the entire string
  const right = str.slice(len-half).split('').reverse().join('');
  return left === right;
}

module.exports = palindrome;
