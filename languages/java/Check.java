/**
   languages/java/Check.java
   ====================================================
   CREATED: 2018-07-06
   UPDATED: 2018-09-24
   VERSION: v0.0.12
   AUTHOR:  wlharvey4
   ABOUT:   Main check file for Java code challenge
   	    implementations
   CLASSPATH='.:/usr/local/gson-2.8.5/gson.jar:/usr/local/<...path-to>/Code-Challenges-Intl'
   USAGE:   java -classpath /usr/local/<...path-to>/Code-Challenges-Intl languages.java.Check <cc>
   NOTES:   Using Goole's gson: A Java serialization/deserialization
	    library to convert Java Objects into JSON and back
	    https://www.javadoc.io/doc/com.google.code.gson/gson/2.8.5
	    https://github.com/google/gson
	    https://github.com/google/gson/blob/master/UserGuide.md
	    https://mvnrepository.com/artifact/com.google.code.gson/gson
   CHANGE-LOG:
   ....................................................
   v0.0.1 2018-07-06T16:00:00
   - initial commit
   ...............3.....................................
   v0.0.2 2018-09-19T17:55
   - changed file name to Check.java from check.java
   ....................................................
   v0.0.3 2018-09-20T17:38
   - refactored variables to find the correct directories
     and files
   ....................................................
   v0.0.4 2018-09-20T22:20
   - Added try-with-resources BufferedReader to read the
     JSON data file; need to use reflection to obtain 
     dynamic access to the JSON file depending on which
     code challenge is selected on the command line;
   ....................................................
   v0.0.5 2018-09-22T09:45
   - Made Check class public; updated CLASSPATH; added USAGE
   ....................................................
   v0.0.6 2018-09-22T11:30
   - refactored to use ccJSONDir instead of ccDir
   ....................................................
   v0.0.7 2018-09-22T12:07
   - successfully loaded class Input using Class.forName(String)
   ....................................................
   v0.0.8 2018-09-22T19:45
   - successfully loaded class CCI_CC using name ccPackage.<cc>
   ....................................................
   v0.0.9 2018-09-23T23:00
   - successfully compiled and loaded Gson; unsuccessfully
     filled json data;
   ....................................................
   v0.0.10 2018-09-23T23:40
   - successfully compiled, loaded json data, and ran without error
   ....................................................
   v0.0.11 2018-09-24T11:50
   - created CCI_InputExpected.java data structure that will load
     JSON data and print it out;
   ....................................................
   v0.0.12 2018-09-24T12:15
   - after creating CCI_InputExpected interface and implementing
     it in InputExpected, successfully loaded all JSON data
     into an array of InputExpected's, but used hard-coded
     Type instead of calculated type
   ----------------------------------------------------
 */

package languages.java;

import java.io.*;
import java.lang.reflect.*;
import com.google.gson.*;

public class Check {

    public static void main(String[] args) throws Exception {

	String CHALLENGES = "challenges";
	String JAVA = "java";
	String JSON = "json";

	String cc;		// name of code challenge input by user
	String ccName;	        // capitalized code challenge name
	String ccPackage;	// name of code challenge package

	File rootDir;		// root of module `Code-Challenges-Intl';
	File challDir;		// Code-Challenges-Intl/challenges directory
	File ccJSONDir;		// Code-Challenges-Intl/challenges/<cc> (where JSON file is)
	File ccJSON;		// code challenge JSON file
	File ccDir;		// Code-Challenges-Intl/challenges/<cc>/<cc>/java/

	if (args.length != 1) {
	    System.err.println("Usage: check <code-challenge>");
	    System.exit(-1);
	}

	cc = args[0];
	ccName = cc.substring(0,1).toUpperCase() + cc.substring(1);
	ccPackage = CHALLENGES + "." + cc + "." + JAVA + ".";

	rootDir   = new File("../../");
	challDir  = new File(rootDir.getCanonicalPath(), CHALLENGES);
	ccJSONDir = new File(challDir, cc);
	ccDir     = new File(ccJSONDir, JAVA);
	ccJSON    = new File(ccJSONDir, cc + "." + JSON);

	Gson gson = new Gson();

	System.out.println("Check: testing code challenge `" + ccPackage + ccName);
	System.out.println("JSON is: " + ccJSON);
	System.out.println("ccDir: " + ccDir);
	System.out.println();

	try (BufferedReader brJSON = new BufferedReader (new FileReader(ccJSON)) ) {
	    System.out.println("Successfully opened " + ccJSON);

	    CCI_InputExpected[] inputExpected = gson.fromJson(brJSON, challenges.fizzbuzz.java.InputExpected[].class);

	    Class<?> CC = Class.forName(ccPackage + ccName);
	    Class<?> Input = Class.forName(ccPackage + "Input");
	    Constructor ccConst = CC.getConstructor(Input);
	    System.out.println("CC constructor is: " + ccConst);
	    System.out.println("The class name of Input is " + Input.getName());

	    for (CCI_InputExpected ie : inputExpected) {
		System.out.println(ie);
	    }
	}

	catch (IOException ioe) {
	    System.err.println("Error Opening JSON file: " + ccJSON + " With " + ioe);
	}

	catch (Exception e) {
	    System.err.println("Error: " + e);
	}
    }
}
