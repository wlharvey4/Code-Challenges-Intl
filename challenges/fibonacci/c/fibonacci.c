/**
   challenges/fibonacci/c/fibonacci.c
   ============================================================
   CREATED: 2018-09-10
   UPDATED: 
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Fibonacci solution in C
   NOTES: Still need to refactor to make sure the return variable
          fib_result is properly freed
   CHANGE-LOG:
   --version 1.0.0 2018-09-10
     initial commit
   ============================================================
 */

# include "./fibonacci.h"

Fibonacci * fibonacci(Input input) {
  int n = input.n; /* Fibonacci sequence number */
  fib_result = malloc(sizeof(Fibonacci)); /* TODO: refactor to free return var */
  initCache(n);

  int fib = _fibonacci(n); /* call recursive subroutine */
  fib_result->fib = fib;
  free(cache->c);
  free(cache);

  return fib_result;
}

/* recursively calculate Fibonacci value for sequence item n
   using cache of calculated values */
int _fibonacci(int n) {
  if (cache->index > n) return cache->c[n];
  int fib = _fibonacci(n - 2) + _fibonacci(n - 1);
  pushCache(fib);
  return fib;
}

/* set up a resizing cache of initial size DEFAULT_SIZE,
   with prepopulated values (1,1) */
void initCache(int n) {
  cache = malloc(sizeof(Cache));
  cache->c = calloc(DEFAULT_SIZE, sizeof(int));

  if (cache == NULL || cache->c == NULL) {
    printf("ERROR allocating the cache  in `initCache'\n");
    exit(-1);
  }

  cache->size = DEFAULT_SIZE; /* initial cache size */
  cache->index = 2; /* next index */
  cache->c[0] = 1;
  cache->c[1] = 1;
}

/* some getters and setters for the resizing cache */
int cacheSize() {
  return cache->size;
}

int doubleCacheSize() {
  cache->size *= 2;
  return cacheSize();
}

int cacheIndex() {
  return cache->index;
}

int incCacheIndex() {
  cache->index += 1;
  return cacheIndex();
}

/* double the size of the cache when it is full */
void doubleCache() {
  if ((cache->c = realloc(cache->c, doubleCacheSize() * sizeof(int))) == NULL) {
    printf("ERROR reallocating the cache in `doubleCache'\n");
    exit(-1);
  }
}

/* push a fib value onto the cache, resizing it if necessary */
int pushCache(int fib) {
  if (cacheIndex() == cacheSize()) {
    doubleCache();
  }
  cache->c[cacheIndex()] = fib;
  incCacheIndex();
  return fib;
}
