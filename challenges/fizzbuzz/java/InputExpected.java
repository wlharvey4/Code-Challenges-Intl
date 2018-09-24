/**
   challenges/fizzbuzz/java/InputExpected.java
   =================================================
   CREATED: 2018-09-12
   UPDATED: 2018-09-23
   VERSION: 0.0.3
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
     + factored interface into class CCI_InputExpected
   -------------------------------------------------
 */

package challenges.fizzbuzz.java;
import com.google.gson.*;
import languages.java.*;

public class InputExpected extends CCI_InputExpected {
    private Gson ccJson;
    private Gson gson_input;
    private Gson gson_expected;

    private Input input;
    private Expected expected;

    public InputExpected(Gson ccJson) {
	this.ccJson = ccJson;
    }

    public Input input() {
	return this.input;
    }

    public Expected expected() {
	return this.expected;
    }

    class Params {
    }

    class Expected {
    }
}
