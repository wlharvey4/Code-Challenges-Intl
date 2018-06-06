# fizzbuzz/python/python.py
# ====================================================
# CREATED: 2018-05-29
# UPDATED: 2018-06-05
# VERSION: 0.2.0
# AUTHOR: wlharvey4
# ABOUT: Fizzbuzz code challenge in Python3
# NOTES:
# ----------------------------------------------------

# nn := {'n': INT}
def fizzbuzz(nn):

 FIZZ = "fizz"
 BUZZ = "buzz"
 FIZZBUZZ = "fizzbuzz"
 
 # n := INT
 n = nn['n']

 fizz = not (n % 3)
 buzz = not (n % 5)

 return FIZZBUZZ if (fizz and buzz) \
    else (FIZZ if fizz else BUZZ) if (fizz or buzz) \
    else n
