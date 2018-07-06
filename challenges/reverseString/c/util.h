/**
   challenges/reverseString/c/util.h
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: V0.1.0
   AUTHOR: wlharvey4
   ABOUT: helper utilities for reverseString.c
   NOTES:
   CHANGE-LOG: 
   ....................................................
   2018-07-05T11:00:00
   initial commit
   ....................................................
   2018-07-05T17:36:00
   cc works but gives two warnings about const being discarded
   ----------------------------------------------------
 */

# ifndef CC_UTIL
# define CC_UTIL

# include <string.h>
# include <jansson.h>
# include "./reverseString.h"

typedef String Result;

typedef struct {
  Input * input;
  Result * expected;
} Input_Result;

Input_Result * cc_convert(json_t * params, json_t * expected);

int cc_eq(Result *, Result *);

void cc_print_input(Input);
void cc_print_result(Result *);
void cc_print_expected(Result *);

# endif
