/**
   challenges/strCount/c/strCount.c
   ====================================================
   CREATED: 2018-06-20
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: strCount challenge in C
   NOTES:
   ----------------------------------------------------
 */

# include "./strCount.h"

StrCount strCount(Input input) {
  const char * str1 = input.str1;
  const char   str2 = input.str2;

  int c = 0;		/* result count */
  size_t offset = 0;	/* pointer into starting point of str1 for next search */
  char * p = NULL;      /* result pointer into str1 of search for str2 */

  while ((p = strchr(str1 + offset, str2))) { /* returns NULL on failure */
    offset = p - str1 + 1; 	/* reset the offset based upon found pointer value */
    c++;
  }

  return c;
}
