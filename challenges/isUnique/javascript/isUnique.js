/**
   isUnique.js
   ====================================================
   CREATED: 2018-05-19
   VERSION: 1.0.0
   ABOUT: Implement an algorithm to determine if a
          string has all unique characters.
   NOTES: Extra Credit - Answer this question - What if
          you cannot use additional data structures?
   ----------------------------------------------------
 */

const isUnique = ({ str }) => {
  const set = new Set(str);
  return set.size === str.length;
}

/* This code solves the problem without using any additional
   data structrues; uncomment this code and comment the above
   code to test it.

const isUnique = ({ str }) => {
  return str.split('').sort().reduce((acc, e, i, arr) => {
    if (i === arr.length) return acc;
    return ( acc && (e != arr[i + 1]));
  }, true);
}
*/

module.exports = isUnique;
