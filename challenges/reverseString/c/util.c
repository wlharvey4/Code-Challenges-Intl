/**
   challenges/reverseString/c/util.c
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.1
   AUTHOR: wlharvey4
   ABOUT: reverseString.c utility implementation
   NOTES:
   CHANGE-LOG:
   ....................................................
   v0.0.1 2018-07-05T11:06:00
   initial commit
   ....................................................
   v0.1.0 2018-07-05T17:36:00
   cc works, but gives two warnings about const being discarded
   ....................................................
   v0.1.1 2018-07-05T22:45:00
   removed unnecessary save to str before assigning to _input->str
   ----------------------------------------------------
 */

# include "./util.h"

/* Convert JSON params and expected into C constructs */
Input_Result * cc_convert(json_t * params, json_t * expected) {
  Input  * _input    = malloc(sizeof(Input));
  Result * _expected = malloc(sizeof(Result));

  /* Input param str */
  _input->str = json_string_value(json_object_get(params, "str"));

  /* Result expected */
  *_expected = json_string_value(expected);

  /* Input_Result */
  Input_Result * input_result = malloc(sizeof(Input_Result));
  input_result->input = _input;
  input_result->expected = _expected;

  return input_result;
}

int cc_eq(Result * result, Result * expected) {

  size_t res_len = strlen(* result);
  size_t exp_len = strlen(* expected);

  return (res_len == exp_len && strncmp(* result, * expected, res_len + 1) == 0);
}

void cc_print_str(String str) {
  printf("%s\n", str);
}

void cc_print_input(Input input) {
  cc_print_str(input.str);
}

void cc_print_result(Result * str) {
  cc_print_str(*str);
}

void cc_print_expected(Result * str) {
  cc_print_str(*str);
}
