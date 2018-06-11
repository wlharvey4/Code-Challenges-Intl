/**
   challenges/fizzbuzz/c/fizzbuzz.c
   ====================================================
   CREATED: 2018-06-09
   UPDATED: 2018-06-11
   VERSION: 1.0.0
   AUTHOR: wlharvye4
   ABOUT: Fizzbuzz implementation in C
   NOTES:
   ----------------------------------------------------
 */

# include "./fizzbuzz.h"

Fizzbuzz fizzbuzz(Input input) {
  int n = input.n;
  int fizz = !(n % 3);
  int buzz = !(n % 5);

  int fb_t;	        // the type of answer
  int fb;	        // the answer

  if (fizz && buzz) {
    fb_t = FB;
    fb = FZBZ;
  } else if (fizz || buzz) {
    fb_t = FB;
    fb = fizz ? BZ : FZ;
  } else {
    fb_t = NUM;
    fb = n;
  }

  Fizzbuzz result = {fb_t, fb};
  return result;
}
