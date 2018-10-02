# languages/java/Makefile
# #########################################################################
# CREATED: 2018-09-26
# UPDATED: 2018-10-02T12:05
# VERSION: 1.0.1
# AUTHOR:  wlharvey4
# ABOUT:   makefile for Code-Challenges-Intl/languages/java program
# USAGE:   make TARGET | make run CC=<CODE-CHALLENGE>
# NOTES:   This version of make relies upon Bash ver. 4, and also upon
#	   Bash being in /opt/local/bin; the location of Bash should
#	   obviously be set by the user in a SHELL variable, but the version
#	   relies upon a Bash ver.4 function, ${var^} to up-case the Code
#	   Challenge name; I should prepare a function to handle this should
#	   ver. 4 not be available.
# CHANGE-LOG
# .........................................................................
# 2018-09-26 version 0.1.0
# - initial commit
# .........................................................................
# 2018-09-27 version 0.1.1
# - adjusted packages;
# - added code information
# .........................................................................
# 2018-09-28 version 0.2.0
# - refactored code to different packages and file names
# .........................................................................
# 2018-09-28 version 0.2.1
# - adjusted names of files to correspond with refactoring
# .........................................................................
# 2018-09-28T19:00 version 0.3.0
# - redid whole Makefile to be more explicit
# .........................................................................
# 2018-09-29T07:26 version 0.3.1
# - added FB
# .........................................................................
# 2018-09-29T08:56 version 0.3.2
# - added Expected
# .........................................................................
# 2018-09-29T18:30 version 0.3.3
# - added variable CC and target run $(CC)
# .........................................................................
# 2018-10-01T15:05 version 0.3.4
# - made main compilation and run targets silent
# .........................................................................
# 2018-10-01T18:30 version 1.0.0
# - moved code into Code-Challenges-Intl/languages/java and adjusted it
#   to work; code runs successfully;
# .........................................................................
# 2018-10-02T12:05 version 1.0.1
# - refactored to use variables $cc and $CC for lower case Code Challenge
#   and upper case Code Challenge instead of hard-coded Code Challenge name;
#   use a Bash ver.4 function ${var^} to up-case Code Challenge name;
# -------------------------------------------------------------------------

SHELL = /opt/local/bin/bash

MAIN := Main
cc ?= fizzbuzz
CC = $(shell cc=$(cc); echo $${cc^};)

CLASSPATH   := .:../../:gson-2.8.5.jar
PACKAGECC   := ../../challenges/$(cc)/java
PACKAGEMAIN := ../../languages/java

.PHONY : default main Main IParams IExpected IResult ICC Params Result $(cc) $(CC) FB clean run

default : Main ParamsExpected IParams IExpected IResult ICC Params Result Expected $(cc) $(CC)

main : Check
Main : $(PACKAGEMAIN)/Check.class

$(PACKAGEMAIN)/Check.class : $(PACKAGEMAIN)/Check.java
	@javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/Check.java

ParamsExpected : $(PACKAGEMAIN)/ParamsExpected.class

$(PACKAGEMAIN)/ParamsExpected.class : $(PACKAGEMAIN)/ParamsExpected.java
	javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/ParamsExpected.java

IParams : $(PACKAGEMAIN)/IParams.class

$(PACKAGEMAIN)/IParams.class : $(PACKAGEMAIN)/IParams.java
	javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/IParams.java

IExpected : $(PACKAGEMAIN)/IExpected.class

$(PACKAGEMAIN)/IExpected.class : $(PACKAGEMAIN)/IExpected.java
	javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/IExpected.java

IResult : $(PACKAGEMAIN)/IResult.class

$(PACKAGEMAIN)/IResult.class : $(PACKAGEMAIN)/IResult.java
	javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/IResult.java

ICC : $(PACKAGEMAIN)/ICC.class

$(PACKAGEMAIN)/ICC.class : $(PACKAGEMAIN)/ICC.java
	javac -classpath $(CLASSPATH) $(PACKAGEMAIN)/ICC.java

Params : $(PACKAGECC)/Params.class

$(PACKAGECC)/Params.class : $(PACKAGECC)/Params.java
	javac -classpath $(CLASSPATH) $(PACKAGECC)/Params.java

Result : $(PACKAGECC)/Result.class

$(PACKAGECC)/Result.class : $(PACKAGECC)/Result.java
	javac -classpath $(CLASSPATH) $(PACKAGECC)/Result.java

Expected : $(PACKAGECC)/Expected.class

$(PACKAGECC)/Expected.class : $(PACKAGECC)/Expected.java
	javac -classpath $(CLASSPATH) $(PACKAGECC)/Expected.java

$(cc): $(CC)
$(CC) : $(PACKAGECC)/$(CC).class

$(PACKAGECC)/$(CC).class : $(PACKAGECC)/$(CC).java $(PACKAGECC)/Params.class $(PACKAGECC)/Result.class
	javac -classpath $(CLASSPATH) $(PACKAGECC)/$(CC).java

FB : $(PACKAGECC)/FB.class

$(PACKAGECC)/FB.class : $(PACKAGECC)/FB.java
	javac -classpath $(CLASSPATH) $(PACKAGECC)/FB.java

clean :
	rm -rfv *~ $(PACKAGEMAIN)/*{.class,~} $(PACKAGECC)/*{.class,~}

run : default
	@java -classpath $(CLASSPATH) languages/java/Check $(cc)
