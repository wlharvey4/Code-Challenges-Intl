/**
   challenges/reverseString/c/reverseString.c
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.1
   AUTHOR: wlharvey4
   ABOUT: Given a string, return the string reversed.
   NOTES: 
   CHANGE-LOG:
   ....................................................
   v0.0.1 2018-07-05T13:20:00
   initial commit
   ....................................................
   v0.1.0 2018-07-05T17:36:00
   cc works, but gives 2 warnings about const being discarded
   ....................................................
   v0.1.1 2018-07-05T19:00:00
   removed warnings, but did not use typedef as I want
   ----------------------------------------------------
 */

# include "./reverseString.h"

String * reverseString(Input params) {
  String str = params.str;
  size_t l = strlen(str);
  const char ** revstr;
  revstr = malloc(sizeof(char *));
  *revstr = malloc(l);

  char * s = malloc(l);
  for (int i = 0; i < l; i++)
    *(s + l - i - 1) = *(str + i);

  *revstr = s;

  return revstr;
}
