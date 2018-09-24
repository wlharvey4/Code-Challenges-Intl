/**
   challenges/fizzbuzz/java/InputExpected.java
   =================================================
   CREATED: 2018-09-12
   UPDATED: 2018-09-24
   VERSION: 0.0.4
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          input parameter and expected output from the
	  conversion from the JSON structure.
   NOTES: 
   CHANGE-LOG:
   ................................................
   --version 0.0.1 2018-09-12
     + Initial commit
   .................................................
   --version 0.0.2 2018-09-23
     + Implemented CCI_InputExpected; incorporated
       Gson
   .................................................
   --version 0.0.3 2018-09-23
     + factored interface into class CCI_InputExpecteds
   .................................................
   --version 0.0.4 2018-09-24
     + factored CCI_InputExpected and InputExpected to
       successfully read in JSON into an array of InputExpected
       objects and print them out.
   -------------------------------------------------
 */

package challenges.fizzbuzz.java;
import com.google.gson.*;
import languages.java.*;

public class InputExpected implements CCI_InputExpected {

    private Params params;
    private String expected;

    public InputExpected() {}

    public Params getParams() {
	return this.params;
    }

    public String getExpected() {
	return "Expected: " + this.expected;
    }

    public String toString() {
	return "InputExpected:\n\tParams: " + this.params + "\n\tExpected: " + this.expected;
    }

    static class Params extends CCI_InputExpected.CCI_Params {
	private int n;

	public Params() {}

	public Params(int n) {
	    this.n = n;
	}
	
	int getN() {
	    return this.n;
	}

	public String toString() {
	    return "n: " + this.n;
	}
    }
}
