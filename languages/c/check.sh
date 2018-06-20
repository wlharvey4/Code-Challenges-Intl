# languages/c/check.sh
# ====================================================
# CREATED: 2018-06-19
# UPDATED: 2018-06-20
# VERSION: 1.1.0
# AUTHOR: wlharvey4
# ABOUT: shell script to get code challenge from the
#        command line, update the Makefile with the
#        requested code challenge, compile the code
#        challenge dynamically, and invoke check.c;
#	 can be invoked with `init' to start a new
#	 code challenge in C with a template `util.h'
# NOTES:
# ----------------------------------------------------

USAGE='USAGE: ./check <code-challenge> [init]'

[ -z $1 ] && { echo ${USAGE}; exit; }

[ $2 ] && {
    [ $2 == 'init' ] && {
	make CC=$1 init
	exit
    } || {
	echo ${USAGE}
	exit
    }
}

[ -d ../../challenges/$1 ] && {
    make CC=$1 --silent
    exit;
} || {
    echo $1 does not exist
    echo ${USAGE}
    exit
}
