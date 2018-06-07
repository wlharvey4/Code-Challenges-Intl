/**
   exesAndOhs.js
   ====================================================
   CREATED: 2018-06-07
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Check to see if a string has the same amount
   of 'x's and 'o's. The  method must return a boolean
   and be case insensitive. The string can contain any
   char.  When no 'x' and 'o' is present should return
   true
   NOTES: First challenge on CodeWars
   ----------------------------------------------------
 */

module.exports = exesAndOhs = input => {
  const str = input['str'];
  const re = /[xo]/ig;
  const arr = str.match(re);
  if (! arr) return true;
  const results = arr.reduce((acc, e) => { const el = e.toLowerCase(); acc[el]++; return acc; }, {'x': 0, 'o': 0})
  return results['x'] === results['o'];
}
