/**
   challenges/fizzbuzz/java/Result.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED:
   VERSION: 0.0.1
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          result of running Fizzbuzz and is used to
	  compare with the expected value.
   NOTES: 
   CHANGE-LOG:
   --version 0.0.1 2018-09-12
     + Initial commit
   --------------------------------------------------
 */

package challenges.fizzbuzz.java;

public class Result {
    private Fizzbuzz result;

    public Result(Fizzbuzz result) {
	this.result = result;
    }

    public Fizzbuzz result() {
	return this.result;
    }

    public String toString() {
	return this.result().toString();
    }
}
