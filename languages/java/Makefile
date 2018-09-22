# languages/java/Makefile
# ***************************************************************************
# CREATED: 2018-09-22
# UPDATED: 2018-09-22
# VERSION: 0.0.1
# AUTHOR:  wlharvey4
# ABOUT:   Makefile for compiling Check.java
# NOTES:
# USAGE:   make
# CHANGE-LOG:
# ...........................................................................
# 2018-09-22T10:00 VERSION 0.0.0
# - initial commit
# ---------------------------------------------------------------------------

JAVAFILE := Check.java
CLASSPATH := /usr/local/gson-2.8.5/gson.jar:/usr/local/dev/programming/Code-Challenges-Intl/

.PHONY : default, check
default : check
check : Check.class
Check.class : Check.java
	javac -classpath ${CLASSPATH} ${JAVAFILE}

