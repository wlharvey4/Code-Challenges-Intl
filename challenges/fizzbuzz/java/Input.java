/**
   challenges/fizzbuzz/java/Input.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED:
   VERSION: 0.0.1
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          input parameter from the conversion from the
	  JSON structure.
   NOTES: 
   CHANGE-LOG:
   --version0.0.1 2018-09-12
     + Initial commit
   --------------------------------------------------
 */

package challenges.fizzbuzz.java;

public class Input {
    private int n;

    public Input(int n) {
	this.n = n;
    }

    public int n() {
	return this.n;
    }
}
