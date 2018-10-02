/* languages.java/Check.java
   =========================================================================
   CREATED: 2018-09-26T12:30
   UDPATED: 2018-10-01T18:30
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Example setup for reading in JSON objects of "params" objects of
   	    arbitrary construction and initializing an A object (i.e., InputExpected)
   	    using JSON elements instead of Strings
   USAGE:   ? java languages.java/Check <cc>; or alternatively
            ? make run CC=<cc>
	    ? ./check <cc>
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   COMPILATION: javac -classpath $CLASSPATH languages.java/Check.java

   NOTES:   Check must be run from the languages/java directory (Code-Challenges-Intl/languages/java/)
   	    Check can be run using the Makefile as `make run CC=<code-challenge>'
	    Check can be run as ./check <cc>

   COMPONENTS:
     PACKAGE languages.java:
     ------------------
     languages.java.Check.java      --- main method (test runnr)
     languages.java.ICC.java       --- code challenge interface; 3 required methods:
     				  IResult calculate(); (setter)
				  IParams params();    (getter)
				  IResult result();    (getter)
     languages.java.ParamsExpected --- code to store JSON data params and expected
     languages.java.IParams.java   --- interface utility to parse and store params
     languages.java.IResult.java   --- interface utility to parse and store result
     languages.java.IExpected.java --- interface utility to parse and store expected;
     				  concrete implementation is a subclass of Result;

     PACKAGE challenges.<cc>.java:
     -----------------------------
     challenges.<cc>.java.<CC>.java     --- Code Challenge class implements ICC
     challenges.<cc>.java.Params.java   --- utiltiy class implements IParams
     challenges.<cc>.java.Result.java   --- utiltiy class implements IResult
     challenges.<cc>.java.Expected.java --- utility class extends Result, 
					    implemnets IExpected

   CHANGE-LOG:
   .........................................................................
   2018-09-26T12:30 version 0.1.0
   - first working version;
   .........................................................................
   2018-09-26T18:00 version 0.1.1
   - moved files into packages;
   .........................................................................
   2018-09-26T19:30 version 0.1.2
   - updated packages and importing;
   - created Makefile;
   - program compiles successfully with Makefile; cleans successfully;
   .........................................................................
   2018-09-27T05:51 version 0.1.3
   - adjusted packages again;
   - adjusted code comments;
   .........................................................................
   2018-09-27T06:36 version 0.1.4
   - removed unnecessary import of packages in own package directory;
   .........................................................................
   2018-09-27T07:00 version 0.1.5
   - added import of File, IOException;
   - added ROOT directory and static initialization;
   - added cc and ccName;
   - added private no-arg constructor;
   .........................................................................
   2018-09-27T08:40 version 0.1.6
   - added File computations and exceptions
   .........................................................................
   2018-09-27T13:40 version 0.1.7
   - added FileReader;
   - added package variables;
   - changed name of class method to ccInit from ccJSON;
   - added try-with-resource opening of json data file;
   - added Gson, JsonParser, JsonElement, JsonArray
   - added catch-blocks of all exceptions
   - commented out former code in preparation for new code iterating over data
   .........................................................................
   2018-09-28T13:15 version 0.2.0
   - implemented full JSON iterator and successfully iterated through fizzbuzz.json
     printing each params and expected values;
   .........................................................................
   2018-09-28T16:30 version 0.2.1
   - changed package languages.java.InputExpected to languages.java.ParamsExpected
   .........................................................................
   2018-09-29T14:25 version 0.2.2
   - refactored names of params and expected into paramsJson and expectedJson;
   - refactored calls to Params and Expected out of the call to ParamsExpected
     because these will have to be reflected calls in the future;
   - created new object Fizzbuzz cc by calling Fizzbuzz's constructor with
     ParamExpected's method to getParams(); also called cc's method result(),
     but it only returns a null value at this point; nevertheless everything
     still compiles and runs successfully;
   .........................................................................
   2018-09-29T17:40 verion 0.2.3
   - reformatted print statement for Result;
   .........................................................................
   2018-09-30T14:24 version 0.2.4
   - added call to equals() and printed result; code is functioning
   .........................................................................
   2018-09-30T14:45 version 0.2.5
   - refactored try-with-resources block, Gson calls;
   - added comments to calls to Params and Expected constructors;
   - refactored Fizzbuzz type to ICC type; marked three areas that will need
     reflection for code to work dynamically
   .........................................................................
   2018-10-01T07:30 version 0.2.6
   - Factored out Params() and Expected() into ParamsExpected();
   .........................................................................
   2018-10-01T07:45 version 0.2.7
   - Factored out parsing of objJson into ParamsExpected; called ParamsExpected()
     with a single line of JSON data containing both `params' and `expected'
     objects;
   .........................................................................
   2018-10-01T08:45 version 0.2.8
   - Combined creation of array and array iterator, since no need for array
   .........................................................................
   2018-10-01T09:15 version 0.2.9
   - cleaned up code and comments
   .........................................................................
   2018-10-01T10:10 version 0.3.0
   - successfully used reflection to instantiate code challenge and run tests;
   - cleaned up and refactored code substantially;
   .........................................................................
   2018-10-01T12:10 version 0.3.1
   - refactored packageCC to be protected so ParamsExpected can access it;
   - made some small code changes;
   .........................................................................
   2018-10-01T13:00 version 0.3.2
   - create ccPackageName in ccInit() code;
   - moved creation of Params and Expected package names into Check's
     ccInit(), using protected keyword for proper access privilege;
   .........................................................................
   2018-10-01T13:50 version 0.3.3
   - refactored error catching for JSON file
   - refactored name of constructor for clarity;
   - removed unnecessary local variable for package languages.java;
   .........................................................................
   2018-10-01T15:00 version 0.3.4
   - changed ccName to protected so ParamsExpected can access it;
   - changed test runner to send result to ParamsExpected class for counting,
     tallying, and error reporting;
   - added report at end of test runner;
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved working version into Code-Challenges-Intl/languages/java and
     adjusted code to work; code compiles and runs successfully;
   -------------------------------------------------------------------------
*/

