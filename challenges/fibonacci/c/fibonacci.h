/**
   challenges/fibonacci/c/fibonacci.h
   ============================================================
   CREATED: 2018-09-10
   UPDATED: 
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Fibonacci solution in C
   NOTES:
   CHANGE-LOG:
   --version 1.0.0 2018-09-10
     initial commit
   ============================================================
 */

# ifndef CC_FIBONACCI
# define CC_FIBONACCI

# include <stdlib.h>
# include <stdio.h>

# define DEFAULT_SIZE 10

/* input parameter: n (integer) */
typedef struct {
  int n;
} Input;

/* output value: fib (integer) */
typedef struct {
  int fib;
} Fibonacci;

/* resizing cache */
typedef struct {
  int size;  /* current max size   */
  int index; /* current index pos  */
  int * c;   /* a buffer with size */
} Cache;


/* prototypes for the resizing cache */
Cache * cache;
void initCache(int);
int  cacheSize(void);
int  doubleCacheSize();
int  cacheIndex(void);
int  incCacheIndex(void);
void doubleCache(void);
int  pushCache(int);

/* main prototype and return var */
Fibonacci * fib_result;
Fibonacci * fibonacci(Input);

/* recursive routine prototype */
int _fibonacci(int);

# endif
