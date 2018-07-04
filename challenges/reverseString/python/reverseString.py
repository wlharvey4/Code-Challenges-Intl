# challenges/reverseString/python/reverseString.py
# ====================================================
# CREATED: 2018-07-04
# UPDATED: 2018-07-04
# VERSION: v1.0.0
# AUTHOR: wlharvey4
# ABOUT: Given a string, return a new string with the
#        characters in reverse order.
# NOTES: `reversed()` is a built-in function that reverses
#         an `iterator'; confusedly, there is also a
#         `reverse()` method on lists that reverses the
#         list in-place but does not return anything, to
#         `remind' users that it operates by side effects!
#         I originally tried the below implementation using
#         `reverse()` and it simply did not work, and almost
#         gave up using that `obvious` method until by chance
#         I found the answer from a Digital Ocean article!
# CHANGE-LOG:
#   v1.0.0: iniital commit
# ----------------------------------------------------

# params: {str: "..."}
def reverseString(params):
    str = params['str']
    return ("".join(reversed(str)))
