/*
   =============================================================================
   PROJECT : Code-Challenges-Intl
   FILENAME: longestString.js
   LANGUAGE: JavaScript
   CREATED : 2018-11-29
   UPDATED : 2018-11-29
   VERSION : 0.1.0
   AUTHOR  : WLHarvey4
   -----------------------------------------------------------------------------
   CHALLENGE: Given an array of strings, return the longest.

   NOTES: 1. Calling 'reduce()' on an empty array without an initial value
	     is an error.
   -----------------------------------------------------------------------------
   CHANGE-LOG:
   -- 2018-11-29T17:30 v0.1.0: initial coding
   ===============================================================================
 */

module.exports = function longestString({arr}) {
  if (!arr.length) return null;
  return arr.reduce((a,e) => e.length > a.length ? e : a, arr[0]);
}
