/**
   fizzbuzz.js
   ================================================================
   CREATED: 2018-05-11
   VERSION: 1.0
   AUTHOR : pinecone
   ABOUT  : The FizzBuzz Challenge
   NOTES  : given a number n, return 'fizz' if n is divisible by 3,
            return 'buzz' if n is divisible by 5, return 'fizzbuzz'
            if n  is divisible by both  3 and 5,  or n if n  is not
            divisible by either.
   ----------------------------------------------------------------
 */

const { checkData } = require('../check-data');

const fizzbuzz = n => {
  const fizz = !(n%3),
	buzz = !(n%5);
  return (
    fizz && buzz ? 'fizzbuzz' :
      fizz || buzz ? fizz ? 'fizz' : 'buzz' :
    n
  );
}
 
const data = [
  {in: 0, out: 'fizzbuzz'},
  {in: 1, out: 1},
  {in: 2, out: 2},
  {in: 3, out: 'fizz'},
  {in: 4, out: 4},
  {in: 5, out: 'buzz'},
  {in: 6, out: 'fizz'},
  {in: 7, out: 7},
  {in: 8, out: 8},
  {in: 9, out: 'fizz'},
  {in: 10, out: 'buzz'},
  {in: 11, out: 11},
  {in: 12, out: 'fizz'},
  {in: 13, out: 13},
  {in: 14, out: 14},
  {in: 15, out: 'fizzbuzz'},
  {in: 16, out: 16},
  {in: 17, out: 17},
  {in: 18, out: 'fizz'},
  {in: 19, out: 19},
  {in: 20, out: 'buzz'},
  {in: 21, out: 'fizz'},
  {in: 22, out: 22},
  {in: 23, out: 23},
  {in: 24, out: 'fizz'},
  {in: 25, out: 'buzz'},
  {in: 26, out: 26},
  {in: 27, out: 'fizz'},
  {in: 28, out: 28},
  {in: 29, out: 29},
  {in: 30, out: 'fizzbuzz'},
];

checkData(data, fizzbuzz);
