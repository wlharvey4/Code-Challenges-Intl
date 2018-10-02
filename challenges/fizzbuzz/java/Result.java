/* challenges/fizzbuzz/java/Result.java
   =========================================================================
   CREATED: 2018-09-28
   UPDATED: 2018-10-01
   VERSION: 0.2.3
   AUTHOR:  wlharvey4
   ABOUT:   Concrete class representing a code challenge Result, which is
   	    equivalent to an Expected type
   ROOT:    CCI-GsonExample/
   CLASSPATH: .:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-28T16:58 version 0.0.1
   - Initial
   .........................................................................
   2018-09-29T07:10 version 0.0.2
   - Implemented Result
   .........................................................................
   2018-09-29T08:00 version 0.0.3
   - use an Integer rather than int
   .........................................................................
   2018-09-29T08:50 version 0.0.4
   - changed constructor to one taking a String parameter;
   - added try-catch for IllegalArgumentException should something other than
     a FB type comes in; also converted string to all upper case;
   .........................................................................
   2018-09-29T09:28 version 0.0.5
   - refactored constructor to test incoming String for whether it is an
     Integer or String, and create the correct type using a Scanner;
   - refactored to add toString() methods to main class and subclasses
   .........................................................................
   2018-09-29T15:55 version 0.1.0
   - added a constructor with an FB argument to aid Fizzbuzz.calculate()
   .........................................................................
   2018-09-29T17:55 version 0.1.1
   - reformatted toString()
   .........................................................................
   2018-09-30T09:00 version 0.2.0
   - refactored Result instance variable to FizzbuzzResult interface, which has
     two concrete implementations: FB_Result and Int_Result, so that when
     Result.result() is called, a FizzbuzzResult type will be returned.
   .........................................................................
   2018-09-30T14:00 version 0.2.1
   - refactored constructor Result(JsonElement) (from a String parameter) to
     document that it is used by Expected and receives a JSON value, which 
     must be scanned to determine if it is an integer or Enum type;
   - added multiple dispatching equals() methods to resolve calls to equals();
   - refactored FizzbuzzResult into protected type so that Expected can access
     it;
   - added multiple dispatching equals() in FizzbuzzResult and its subclasses
     to continue dispatching on calls to equals() in Result;
   .........................................................................
   2018-10-01T08:35 version 0.2.2
   - factored in check for null after parsing JSON from ParamsExpected class,
     and before that from Main class;
   .........................................................................
   2018-10-01T15:35 version 0.2.3
   - added clarifying comments
   -------------------------------------------------------------------------
*/

package challenges.fizzbuzz.java;

import java.util.Scanner;
import com.google.gson.JsonElement;
import languages.java.*;

public class Result implements IResult {
    private FizzbuzzResult result;

    public Result() {}

    /* this constructor is used by Expected while iterating over JSON data */
    public Result(JsonElement expectedJson) {
	try {
	    String expected = expectedJson.getAsString();
	    if (expected == null)
		throw new IllegalStateException("ERROR: parsing of expectedJson: " + expectedJson + " produced null");

	    /* need Scanner to check whether the incoming result is an Integer or FB */
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

    /* these two constructors are used by Fizzbuzz to instantiate calculations */
    public Result(FB result) {
	this.result = new FB_Result(result);
    }

    public Result(int result) {
	this.result = new Int_Result(result);
    }

    /* basic getter */
    public FizzbuzzResult result() {
	return this.result;
    }

    public String toString() {
	return result().toString();
    }


    /* four methods utilize multiple dynamic dispatching to resolve all invoking
       objects and associated arguments */
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


    /* below code is internal to this method and produces dual Fizzbuzz result
       of integer or Fizzbuzz */
    protected interface FizzbuzzResult {
	public boolean equals(FizzbuzzResult that);
	public boolean equals(FB_Result that);
	public boolean equals(Int_Result that);
    }

    private class FB_Result implements FizzbuzzResult {
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
	public boolean equals(FizzbuzzResult that) {
	    return that.equals(this);
	}
	public boolean equals(FB_Result that) {
	    return this.result() == that.result();
	}
	public boolean equals(Int_Result that) {
	    return false;
	}
    }

    private class Int_Result implements FizzbuzzResult {
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
	public boolean equals(FizzbuzzResult that) {
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
