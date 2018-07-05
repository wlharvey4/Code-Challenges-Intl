/**
   challenges/fizzbuzz/c/fizzbuzz.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-07-05
   VERSION: v1.0.1
   AUTHOR: wlharvey4
   ABOUT: Header for fizzbuzz.c
   NOTES:
   CHANGE-LOG:
   ....................................................
   v1.0.1 2018-07-05T16:00:00
   converted return type to pointer type (Fizzbuzz *);
   added <stdlib.h> so that memory can be malloc'ed
   ----------------------------------------------------
  */

# ifndef CC_FIZZBUZZ
# define CC_FIZZBUZZ

# include <stdlib.h>

# define FIZZ "fizz"
# define BUZZ "buzz"
# define FIZZBUZZ "fizzbuzz"

// Fizzbuzz_t identifies what kind of Fizzbuzz
typedef enum {
  NUM,
  FB,
  FZ,
  BZ,
  FZBZ
} Fizzbuzz_t;

// a Fizzbuzz is a type (NUM | FB) and a value (INT | [FZ|BZ|FZBZ])
typedef struct {
  Fizzbuzz_t fb_t;
  int fb;
} Fizzbuzz;

// an input to 'fizzbuzz()' is an object {"n": <fizzbuzz-value>}
typedef struct {
  int n;
} Input;

// Fizzbuzz prototype
Fizzbuzz * fizzbuzz(Input);

# endif
