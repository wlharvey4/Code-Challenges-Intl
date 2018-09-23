/**
   challenges/fizzbuzz/java/Result.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED: 2018-09-22
   VERSION: 0.0.2
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          result of running Fizzbuzz and is used to
	  compare with the expected value.
   NOTES: 
   CHANGE-LOG:
   ..................................................
   --version 0.0.1 2018-09-12
     + Initial commit
   ..................................................
   --version 0.0.2 2018-09-22
     + implemented CCI_Result; refactored constructor
       to receive a Fizzbuzz fizzbuzz for clarity
   --------------------------------------------------
 */

package challenges.fizzbuzz.java;
import languages.java.*;

public class Result implements CCI_Result {
    private Fizzbuzz result;

    public Result(Fizzbuzz fizzbuzz) {
	this.result = fizzbuzz;
    }

    public Fizzbuzz result() {
	return this.result;
    }

    public String toString() {
	return this.result().toString();
    }
}
