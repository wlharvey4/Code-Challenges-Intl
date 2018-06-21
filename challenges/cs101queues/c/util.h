/**
   challenges/cs101Queues/c/util.h
   ====================================================
   CREATED: 2018-06-20
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

# include "./cs101Queues.h"

typedef CS101Queues Result;

/* a struct that holds the converted JSON input and expected values */
typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

/* Turn JSON into cs101Queues objects */
Input_Result * cc_convert(json_t * params, json_t * expected);

/* cs101Queues compare: return true for equal, false for nonequal values */
int cc_eq(Result, Result);

/* print a cs101Queues value */
void cc_print_input(Input);

void cc_print_result(Result);

void cc_print_expected(Result);

#endif
