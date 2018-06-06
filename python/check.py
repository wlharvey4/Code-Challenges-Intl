#! /usr/bin/env python3

# python/check.py
# ====================================================
# CREATED: 2018-05-29
# UPDATED: 2018-06-05
# VERSION: 0.2.0
# AUTHOR: wlharvey4
# ABOUT: Python code challenge runner
# NOTES:
# ----------------------------------------------------

import sys
from importlib import import_module
from pathlib import PurePath, Path

PYTHON = 'python'
JSON = '.json'

# get code challenge name from command-line argument
if len(sys.argv) != 2:
    print("You need to include a code challenge name: `USAGE ./check <code-challenge'")
    sys.exit(-1)

cc = sys.argv[1]

# construct paths
root = PurePath(Path.cwd()).parent
ccDir = PurePath.joinpath(root, cc)
ccJson = PurePath.joinpath(ccDir, cc).with_suffix(JSON)

# import code challenge as function 'fn'
sys.path.append(str(root))
ccPackage = cc + '.' + PYTHON + '.' + cc
fnMod = import_module(ccPackage)
fn = getattr(fnMod, cc)

print(fn({'n': 15}))
