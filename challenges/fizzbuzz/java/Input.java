/**
   challenges/fizzbuzz/java/Input.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED: 2018-09-22
   VERSION: 0.0.2
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          input parameter from the conversion from the
	  JSON structure.
   NOTES: 
   CHANGE-LOG:
   --version0.0.1 2018-09-12
     + Initial commit
   ..................................................
   --version0.0.2 2018-09-22
     + Implemented CCI_Input interface
   --------------------------------------------------
 */

package challenges.fizzbuzz.java;
import languages.java.*;

public class Input implements CCI_Input {
    private int n;

    public Input(int n) {
	this.n = n;
    }

    public int n() {
	return this.n;
    }
}
