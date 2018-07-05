/**
   challenges/strCount/c/strCount.h
   ====================================================
   CREATED: 2018-06-20
   UPDATED: 2018-07-05
   VERSION: v0.1.1
   AUTHOR: wlharvey4
   ABOUT: strCount challenge in C
   NOTES:
   CHANGE-LOG:
   ....................................................
   v0.1.1 2018-07-05T16:15:00
   convert return type to pointer; add <stdlib.h> for
   malloc function
   ----------------------------------------------------
 */

# ifndef CC_STRCOUNT
# define CC_STRCOUNT

# include <stdlib.h>
# include <string.h>

typedef struct input {
  const char * str1;
  const char   str2;
} Input;

typedef int StrCount;

StrCount * strCount(Input);

# endif
