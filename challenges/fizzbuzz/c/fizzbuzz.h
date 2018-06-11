/**
   challenges/fizzbuzz/c/fizzbuzz.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-11
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Header for fizzbuzz.c
   NOTES:
   ----------------------------------------------------
  */

# ifndef CC_FIZZBUZZ
# define CC_FIZZBUZZ

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
Fizzbuzz fizzbuzz(Input);

# endif
