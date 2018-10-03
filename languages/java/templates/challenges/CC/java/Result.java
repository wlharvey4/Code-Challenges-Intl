/* challenges/<cc>/java/Result.java
   =========================================================================
   CREATED: <DATE>
   UPDATED: 
   VERSION: 0.0.1
   AUTHOR:  wlharvey4
   ABOUT:   Concrete class representing a code challenge Result, which is
   	    equivalent to an Expected type
   ROOT:    CCI-GsonExample/
   CLASSPATH: .:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   <DATE> version 0.0.1
   - Initial
   -------------------------------------------------------------------------
*/

package challenges.<cc>.java;

import java.util.Scanner;
import com.google.gson.JsonElement;
import languages.java.*;

public class Result implements IResult {
    private <CC>Result result;

    public Result() {}

    /* this constructor is used by Expected while iterating over JSON data */
    public Result(JsonElement expectedJson) {
	try {
	    String expected = expectedJson.getAsString();
	    if (expected == null)
		throw new IllegalStateException("ERROR: parsing of expectedJson: " + expectedJson + " produced null");

	    /* This code is based upon needs of each Code Challenge */
	    Scanner intScanner = new Scanner(expected);

	    if (intScanner.hasNextInt()) {
		this.result = new Int_Result(intScanner.nextInt());
	    } else {
		this.result = new FB_Result(FB.valueOf(expected.toUpperCase()));
		if (this.result == null)
		    throw new IllegalArgumentException("ERROR: result: `" + expected + "' does not have an FB value");
	    }
	}
	catch (IllegalArgumentException iae) {
	    iae.printStackTrace();
	    System.exit(-1);
	}	
	catch (IllegalStateException ise) {
	    ise.printStackTrace();
	    System.exit(-1);
	}
    }

    /* This code is based upon needs of each Code Challenge */
    public Result(FB result) {
	this.result = new FB_Result(result);
    }

    public Result(int result) {
	this.result = new Int_Result(result);
    }

    /* basic getter */
    public <CC>Result result() {
	return this.result;
    }

    public String toString() {
	return result().toString();
    }


    /* Equals() code will vary based upon needs of each Code Challenge */
    public boolean equals(IExpected that) {
	return this.equals((Expected) that);
    }

    public boolean equals(IResult that) {
	return this.equals((Result) that);
    }

    public boolean equals(Expected that) {
	return this.result().equals(that.expected());
    }

    public boolean equals(Result that) {
	return true;
    }


    /* Code below was required by Fizzbuzz Code Challenge based upon it
       its need to have multiple Result types; this will probably not be
       necessary in the common situation.
    */
    protected interface <CC>Result {
	public boolean equals(<CC>Result that);
	public boolean equals(FB_Result that);
	public boolean equals(Int_Result that);
    }

    private class FB_Result implements <CC>Result {
	private FB result;

	private FB_Result() {}
	private FB_Result(FB fb) {
	    this.result = fb;
	}

	public FB result() {
	    return this.result;
	}
	public String toString() {
	    return result().toString();
	}


	// more dispatching methods to continue resolving calls to equals()
	public boolean equals(<CC>Result that) {
	    return that.equals(this);
	}
	public boolean equals(FB_Result that) {
	    return this.result() == that.result();
	}
	public boolean equals(Int_Result that) {
	    return false;
	}
    }

    private class Int_Result implements <CC>Result {
	private Integer result;

	private Int_Result() {}
	private Int_Result(int i) {
	    this.result = i;
	}

	public Integer result() {
	    return this.result;
	}
	public String toString() {
	    return result().toString();
	}


	// more dispatching methods to continue resolving calls to equals()
	public boolean equals(<CC>Result that) {
	    return that.equals(this);
	}
	public boolean equals(FB_Result that) {
	    return false;
	}
	public boolean equals(Int_Result that) {
	    return this.result() == that.result();
	}
    }
}
