/**
   challenges/fibonacci/c/util.h
   ====================================================
   CREATED: 2018-09-10
   UPDATED: 
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Instead of  sending JSON  to the  challenges
          implemented  in C,  create a  helper function
          util.c that converts  the params and expected
          values to proper C values.
   NOTES:
   CHANGE-LOG:
   --version 1.0.0 2018-09-10
     initial commit
   ----------------------------------------------------
  */

# ifndef CC_UTIL
# define CC_UTIL

# include <string.h>
# include <stdio.h>
# include <jansson.h>

# include "fibonacci.h"

typedef Fibonacci Result;

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

/* Turn JSON into fibonacci objects */
Input_Result * cc_convert(json_t * params, json_t * expected);

/* fibonacci compare: return true for equal, false for nonequal values */
int cc_eq(Result *, Result *);

void cc_print_input(Input);
void cc_print_result(Result *);
void cc_print_expected(Result *);

# endif
