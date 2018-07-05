/**
   challenges/fizzbuzz/c/fizzbuzz.c
   ====================================================
   CREATED: 2018-06-09
   UPDATED: 2018-07-05
   VERSION: v1.0.1
   AUTHOR: wlharvye4
   ABOUT: Fizzbuzz implementation in C
   NOTES:
   CHANGE-LOG:
   ....................................................
   v1.0.1 2018-07-05T16:00:00
   converted return type to pointer type (Fizzbuzz *);
   malloc'ed the return type's memory
   ----------------------------------------------------
 */

# include "./fizzbuzz.h"

Fizzbuzz * fizzbuzz(Input input) {
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

  Fizzbuzz * result = malloc(sizeof(Fizzbuzz));
  result->fb_t = fb_t;
  result->fb   = fb;

  return result;
}
