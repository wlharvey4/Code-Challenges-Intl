# languages/c/Makefile
# ====================================================
# CREATED: 2018-06-19
# UPDATED: 2018-06-19
# VERSION: 1.1.0
# AUTHOR: wlharvey4
# ABOUT: Compiles the code challenge given on the command
#	 line,  and   if  necessary   the  `check.c/h`
#	 module, as  `_check`, then runs  the `_check`
#	 program  against the  code challenge  through
#	 dynamic linking and loading;
#	 also contains an `init' rule that creates a new
#	 directory and places the `util.h' template file
#	 inside; `init' is invoke with the name of the new
#	 code challenge.
# NOTES: `check <code-challenge>`' is invoked as a shell
#	 which   runs  a   Makefile  based   upon  the
#	 code-challenge passed by  the shell script as
#	 CC, e.g.: ./check fizzbuzz produces
#	 `make CC=fizzbuzz --silent'; the Makefile
#	 cleans the dylib by default; `check` can be
#	 cleaned with `make clean-all`.
# ----------------------------------------------------

CC = 
DATE := $(shell date +"%Y-%m-%d")
UTIL := util
CHECK := check

CC_CH := ${CC}.[ch]
UTIL_CH := ${UTIL}.[ch]
CHECK_CH := ${CHECK}.[ch]


ROOT := $(realpath ../..)
CC_DIR := ${ROOT}/challenges/${CC}/c
LANG_DIR := ${ROOT}/languages/c
VPATH := ${CC_DIR} ${LANG_DIR}

.Phony:		all
all:		dylib mkcheck run clean

.Phony:		dylib
dylib:		lib${CC}.dylib

lib${CC}.dylib:	${CC_DIR}/${CC_CH} ${CC_DIR}/${UTIL_CH}
		clang -g -Wall -o ${CC_DIR}/lib${CC}.dylib -shared -fpic ${CC_DIR}/${CC}.c ${CC_DIR}/${UTIL}.c -ljansson

.Phony:		mkcheck
mkcheck:	_${CHECK}

_${CHECK}:	${CHECK_CH} dylib
		clang -g -Wall -o _${CHECK} ${CHECK}.c -I ${CC_DIR} -L ${CC_DIR} -l${CC} -ljansson

.Phony:		run
run:
		./_${CHECK} ${CC}

.Phony:		clean
clean:
		rm -fr ${CC_DIR}/lib${CC}.dylib*;

.Phony:		clean-all
clean-all:	clean
		rm -fr ${LANG_DIR}/_${CHECK} ${LANG_DIR}/_${CHECK}.dSYM

.Phony:		init
init:
		mkdir -p ${CC_DIR}/ && \
		cp ${LANG_DIR}/util.h.template ${CC_DIR}/util.h && \
		sed -i '' -e 's/\<code-challenge\>/${CC}/g' -e 's/\<date\>/${DATE}/' ${CC_DIR}/util.h
