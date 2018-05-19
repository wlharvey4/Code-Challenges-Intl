/**
   fizzbuzz.js
   ====================================================
   CREATED: 2018-05-13
   UPDATED: 2018-05-19
   VERSION: 2.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Javascript version of Fizzbuzz
   USAGE:   fizzbuzz.js <value>
   NOTES:   The single input parameter is an object
   ----------------------------------------------------
 */

module.exports = fizzbuzz = ({ n }) => {
  const fizz = !(n % 3),
	buzz = !(n % 5);
  return (
    fizz && buzz ? 'fizzbuzz' :
    fizz || buzz ? fizz ? 'fizz' : 'buzz' :
    n
  );
}
