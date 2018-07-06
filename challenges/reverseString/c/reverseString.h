/**
   challenges/reverseString/c/reverseString.h
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.2
   AUTHOR: wlharvey4
   ABOUT: Given a string, return the string reversed
   ____________________________________________________
   NOTES: From comp.lang.c FAQ list · Question 11.9:

   Q: What's the difference between const char * p, char const * p, and char * const p?

   A: The first two are interchangeable; they declare a pointer to a
   constant character (you can't change any pointed-to
   characters). char * const p declares a constant pointer to a
   (variable) character (i.e. you can't change the pointer).
   ____________________________________________________

   CHANGE-LOG:
   ....................................................
   v0.0.1 2018-07-05T10:45:00
   initial commit
   ....................................................
   v0.1.0 2018-07-05T17:36:00
   cc works, but gives two warnings about const being discarded
   ....................................................
   v0.1.1 2018-07-05T19:00:00
   changed typedef char * String to typedef const char * String,
   which helped to removed warnings
   ....................................................
   v0.1.2 2018-07-05T22:28:00
   reviewed differences between
   const char *, char const *, and char * const in C FAQ
   ----------------------------------------------------
 */

# ifndef CC_REVERSESTRING
# define CC_REVERSESTRING

# include <stdlib.h>
# include <string.h>

typedef const char * String;

/* an input to reverseString is a String */
typedef struct {
  String str;
} Input;

/* reverseString prototype */
String * reverseString(Input);

# endif
