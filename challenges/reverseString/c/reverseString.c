/**
   challenges/reverseString/c/reverseString.c
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.0
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
   ----------------------------------------------------
 */

# include "./reverseString.h"

String * reverseString(Input params) {
  String str = params.str;
  size_t l = strlen(str);
  String * revstr = malloc(sizeof(String));
  * revstr = malloc(l + 1);

  for (int i = 0; i < l; i++)
    * (* revstr + l - i - 1) = * (str + i);

  * (* revstr + l) = '\0';

  return revstr;
}
