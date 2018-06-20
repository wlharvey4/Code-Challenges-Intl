/**
   challenges/util.c
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-19
   VERSION: 1.2.0
   AUTHOR: wlharvey4
   ABOUT: Instead of  sending JSON  to the  challenges
          implemented  in C,  create a  helper function
          util.c that converts  the params and expected
          values to proper C values.
   NOTES:
   ----------------------------------------------------
  */

# include "./util.h"

Input_Result * cc_convert(json_t * params, json_t * expected) {

  /* LOCAL VARIABLES FOR RETURN */
  /******************************/
  Input    * _input    = malloc(sizeof(Input));
  Fizzbuzz * _expected = malloc(sizeof(Fizzbuzz));
  Input_Result * input_expected = malloc(sizeof(Input_Result));

  /* local temporary variables */
  /* ------------------------- */
  const char * fizzbuzz; /* String value of an expected */
  int fb_t;              /* NUM | FB */
  int fb;                /* Enum value of a Fizzbuzz */

  /* FIZZBUZZ INPUT IS {"n": INT} */
  /********************************/
  _input->n = json_integer_value(json_object_get(params, "n"));

  /* FIZZBUZZ OUTPUT IS FB | INT */
  /***********************************/
  if (json_is_string(expected)) {
    fb_t = FB;
    fizzbuzz = json_string_value(expected);
    size_t size = strlen(fizzbuzz);
    if (size == 8) {
      fb = FZBZ;
    } else {
      if (strncmp(fizzbuzz, FIZZ, 5)) {
	fb = FZ;
      } else {
	fb = BZ;
      }
    }
  } else {
    fb_t = NUM;
    fb = json_integer_value(expected);
  }
  _expected->fb_t = fb_t;
  _expected->fb   = fb;
  
  /* PREPARE RETURN VALUE OF CONVERTED INPUT / OUTPUT */
  /* **************************************************/
  input_expected->input    = _input;
  input_expected->expected = _expected;

  return input_expected;
}

int cc_eq(Result result, Result expected) {
  return ((result.fb_t == expected.fb_t) && (result.fb == expected.fb));
}

void cc_print(Result fb) {
  switch(fb.fb_t) {
  case 0:
    printf("%d\n", fb.fb);
    break;
  case 1:
    switch(fb.fb) {
    case 2:
      printf("%s\n", FIZZ);
      break;
    case 3:
      printf("%s\n", BUZZ);
      break;
    case 4:
      printf("%s\n", FIZZBUZZ);
      break;
    }
    break;
  default:
    printf("ERROR printing fb: unknown type");
    exit (-1);
  }
}
