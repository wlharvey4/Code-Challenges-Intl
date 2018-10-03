/* challenges/strCount/java/Params.java
   =========================================================================
   CREATED: 2018-10-03T06:51:00
   UPDATED: 2018-10-03T09:00:00
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Receives Params from JSON and converts them into Java
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:   
   CHANGE-LOG:
   .........................................................................
   2018-10-03T06:51:00 version 0.0.1
   - initial commit;
   .........................................................................
   2018-10-03T09:00:00 version 1.0.0
   - completed;
   -------------------------------------------------------------------------
*/

package challenges.strCount.java;

import com.google.gson.*;
import languages.java.*;

public class Params implements IParams {
    private String str1;
    private String str2;
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

    public String str1() {
	return this.str1;
    }
    public String str2() {
	return this.str2;
    }

    public void setParams() {	// <== setters will vary based upon individual Code Challenge
	this.str1 = ccp.getStr1();
	this.str2 = ccp.getStr2();
    }

    public String toString() { 	// <== toString() will vary based upon individual Code Challenge
	return "str1 = \"" + str1() + "\", str2 = \"" + str2() + "\"";
    }



    /* 
       This private class is used by Gson.fromJson to parse the incoming JSON params
       and provides getters to extract the params; this will need to be individually
       made for each Code Challenge.
    */
    private class CCParams {
	private String str1;
	private String str2;

	public String getStr1() {
	    return this.str1;
	}
	public String getStr2() {
	    return this.str2;
	}
    }
}
