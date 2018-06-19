/**
   challenges/util.h
   ====================================================
   CREATED: 2018-06-10
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Instead of  sending JSON  to the  challenges
          implemented  in C,  create a  helper function
          util.c that converts  the params and expected
          values to proper C values.
   NOTES:
   ----------------------------------------------------
  */

# ifndef CC_UTIL
# define CC_UTIL

# include <string.h>
# include <stdio.h>
# include <jansson.h>

# include "fizzbuzz.h"

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Fizzbuzz * expected;
} Input_Expected;

/* Turn JSON into Fizzbuzz objects */
Input_Expected * fizzbuzz_convert(json_t * params, json_t * expected);

/* Fizzbuzz compare: return true for equal, false for nonequal values */
int fizzbuzz_cmp(Fizzbuzz, Fizzbuzz);

/* print a Fizzbuzz value */
void fizzbuzz_print(Fizzbuzz);

#endif
