/**
   fizzbuzz.js
   ====================================================
   CREATED: 2018-05-13
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Javascript version of Fizzbuzz
   USAGE: fizzbuzz.js <value>
   NOTES: The single input parameter is an integer
   ----------------------------------------------------
 */

exports.fizzbuzz = n => {
  const fizz = !(n % 3),
	buzz = !(n % 5);
  return (
    fizz && buzz ? 'fizzbuzz' :
    fizz || buzz ? fizz ? 'fizz' : 'buzz' :
    n
  );
}
