#! /usr/bin/env python3

# python/check.py
# ====================================================
# CREATED: 2018-05-29
# UPDATED: 2018-06-05
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: Python code challenge test runner
# NOTES:
# ----------------------------------------------------

import sys, json
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

# import json
with open(ccJson, "r") as ccJsonFile:
    jsonData = json.load(ccJsonFile)
    
# import code challenge as function 'fn'
sys.path.append(str(root))
ccPackage = cc + '.' + PYTHON + '.' + cc
ccMod = import_module(ccPackage)
fn = getattr(ccMod, cc)

# test iterator
results = {'passed': 0, 'failed': 0}
for item in jsonData:
    p = item['params']
    e = item['expected']
    r = fn(p)
    if e != r:
        print("PARAM:\t\t{[params]}".format(item))
        print("EXPECTED:\t{[expected]}".format(item))
        print("RESULT:\t\t{}\n".format(r))
        results['failed'] += 1
    else:
        results['passed'] += 1

print("\nRESULTS:\t{} {}".format(PYTHON, cc))
print("\tPASSED:\t{[passed]:2d}".format(results))
print("\tFAILED:\t{[failed]:2d}".format(results))
