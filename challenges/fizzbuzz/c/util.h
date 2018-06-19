/**
   challenges/util.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-19
   VERSION: 1.1.0
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

typedef Fizzbuzz Result;

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

/* Turn JSON into Fizzbuzz objects */
Input_Result * cc_convert(json_t * params, json_t * expected);

/* Fizzbuzz compare: return true for equal, false for nonequal values */
int cc_cmp(Result, Result);

/* print a Fizzbuzz value */
void cc_print(Fizzbuzz);

#endif
