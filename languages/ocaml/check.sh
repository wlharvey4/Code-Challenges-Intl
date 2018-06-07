#! /usr/bin/env bash

# ocaml/check.sh
# ====================================================
# CREATED: 2018-05-28
# UPDATED: 2018-06-06
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: Shell script to compile Check module, then
#        move check.native into ocaml, then run appropriate test
# NOTES: This shell script will need to be updated for each new
#        code challenge added; will make the script self-modifying
# ----------------------------------------------------

[ -e check.native ] && rm check.native

# starting from Code-Challenges-Intl/languages/ocaml
# move into the root directory Code-Challenges-Intl
cd ../../ && \
    corebuild -r check.native \
	      -I languages/ocaml \
	      -I challenges/fizzbuzz/ocaml \
	      -I challenges/isUnique/ocaml \
	      -package yojson && \
    mv check.native languages/ocaml && \
    cd languages/ocaml && \
    ./check.native $1
