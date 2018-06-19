/**
   languages/c/check.c
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-18
   VERSION: 1.0.1
   AUTHOR: wlharvey4
   ABOUT: Test runner for C implementation
   NOTES: 
   COMPILATION:
     clang -o check check.c ../../challenges/util.c ../../challenges/fizzbuzz/c/fizzbuzz.c -ljansson
   DEBUG: 
     clang -g -o check check.c ../../challenges/util.c ../../challenges/fizzbuzz/c/fizzbuzz.c -ljansson
     lldb -- check <code-challenge>
     (lldb) breakpoint set --name main
     (lldb) run
   DYLIB:
     clang -shared -fpic fizzbuzz.c ../../util.c -I ../../ -o libfizzbuzz.dylib
     place libfizzbuzz.dylib in /usr/local/lib
     clang -o check check.c -ljansson -lfizzbuzz
     or reference directly [clang -o check check.c ../../challenges/fizzbuzz/c/libfizzbuzz.dylib -ljansson]
     nm check
     otool -L check
   ----------------------------------------------------
 */

# include "./check.h"

int main (int argc, char ** argv) {

  /* LOCAL VARIABLES */
  /*******************/
  void * handle;	 /* reference to dynamically-linked and loaded code challenge */
  Fizzbuzz (*fn)(Input); /* reference to function exported by the code challenge */
  char * cc_name;        /* code challenge name from command line */
  char ccjson[BUFSIZ];   /* path to code challenge JSON data file */
  size_t cclen;          /* length of ccjson */
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
  printf("Code Challenge: %s\n", cc_name);

  handle = dlopen("../../challenges/fizzbuzz/c/libfizzbuzz.dylib", RTLD_NOW);
  fn = dlsym(handle, "fizzbuzz");

  /* CONSTRUCT PATH TO CODE CHALLENGE JSON DATA FILE  */
  /****************************************************/
  if ((cclen = snprintf(ccjson, BUFSIZ, "../../challenges/%s/%s.json", cc_name, cc_name)) >= BUFSIZ) {
    printf("Error creating CC JSON path; program terminated.");
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
    Input_Expected * input_expected = fizzbuzz_convert(params_json, expected_json);
    Input input       = * input_expected->input;
    Fizzbuzz expected = * input_expected->expected;

    /* call the code challenge with the Input value */
    Fizzbuzz result = fn(input);//fizzbuzz(input);

    /* check the result against the expected value */
    if (fizzbuzz_cmp(result, expected)) {
      results.ok++;
    } else {
      results.failed++;
      printf("Failed n = %d\n", input.n);
      printf("Result: ");
      fizzbuzz_print(result);
      printf("Expected: ");
      fizzbuzz_print(expected);
      printf("\n");
    }

    free(input_expected->input);
    free(input_expected->expected);
    free(input_expected);
  }

  printf("\nResults:\n");
  printf("OK:\t%2d\n", results.ok);
  printf("FAILED:\t%2d\n", results.failed);
}
