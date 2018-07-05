/**
   challenges/strCount/c/util.c
   ====================================================
   CREATED: 2018-06-20
   UPDATED: 2017-07-05
   VERSION: v1.0.1
   AUTHOR: wlharvey4
   ABOUT: Utility functions for strCount.c
   NOTES: 
   CHANGE-LOG:
   ....................................................
   v1.0.1 2018-07-05T16:13:00
   convert return type to pointer
   ----------------------------------------------------
 */

# include "./util.h"

Input_Result * cc_convert(json_t * params, json_t * expected) {
  Input * _input = malloc(sizeof(Input));
  Result * _expected = malloc(sizeof(Result));
  Input_Result * input_expected = malloc(sizeof(Input_Result));

  const char * str1 = json_string_value(json_object_get(params, "str1"));
  const char   str2 = * (json_string_value(json_object_get(params, "str2")));
  Input i = {str1, str2};
  * _input = i;
  * _expected = json_integer_value(expected);

  input_expected->input    = _input;
  input_expected->expected = _expected;

  return input_expected;
}

int cc_eq(Result * result, Result * expected) {
  return * result ==  * expected;
}

void cc_print_input(Input input) {
  printf("Input:\tstr1 = %s\n\tstr2 = `%c\'\n", input.str1, input.str2);
}

void cc_print_result(Result * result) {
  printf("Result: %d\n", * result);
}

void cc_print_expected(Result * expected) {
  printf("Expected: %d\n", * expected);
}
