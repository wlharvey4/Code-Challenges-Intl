/* challenges/<cc>/java/Params.java
   =========================================================================
   CREATED: <DATE>
   UPDATED: 
   VERSION: 0.0.1
   AUTHOR:  wlharvey4
   ABOUT:   Receives Params from JSON and converts them into Java
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:   
   CHANGE-LOG:
   -------------------------------------------------------------------------
*/

package challenges.<cc>.java;

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
	    if (ccp == null) // <==
		throw new IllegalStateException("ERROR: the parsing of params: " + params + " returned null");
	    setParams(); // <== this setter will vary based upon actual parameters of the Code Challenge
	}

	catch (JsonSyntaxException | IllegalStateException je) {
	    je.printStackTrace();
	    System.exit(-1);
	}
    }

    public int n() { 		// <== getters will vary based upon individual Code Challenge
	return this.n;
    }

    public void setParams() {	// <== setters will vary based upon individual Code Challenge
	this.n = ccp.getN();
    }

    public String toString() { 	// <== toString() will vary based upon individual Code Challenge
	return "n = " + n();
    }



    /* 
       This private class is used by Gson.fromJson to parse the incoming JSON params
       and provides getters to extract the params; this will need to be individually
       made for each Code Challenge.
    */
    private class CCParams {
	private int n;

	public int getN() {
	    return this.n;
	}
    }
}
