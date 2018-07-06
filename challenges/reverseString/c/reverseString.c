/**
   challenges/reverseString/c/reverseString.c
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.2
   AUTHOR: wlharvey4
   ABOUT: Given a string, return the string reversed.
   NOTES: The return value of a JSON String is read-only
          and must not be modified or freed by the user;
	  *revstr must also be a const to avoid messy
	  compiler warnings, but its value needs to be
	  constructed piece by piece, and so must be
	  mutable; both revstr and *revstr need to be
	  freed; however, check.c will only free revstr
	  as written.
   TODO: Figure out how to free *revstr in check.c
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
   ....................................................
   v0.1.2 2018-07-05T22:28:00
   used char * for temp var instead of String; compiler
   warnings gone because String is a const char *;
   ----------------------------------------------------
 */

# include "./reverseString.h"

String * reverseString(Input params) {
  String str = params.str;
  size_t l = strlen(str);

  /* String revstr must be a const because json_t produces a const */
  String * revstr = malloc(sizeof(String));

  /* The contents of String s must be mutable, and so char * instead of String */
  char * s = malloc(l); /* This memory is never free'ed in check.c */
  for (int i = 0; i < l; i++)
    *(s + l - i - 1) = *(str + i);

  *revstr = s;

  return revstr;
}
