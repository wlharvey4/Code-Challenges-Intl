/**
   languages/c/check.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-11
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Header for check.c, C test runner
   NOTES: This implementation is dependent upon Jansson (www.digip.org/jansson),
          currently at ver 2.11 for JSON parsing; it installs by default into
	  /usr/local/lib and /usr/local/include.
   ----------------------------------------------------
 */

# ifndef CC_CHECK
# define CC_CHECK

# include <stdlib.h>
# include <stdio.h>
# include <jansson.h>

# include "../../challenges/fizzbuzz/c/fizzbuzz.h"
# include "../../challenges/util.h"

# define READ "r"

typedef struct {
  int ok;
  int failed;
} Results;

# endif
