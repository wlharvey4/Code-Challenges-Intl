/**
   languages/java/Check.java
   ====================================================
   CREATED: 2018-07-06
   UPDATED: 2018-09-19
   VERSION: v0.0.3
   AUTHOR:  wlharvey4
   ABOUT:   Main check file for Java code challenge
   	    implementations
   NOTES:   Using Goole's gson: A Java serialization/deserialization
	    library to convert Java Objects into JSON and back
	    https://www.javadoc.io/doc/com.google.code.gson/gson/2.8.5
	    https://github.com/google/gson
	    https://github.com/google/gson/blob/master/UserGuide.md
	    https://mvnrepository.com/artifact/com.google.code.gson/gson
   CLASSPATH='.:/usr/local/gson-2.8.5/gson.jar:/usr/local/dev/programming/Code-Challenges-Intl'
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
   ----------------------------------------------------
 */

import java.io.File;
import com.google.gson.*;

class Check {

    public static void main(String[] args) throws Exception {

	String CHALLENGES = "challenges";

	String cc;		// name of code challenge input by user
	File rootDir;		// root of module `Code-Challenges-Intl';
	File challDir;		// Code-Challenges-Intl/challenges directory
	File ccDir;		// Code-Challenges-Intl/challenges/<cc> (where JSON file is)
	File ccJSON;		// code challenge JSON file

	if (args.length != 1) {
	    System.err.println("Usage: check <code-challenge>");
	    System.exit(-1);
	}

	cc = args[0];
	rootDir  = new File("../../");
	challDir = new File(rootDir.getCanonicalPath(), CHALLENGES);
	ccDir    = new File(challDir, cc);
	ccJSON   = new File(ccDir, cc + ".json");
	System.out.println("Check: testing code challenge `" + cc + "' from " + ccDir);
	System.out.println("JSON file: " + ccJSON);

    }
}
