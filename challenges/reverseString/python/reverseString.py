# challenges/reverseString/python/reverseString.py
# ====================================================
# CREATED: 2018-07-04
# UPDATED: 2018-07-04
# VERSION: v1.1.0
# AUTHOR: wlharvey4
# ABOUT: Given a string, return a new string with the
#        characters in reverse order.
# NOTES:
#
# --`reversed()` is a built-in function that reverses an `iterator';
# confusedly, there is also a `reverse()` method on lists that
# reverses the list in-place but does not return anything, to `remind'
# users that it operates by side effects.  The `iterator' must be
# joined into a string, which makes it slower than the slicing method.
#
# --SEQUENCE PROTOCOL: Strings follow the sequence protocol in
# Python. And all sequences support an interesting feature called
# slicing. You can view slicing as an extension of the square-brackets
# indexing syntax.  It includes a special case where slicing a
# sequence with “[::-1]” produces a reversed copy.  It is a fast
# albeit arcane solution.
#
# CHANGE-LOG:
#   v1.0.0 2018-07-04T00:00:00
#           iniital commit
# ....................................................
#   v1.1.0 2018-07-06T15:20:00
#           Learned about the slicing sequence method,
#           and implemented it.  This method is much
#           faster and shorter, but certainly more arcane.
# ----------------------------------------------------

# params: {str: "..."}
def reverseString(params):
    str = params['str']
#    return ("".join(reversed(str)))
    return str[::-1]

