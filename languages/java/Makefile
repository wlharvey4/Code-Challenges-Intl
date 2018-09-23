# languages/java/Makefile
# ***************************************************************************
# CREATED: 2018-09-22
# UPDATED: 2018-09-22
# VERSION: 0.1.1
# AUTHOR:  wlharvey4
# ABOUT:   Makefile for compiling Check.java
# NOTES:
# USAGE:   make
# CHANGE-LOG:
# ...........................................................................
# 2018-09-22T10:00 VERSION 0.0.1
# - initial commit
# ...........................................................................
# 2018-09-22T10:06 VERSION 0.1.0
# - split CLASSPATH into two; one for GSON, and one for CCI; reformatted
# ...........................................................................
# 2018-09-22T19:24 VERSION 0.1.1
# - compile CCI_*.java (i.e., CCI_CC, CCI_Input, CCI_Result)
# ---------------------------------------------------------------------------

CC	  := check
JAVAFILE  := Check
CCI_CC	  := CCI_*

GSONPATH  := /usr/local/gson-2.8.5/gson.jar
CCIPATH   := /usr/local/dev/programming/Code-Challenges-Intl
CLASSPATH := ${GSONPATH}:${CCIPATH}

.PHONY      : default, ${CC} ${JAVAFILE} clean
default     : ${CC}
${CC}	    : ${JAVAFILE}
${JAVAFILE} : ${JAVAFILE}.class
${JAVAFILE}.class : ${JAVAFILE}.java
	javac -classpath ${CLASSPATH} ${JAVAFILE}.java ${CCI_CC}.java

clean:
	rm -f *.class *~

