/**
   challenges/strCount/javascript/strCount.js
   ====================================================
   CREATED: 2018-06-12
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT:  Create a  function called  `strCount()' that
   accepts 2 string arguments and returns an integer of
   the count  of occurrences the 2nd  argument is found
   in the first one.  If no occurrences can be found, a
   count of  0 should be returned.   The first argument
   can be  an empty string; The  second string argument
   will always be of length 1
   NOTES:
   ----------------------------------------------------
 */

module.exports = function strCount(input) {
  const str1 = input.str1,
	str2 = input.str2;

  return ((count = str1.match(RegExp(str2, 'g'))) ? count.length : 0);
}
