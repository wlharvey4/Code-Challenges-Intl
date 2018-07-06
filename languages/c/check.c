/**
   languages/c/check.c
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-07-05
   VERSION: v1.3.2
   AUTHOR: wlharvey4
   ABOUT: Test runner for C implementation
   NOTES: 
   COMPILATION USING DYLIB:
     -- create a dynamic library from the code challenge and a utility file
     clang [-g] -Wall -o libfizzbuzz.dylib -shared -fpic fizzbuzz.c util.c -ljansson
     -- compile the `check' program dynamically using the dynamic library created above
     clang [-g] -Wall -o check check.c -I ../../challenges/fizzbuzz/c -L ../../challenges/fizzbuzz/c -lfizzbuzz -ljansson
     DYLD_LIBRARY_PATH=../../challenges/fizzbuzz/c ./check fizzbuzz

     or place libfizzbuzz.dylib in /usr/local/lib
     then clang -o check check.c -ljansson -lfizzbuzz
     ./check fizzbuzz
     nm check
     otool -L check
   DEBUG: 
     lldb -- check <code-challenge>
     (lldb) breakpoint set --name main
     (lldb) run
   TODO: Free *result if also a malloc'ed pointer (see reverseString)
   CHANGE-LOG:
   ....................................................
   v1.3.1 2018-07-05T16:00:00
   converted Result type to Result pointer type so that
   memory can be allocated in the code challenge and then
   freed under all circumstances
   ....................................................
   v1.3.2 2018-07-05T23:40:00
   added TODO and note about *result not being free'd without
   compiler warning
   ----------------------------------------------------
 */

# include "./check.h"

int main (int argc, char ** argv) {

  /* LOCAL VARIABLES */
  /*******************/
  void * handle;	 /* reference to dynamically-linked and loaded code challenge */
  Result * (*fn)(Input); /* reference to function exported by the code challenge */
  char * cc_name;        /* code challenge name from command line */
  char cc_dir[BUFSIZ];	 /* full path to code challenge */
  char ccjson[BUFSIZ];   /* path to code challenge JSON data file */
  int cclen;             /* length of copied path */
  FILE * ccfp;           /* File pointer to CC JSON data file */
  json_t * json;         /* parsed JSON data */
  int size;              /* size of JSON array */
  Results results = {0, 0};

  /* COMMAND LINE ARGUMENT: CODE CHALLENGE NAME */
  /**********************************************/
  if (argc != 2) {
    printf("USAGE: ./check <code-challenge>\n");
    exit(-1);
  }
  cc_name = argv[1];

  memset(cc_dir, '\0', BUFSIZ);
  printf("Code Challenge: %s\n", cc_name);
  cclen = snprintf(cc_dir, BUFSIZ, "../../challenges/%s/c/lib%s.dylib", cc_name, cc_name);
  if (cclen >= BUFSIZ || cclen < 0) {
    printf("ERROR creating CC NAME path; program terminated.");
    exit(-1);
  }

  /* DYNAMICALLY LOAD AND LINK TO THE CODE CHALLENGE */
  /***************************************************/
  handle = dlopen(cc_dir, RTLD_NOW);
  fn = dlsym(handle, cc_name);

  /* CONSTRUCT PATH TO CODE CHALLENGE JSON DATA FILE  */
  /****************************************************/
  memset(ccjson, '\0', BUFSIZ);
  cclen = snprintf(ccjson, BUFSIZ, "../../challenges/%s/%s.json", cc_name, cc_name);
  if (cclen >= BUFSIZ || cclen < 0) {
    printf("ERROR creating CC JSON path; program terminated.");
    exit(-1);
  }

  /* PARSE JSON DATA INTO MEMORY */
  /*******************************/
  ccfp = fopen(ccjson, READ);
  if (!ccfp) {
    printf("Error opening code challenge JSON data file %s\n", ccjson);
    exit(-1);
  }
  json = json_loadf(ccfp, 0, NULL);
  fclose(ccfp);

  /* ITERATE THROUGH JSON DATA, PROCESSING EACH TEST  */
  /****************************************************/
  size = json_array_size(json);
  for (int i = 0; i < size; i++) {
    /* get the JSON values for the current test */
    json_t * test = json_array_get(json, i);
    json_t * params_json = json_object_get(test, "params");
    json_t * expected_json = json_object_get(test, "expected");

    /* convert the JSON values into C structs using code challenge utility function */
    Input_Result * input_expected = cc_convert(params_json, expected_json);
    Input input       = * input_expected->input;
    Result * expected = input_expected->expected;

    /* call the code challenge with the Input value */
    Result * result = fn(input); /* if *result is a pointer, it needs to be free'd,
				    but results in a compiler warning */

    /* check the result against the expected value */
    if (cc_eq(result, expected)) {
      results.ok++;
    } else {
      results.failed++;
      printf("ERROR:\n");
      cc_print_input(input);
      cc_print_result(result);
      cc_print_expected(expected);
      printf("\n");
    }

    free(input_expected->input);
    free(input_expected->expected);
    free(input_expected);
    /* free(*result); <- results in compiler warning but not error */
    free(result);
  }

  printf("\nResults:\n");
  printf("OK:\t%2d\n", results.ok);
  printf("FAILED:\t%2d\n", results.failed);
}
