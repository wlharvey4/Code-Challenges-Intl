/**
   challenges/fizzbuzz/java/InputExpected.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED:
   VERSION: 0.0.1
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          input parameter and expected output from the
	  conversion from the JSON structure.
   NOTES: 
   CHANGE-LOG:
   --version 0.0.1 2018-09-12
     + Initial commit
   --------------------------------------------------
 */

public class InputExpected {
    private Input input;
    private Expected expected;

    public InputExpected(Input input, Expected expected) {
	this.input = input;
	this.expected = expected;
    }

    public Input input() {
	return this.input;
    }

    public Expected expected() {
	return this.expected;
    }
}
