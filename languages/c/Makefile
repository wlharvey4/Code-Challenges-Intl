# languages/c/Makefile
# ====================================================
# CREATED: 2018-06-19
# VERSION: 1.0.0
# AUTHOR: wlharvey4
# ABOUT: Compiles the code challenge into the check program
#        and allows for dynamic linking and loading based
#        upon command line invocation; the default rule
#        `default' compiles both the code challenge and
#        check.c, and then runs `check' with the given
#        code challenge from the command line 
# NOTES: CC obtains its value from the command line via
#        cc.sh, e.g.:  ./cc fizzbuzz
# ----------------------------------------------------

CC = 
UTIL = util
CHECK = check

CC_CH = ${CC}.[ch]
UTIL_CH = ${UTIL}.[ch]
CHECK_CH = ${CHECK}.[ch]

ROOT = /usr/local/dev/programming/Code-Challenges-Intl
CC_DIR = ${ROOT}/challenges/${CC}/c
LANG_DIR = ${ROOT}/languages/c

.Phony:		default
default:	dylib mkcheck run clean

.Phony:		dylib
dylib:		${CC_DIR}/lib${CC}.dylib

${CC_DIR}/lib${CC}.dylib:	${CC_DIR}/${CC_CH} ${CC_DIR}/${UTIL_CH}
	clang -g -Wall -o ${CC_DIR}/lib${CC}.dylib -shared -fpic ${CC_DIR}/${CC}.c ${CC_DIR}/${UTIL}.c -ljansson

.Phony:		mkcheck
mkcheck:	${LANG_DIR}/_${CHECK}

${LANG_DIR}/_${CHECK}:	${CHECK_CH} dylib
	clang -g -Wall -o _${CHECK} ${CHECK}.c -I ${CC_DIR} -L ${CC_DIR} -l${CC} -ljansson

.Phony:		run
run:
	${LANG_DIR}/_${CHECK} ${CC}

.Phony:		clean
clean:
		rm -r ${CC_DIR}/lib${CC}.dylib*; rm -r ${LANG_DIR}/_${CHECK} ${LANG_DIR}/_${CHECK}.dSYM
