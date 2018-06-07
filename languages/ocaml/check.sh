#! /usr/bin/env bash

# ocaml/check.sh
# ====================================================
# CREATED: 2018-05-28
# VERSION: 0.1.0
# AUTHOR: wlharvey4
# ABOUT: Shell script to compile Check module, then
#        move check.native into ocaml, then run appropriate test
# NOTES:
# ----------------------------------------------------

[ -e check.native ] && rm check.native

cd ..&& \
    corebuild -r check.native -I ocaml -I fizzbuzz/ocaml -I isUnique/ocaml -package yojson && \
    mv check.native ocaml && \
    cd ocaml && \
    ./check.native $1

