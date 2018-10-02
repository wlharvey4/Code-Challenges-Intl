/* challenges/fizzbuzz/java/Params.java
   =========================================================================
   CREATED: 2018-09-26
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Receives Params from JSON and converts them into Java
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
   2018-09-27 version 0.1.2
   - adjusted packages again;
   - added code information
   .........................................................................
   2018-09-28T13:20 version 0.2.0
   - created challenges.fizzbuzz.java.Params
   .........................................................................
   2018-09-28T14:00 version 0.2.1
   - refactored name ccParams to CCParams;
   - modified comments
   .........................................................................
   2018-09-28T16:30 version 0.2.2
   - refactored toString()
   .........................................................................
   2018-09-29T14:30 version 0.2.3
   - removed static from instance variable n;
   - refactored getParams() into n()
   - also refactored toString() in accordance with n();
   .........................................................................
   2018-09-29T17:53 version 0.2.4
   - reformatted toString()
   .........................................................................
   2018-10-01T08:35 version 0.2.5
   - factored in check for null after parsing from ParamsExpected, and before
     that from Main;
   .........................................................................
   2018-10-01T15:30 version 0.2.6
   - refactored code for clarity; added comments
   .........................................................................
   2018-10-01T17:40 version 0.2.7
   - made CCParams private;
   - added clarifying comments for private object CCParams
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/challenges/fizzbuzz/java; adjusted
     packages;
   -------------------------------------------------------------------------
*/

package challenges.fizzbuzz.java;

import com.google.gson.*;
import languages.java.*;

public class Params implements IParams {
    private int n;	  // <== this instance variable depends upon the individual Code Challenge
    private CCParams ccp; /* <== private class modeling the Code Challenges' params
			         used by Gson to parse the incoming JsonElement argument

    /* Constructor with one parameter of type JsonElement which is fed by ParamsExpected class */
    public Params(JsonElement params) {
	Gson gson = new Gson();
	try {
	    // parse and instantiate ccp; obtain individual params and place in instance variables
	    ccp = gson.fromJson(params, CCParams.class);
	    if (ccp == null)
		throw new IllegalStateException("ERROR: the parsing of params: " + params + " returned null");
	    this.n = ccp.getN();
	}
	catch (JsonSyntaxException | IllegalStateException je) {
	    je.printStackTrace();
	    System.exit(-1);
	}
    }

    public int n() {
	return this.n;
    }

    public String toString() {
	return "n = " + n();
    }

    /* this is used by Gson.fromJson to parse the incoming JSON params
       and provides a getter to extract the params; this will need to
       be individually made for each Code Challenge */
    private class CCParams {
	private int n;

	public int getN() {
	    return this.n;
	}
    }
}
