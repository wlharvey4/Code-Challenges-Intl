/**
   challenges/reverseString/c/reverseString.h
   ====================================================
   CREATED: 2018-07-05
   UPDATED: 2018-07-05
   VERSION: v0.1.1
   AUTHOR: wlharvey4
   ABOUT: Given a string, return the string reversed
   NOTES:
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
