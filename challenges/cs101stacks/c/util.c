/**
   challenges/cs101stacks/c/util.c
   ====================================================
   CREATED: 2018-06-23
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Utility functions for cs101stacks.c
   NOTES: 
   ----------------------------------------------------
 */

# include "./util.h"

/* CONVERT JSON INTO LOCAL DATA STRUCTURES */
/* ==================================================== */
Input_Result * cc_convert(json_t * params, json_t * expected) {

  /* Input_Result := struct { Input * input; Result * expected; } */
  /* ---------------------------------------------------- */
  Input * _input = malloc(sizeof(Input));
  Result * _expected = malloc(sizeof(Result));
  Input_Result * input_expected = malloc(sizeof(Input_Result));

  /* Here, place internals of the Input and Expected data structures */
  /* ---------------------------------------------------- */
  ...
  * _input = 
  * _expected = 

  input_expected->input    = _input;
  input_expected->expected = _expected;

  return input_expected;
}

/* EQUALITY FUNCTION; RETURN TRUE OR FALSE */
/* ==================================================== */
int cc_eq(Result result, Result expected) {
  return ...
}

/* PRINT FUNCTIONS FOR INPUT, RESULT, EXPECTED */
/* ==================================================== */
void cc_print_input(Input input) {
  printf("Input:...
}

void cc_print_result(Result result) {
  printf("Result: ...
}

void cc_print_expected(Result expected) {
  printf("Expected: ...
}
