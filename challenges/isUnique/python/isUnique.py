# isUnique/python/isUnique.py
# ====================================================
# CREATED: 2018-06-06
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: isUnique implementation in python3
# NOTES:
#   The principal BUILT-IN TYPES are numerics, sequences, mappings,
#   classes, instances and exceptions.
#   There are three basic SEQUENCE TYPES: lists, tuples, and range
#   objects.
#   LISTS are mutable sequences, typically used to store collections
#   of homogeneous items
#      Lists may be constructed in several ways: ...
#         Using the TYPE CONSTRUCTOR: list() or list(iterable)
#      sort(): This method sorts the list in place, using only <
#              comparisons between items.
#   STRINGS are immutable sequences of Unicode code points.
# ----------------------------------------------------

# inStr := {'str': <string>}
def isUnique(inStr):
    str = inStr['str']
    # turn the immutable string into a mutable list, then into a unique set
    strSet = set(sorted(list(str)))
    return len(str) == len(strSet)
