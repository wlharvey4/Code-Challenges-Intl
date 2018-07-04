/**
   reverseString/javascript/reverseString.js
   ====================================================
   CREATED: 2018-07-04
   VERSION: v1.0.0
   AUTHOR: wlharvey4
   ABOUT: Given a string, return a new string with the
   characters in reverse order.
   NOTES:
   CHANGE-LOG:
   v1.0.0: initial commit
   ----------------------------------------------------
 */

// params := {str: "..."}
function reverseString(params) {
  const str = params.str;
  return str.split('').reverse().join('');
}

module.exports = reverseString;
