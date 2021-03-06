/**
   languages/c/check.h
   ====================================================
   CREATED: 2018-06-10
   UPDATED: 2018-06-20
   VERSION: v1.1.0
   AUTHOR: wlharvey4
   ABOUT: Header for check.c, C test runner
   NOTES: This implementation is dependent upon Jansson: see
          o www.digip.org/jansson, 
	  o https://github.com/akheron/jansson, and
	  o https://jansson.readthedocs.io/en/latest/
          currently at ver 2.11 for JSON parsing;
	  it installs by default into
	  /usr/local/lib and /usr/local/include.
   CHANGE-LOG:
   ....................................................
   v1.1.0 2018-07-05T16:09:00
   updated format
   ----------------------------------------------------
 */

# ifndef CC_CHECK
# define CC_CHECK

# include <dlfcn.h>
# include <stdlib.h>
# include <stdio.h>
# include <jansson.h>

# include "./util.h"

# define READ "r"

typedef struct {
  int ok;
  int failed;
} Results;

# endif
