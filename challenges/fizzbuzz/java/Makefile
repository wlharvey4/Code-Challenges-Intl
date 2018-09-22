# challenges/fizzbuzz/java/Makefile
# ***************************************************************************
# CREATED: 2018-09-22
# UPDATED: 2018-09-22
# VERSION: 0.1.1
# AUTHOR:  wlharvey4
# ABOUT:   Makefile for compiling Fizzbuzz.java, plus utility files
# NOTES:
# USAGE:   make
# CHANGE-LOG:
# ...........................................................................
# 2018-09-22T10:35 VERSION 0.0.1
# - initial commit
# ...........................................................................
# 2018-09-22T10:48 VERSION 0.1.1
# - added CC and JAVAFILE; added additional .PHONY JAVAFILE; reformatted
# ---------------------------------------------------------------------------

CC	  := fizzbuzz
JAVAFILE  := Fizzbuzz

GSONPATH  := /usr/local/gson-2.8.5/gson.jar
CCIPATH   := /usr/local/dev/programming/Code-Challenges-Intl
CLASSPATH := ${GSONPATH}:${CCIPATH}

.PHONY      : default ${CC} ${JAVAFILE} clean
default     : ${CC}
${CC}       : ${JAVAFILE}
${JAVAFILE} : ${JAVAFILE}.class
${JAVAFILE}.class : ${JAVAFILE}.java
	javac -classpath ${CLASSPATH} ${JAVAFILE}.java

clean:
	rm -f *.class *~

