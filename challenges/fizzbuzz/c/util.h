/**
   challenges/util.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-20
   VERSION: 1.3.0
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

# include "./fizzbuzz.h"

typedef Fizzbuzz Result;

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

/* Turn JSON into Fizzbuzz objects */
Input_Result * cc_convert(json_t * params, json_t * expected);

/* Fizzbuzz equal: return true for equal, false for nonequal values */
int cc_eq(Result, Result);

void cc_print_input(Input);
void cc_print_result(Result);
void cc_print_expected(Result);

#endif
