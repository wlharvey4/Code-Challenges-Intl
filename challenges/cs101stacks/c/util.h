/**
   challenges/cs101stacks/c/util.h
   ====================================================
   CREATED: 2018-06-23
   VERSION: 0.0.1
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

# include "cs101stacks.h"

typedef cs101stacks Result;

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

/* Turn JSON into cs101stacks objects */
Input_Result * cc_convert(json_t * params, json_t * expected);

/* cs101stacks compare: return true for equal, false for nonequal values */
int cc_eq(Result, Result);

/* print a cs101stacks value */
void cc_print(Result);

#endif
