/**
   challenges/fizzbuzz/java/Expected.java
   ==================================================
   CREATED: 2018-09-12
   UPDATED:
   VERSION: 0.0.1
   AUTHOR: wlharvey4
   ABOUT: Utility class for Fizzbuzz.java; holds the 
          expected output from the conversion from the
	  JSON structure.
   NOTES: 
   CHANGE-LOG:
   --version 0.0.1 2018-09-12
     + Initial commit
   --------------------------------------------------
 */

public class Expected {
    private Fizzbuzz expected;

    public Expected(Fizzbuzz expected) {
	this.expected = expected;
    }

    public Fizzbuzz expected() {
	return this.expected;
    }

    public String toString() {
	return this.expected().toString();
    }
}
