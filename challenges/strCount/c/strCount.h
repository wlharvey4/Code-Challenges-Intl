/**
   challenges/strCount/c/strCount.h
   ====================================================
   CREATED: 2018-06-20
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: strCount challenge in C
   NOTES:
   ----------------------------------------------------
 */

# ifndef CC_STRCOUNT
# define CC_STRCOUNT

# include <string.h>

typedef struct input {
  const char * str1;
  const char   str2;
} Input;

typedef int StrCount;

StrCount strCount(Input);

# endif
