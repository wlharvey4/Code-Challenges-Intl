# languages/c/check.sh
# ====================================================
# CREATED: 2018-06-19
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: shell script to get code challenge from the
#        command line, update the Makefile with the
#        requested code challenge, compile the code
#        challenge dynamically, and invoke check.c
# NOTES:
# ----------------------------------------------------

[ -z $1 ] && { echo USAGE './check <code-challenge>'; exit; }
[ -d ../../challenges/$1 ] || { echo Code Challenge \`$1\' does not exist; exit; }
make CC=$1 --silent