package languages.java;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import com.google.gson.*;

public class Check {

    private Check() {}				 // this class should not be instantiated

    private   static File   ROOT;		 // the ROOT of the module: CCI-GsonExample/
    static {
	try { ROOT = new File("../../").getCanonicalFile();  }
	catch (IOException ioe) { ioe.printStackTrace(); }
    }

    // these names are used by Reflection code
    private   static String cc;			 // code challenge from command-line
    protected static String ccName;		 // upper-cased code challenge name
    private   static String ccPackage;		 // package designation based upon cc from command-line
    private   static String ccPackageName;	 // fully qualified Code Challenge package name
    protected static String paramsPackageName;	 // fully qualified Params package name
    protected static String expectedPackageName; // fully qualified Expected package name
    private   static File   ccJSON;		 // code challenge JSON data file

    /* Static method to initialize class variables using Code Challenge from command line */
    private static void ccInit(String cc) {
	Check.cc                  = cc;
	Check.ccName              = cc.substring(0,1).toUpperCase() + cc.substring(1);
	Check.ccPackage           = "challenges." + cc + ".java.";
	Check.ccPackageName       = Check.ccPackage + Check.ccName;
	Check.paramsPackageName   = Check.ccPackage + "Params";
	Check.expectedPackageName = Check.ccPackage + "Expected";

	try {
	    Check.ccJSON    = new File(new File(new File(Check.ROOT, "challenges"), Check.cc), Check.cc + ".json");

	    if (!(Check.ccJSON.canRead() || Check.ccJSON.exists())) {
		throw new IOException("ERROR: FILE NOT FOUND OR NOT READABLE: " + Check.ccJSON );
	    }
	}
	catch (NullPointerException | IOException ioe) {
	    ioe.printStackTrace();
	    System.exit(-1);
	}
    }

    public static void main(String[] args) {
	ICC            icc;		// Code Challenge Interface; contains two required methods:
					// (1) IParams params() and (2) IResult result()
					// and a constructor with a required parameter IParams
	Class<?>       ccClass;		// reflected Class of Code Challenge
	Constructor    ccConstr;	// reflected Constructor of Code Challenge
	ParamsExpected paramsExpected;	// holds parsed JSON data for Code Challenge to use

	JsonParser     parser;		// parses the JSON data object found in <cc>.json
	Iterator<JsonElement> iterJson; // Iterator of an Array of JSON objects (peJson)
	
	/* make sure there is a Code Challenge name given on the command line;
	   if so, initialize Code Challenge variables; */
	try { Check.ccInit(args[0]); } // args[0] is the code challenge name, i.e. `fizzbuzz'
	catch (NullPointerException | ArrayIndexOutOfBoundsException mce) {
	    System.err.println("USAGE: $java languages.java/Check <code-challenge>");
	    mce.printStackTrace();
	    System.exit(0);
	}

	System.out.println("\nCODE CHALLENGE: Java " + ccName + "\n");

	try { // wrap the Reflection calls
	    ccClass = Class.forName(Check.ccPackageName);
	    ccConstr = ccClass.getConstructor(IParams.class);

	    try (FileReader ccJsonData = new FileReader(Check.ccJSON)) { // wrap the I/O calls
		parser   = new JsonParser();
		/* obtain an Iterator over an Array of JSON data objects */
		iterJson = parser.parse(ccJsonData).getAsJsonArray().iterator();

		// iterate over the JSON Array of params and expected values
		while (iterJson.hasNext()) {
		    paramsExpected = new ParamsExpected(iterJson.next().getAsJsonObject());

		    /* use the Reflection Constructor to instantiate a call to the
		       code challenge with a new set of parameters; this is the HEART
		       of the solution. */
		    icc = (ICC) ccConstr.newInstance(paramsExpected.getParams());

		    paramsExpected.reportResult(icc.result());
		}

		System.out.println("RESULTS:\n========");
		System.out.println("Tests:\t"  + ParamsExpected.ccCount());
		System.out.println("OK:\t"     + ParamsExpected.tally());
		System.out.println("Failed:\t" + (ParamsExpected.ccCount() - ParamsExpected.tally()));
	    }
	    catch (JsonIOException jioe) {
		jioe.printStackTrace();
		System.exit(-1);
	    }
	    catch (JsonSyntaxException jse) {
		jse.printStackTrace();
		System.exit(-1);
	    }
	    catch (JsonParseException jpe) {
		jpe.printStackTrace();
		System.exit(-1);
	    }
	    catch (IOException ioe) {
		ioe.printStackTrace();
		System.exit(-1);
	    }
	}
	catch (ClassNotFoundException | NoSuchMethodException e) {
	    e.printStackTrace();
	    System.exit(-1);
	}
	catch (
	       InstantiationException   |
	       IllegalAccessException   |
	       IllegalArgumentException |
	       InvocationTargetException constr_exc
	       ) {
	    constr_exc.printStackTrace();
	    System.exit(-1);
	}
    }

    private class Args {
	String params;
	String expected;
    }
}
