# fibonacci/python/fibonacci.py
######################################################################
# CREATED: 2018-09-09
# UPDATED:
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: Fibonacci in Python
# NOTES:
######################################################################

cache = [1, 1]
def fibonacci(params):
    n = params['n']
    if len(cache) > n:
        return cache[n]
    fib = fibonacci({"n": n - 2}) + fibonacci({"n": n - 1})
    cache.append(fib)
    return fib
