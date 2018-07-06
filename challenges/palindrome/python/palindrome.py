# challenges/palindrome/python/palindrome.py
# ====================================================
# CREATED: 2018-07-06
# UPDATED: 2018-07-06
# VERSION: v1.0.0
# AUTHOR: wlharvey4
# ABOUT:
# NOTES:
#
# --REVERSE: Python’s str string objects have no built-in .reverse()
# method like you might expect if you’re coming to Python from a
# different language,
#
# --SEQUENCE PROTOCOL: Strings follow the sequence protocol in Python;
# all sequences support an interesting feature called `slicing.'
# It includes a special case where slicing a sequence with “[::-1]”
# produces a reversed copy. (Who'd have thunk?)
#
# --DIVISION: / always returns a float. To do floor division and get
# an integer result (discarding any fractional result) you can use the
# // operator;
#
# CHANGE-LOG:
# ----------------------------------------------------

def palindrome(params):
    str = params['str']

    leng = len(str)
    half = leng // 2
    return (str[:half] == str[leng-half:][::-1])
