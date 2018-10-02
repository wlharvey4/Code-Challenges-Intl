/* languages.java/ParamsExpected.java
   =========================================================================
   CREATED: 2018-09-26
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Receives and stores Params and Expected from JSON file
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-26 version 0.1.0
   - initial commit
   .........................................................................
   2018-09-26 version 0.1.1
   - adjusted packages
   .........................................................................
   2018-09-27T05:30 version 0.1.2
   - adjust packages again;
   - added code information;
   .........................................................................
   2018-09-28T13:30 version 0.2.0
   - created challenges.fizzbuzz.java.InputExpected
   .........................................................................
   2018-09-28T13:47 version 0.2.1
   - refactored IA to IE
   .........................................................................
   2018-09-28T16:00 version 0.3.0
   - refactored to package languages.java
   .........................................................................
   2018-09-28T16:23 version 0.3.1
   - refactored to package languages.java.ParamsExpected
   .........................................................................
   2018-09-28T16:32 version 0.3.2
   - refactored toString()
   .........................................................................
   2018-09-28T17:06 version 0.3.3
   - refactored IE to IParamsExpected
   - no longer implements any interface
   .........................................................................
   2018-09-29T17:43 version 0.3.4
   - reformated toString();
   .........................................................................
   2018-10-01T07:30 version 0.3.5
   - factored in Params() and Expected() from Check class
   .........................................................................
   2018-10-01T07:45 version 0.3.6
   - factored in the calling of ParamsExpected with a single JSON object
     containing both `params' and `expected' objects, and parsing the JSON
     here instead of in Check;
   .........................................................................
   2018-10-01T08:24 version 0.3.7
   - factored out checks for null into Params and Result classes;
   .........................................................................
   2018-10-01T12:10 version 0.4.0
   - factored in Reflection; factored out references to challenges.fizzbuzz;
     code runs successfully using Reflection;
   .........................................................................
   2018-10-01T13:00 version 0.4.1
   - factored out unnecessary local variables; 
   - moved construction of package names into Check's ccInit() method;
   .........................................................................
   2018-10-01T14:10 version 0.4.2
   - added instance variable IResult result to store result for this Code
     Challenge test;
   - added class variables count and tally to keep a count of code challenge
     tests run and a tally of the count of correct Code Challenge tests;
   .........................................................................
   2018-10-01T15:00 version 0.4.3
   - changed setResult to reportResult() and count to ccCount()
   - added getter tally() for tally class variable;
   - added getter ccCount() for count class variable;
   - added method reportError() to report an indiviual error result;
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/languages/java; adjusted package;
   -------------------------------------------------------------------------
*/

package languages.java;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class ParamsExpected {
    private IParams   params;
    private IExpected expected;
    private IResult   result;

    private static int ccCount; // count of Code Challenge tests run
    private static int tally;   // tally of correct Code Challenge tests

    public ParamsExpected() {}
    public ParamsExpected(JsonObject paramsExpectedJson) {

	/* using Reflection instantiate ParamsExpected instance variables
	   using the Code Challenge utility classes Params and Expected */
	try {
	    this.params = (IParams) Class.
		forName(Check.paramsPackageName).
		getConstructor(JsonElement.class).
		newInstance(paramsExpectedJson.get("params"));
	    this.expected = (IExpected) Class.
		forName(Check.expectedPackageName).
		getConstructor(JsonElement.class).
		newInstance(paramsExpectedJson.get("expected"));
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

    // required getter method for params
    public IParams getParams() {
	return this.params;
    }

    // required getter method for expected
    public IExpected getExpected() {
	return this.expected;
    }

    public void reportResult(IResult result) {
	this.result = result;
	ParamsExpected.ccCount++;
	if (result.equals(expected)) {
	    ParamsExpected.tally++;
	} else {
	    this.reportError();
	}
    }

    public IResult result() {
	return this.result;
    }

    private void reportError() {
	System.out.println("ERROR:\n=====");
	System.out.println(Check.ccName + "(" + this.getParams() + ") produced " +
			   this.result() + "\nbut expected " + getExpected());
	System.out.println();
    }

    public String toString() {
	return "ParamsExpected: \n\tParams: " + getParams() + "\n\tExpected: " + getExpected();
    }

    public static int ccCount() {
	return ParamsExpected.ccCount;
    }

    public static int tally() {
	return ParamsExpected.tally;
    }
}
