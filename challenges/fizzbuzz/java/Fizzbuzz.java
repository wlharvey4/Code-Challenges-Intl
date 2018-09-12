/**
   challenges/fizzbuzz/java/Fizzbuzz.java
   ==================================================
   CREATED: 2018-09-11
   UPDATED: 2018-09-11
   VERSION: 0.1.2
   USAGE: java Fizzbuzz <# #>
   AUTHOR: wlharvey4
   ABOUT: Fizzbuzz implemented in Java
   NOTES: This is a working version of Fizzbuzz.java
	  that does not rely upon introspection to
	  do its thing; rather, it relies upon
	  subclassing and dynamic dispatching;
          at the moment it works only from the
	  command-line, so need to implement a test
	  runner.

	  See: "Substitutes for Missing C Constructs"
	  by Joshua Bloch
	  http://www.oracle.com/technetwork/java/page1-139488.html
	  "The designers of the Java programming language chose to
	  omit the union construct because there is a much better
	  mechanism for defining a single data type capable of
	  representing objects of various types: subtyping. A
	  discriminated union is really just a pallid imitation of a
	  class hierarchy."  [what a great word --- `pallid'!]
   CHANGE-LOG:
   --version 0.0.1 2018-09-11
     Initial commit
   --version 0.0.2 2018-09-11
     Added USAGE; changed toString() of num
   --version 0.1.0 2018-09-11
     + rearranged code for better readability;
     + reimplemented the fizzbuzz calculation;
     + added comments
   --version 0.1.1 2018-09-11
     + updated comments and Notes
   --version 0.1.2 2018-09-11
     + Added reference to Joshua Bloch comment; revised
       fizzbuzz calculation to use temp variable and only
       one assignment instead of three
   ==================================================
 */

public class Fizzbuzz {

    private int n;	// the input number
    private F fizzbuzz;	// the calculated Fizzbuzz output
    			// can be one of FIZZ,BUZZ,FIZZBUZZ, or n

    /* the constructor; calculates F fizzbuzz from int n */
    public Fizzbuzz(int n) {
	this.n = n;
	
	boolean fizz = !(n % 3 != 0);
	boolean buzz = !(n % 5 != 0);
	boolean fizzbuzz = fizz && buzz;
	
	if (fizz || buzz || fizzbuzz) {
	    FB fb;
	    if (fizzbuzz)  fb = FB.FIZZBUZZ;
	    else if (fizz) fb = FB.FIZZ;
	    else           fb = FB.BUZZ;
	    this.fizzbuzz = new FFB(fb);
	}
	else this.fizzbuzz = new FNum(n);
    }

    public int getN() {		// getter for n
	return n;
    }

    public F getFizzbuzz() {	// getter for fizzbuzz
	return fizzbuzz;
    }

    public void calcFizzbuzz() {// prints a nice message
	System.out.println("Fizzbuzz(" + getN() + ") = " + getFizzbuzz());
    }

    public boolean eq(F f1, F f2) {	// compare two fizzbuzz results for equality
	return f1.eq(f2);		// for the rest runner to use
    }


    
    /* INTERNAL IMPLEMENTATION DETAILS */
    
    private enum FB {
	FIZZ, BUZZ, FIZZBUZZ
    }

    /* F is the type of fizzbuzz in the class Fizzbuzz above;
       it can hold an enum or an integer */
    private abstract class F {
	abstract boolean eq(F f);
    }
    
    /* subclass that holds an enum */
    private class FFB extends F {
	FB fb;
	
	FFB(FB fb) {
	    this.fb = fb;
	}

	boolean eq(F f) {
	    return f.eq(this);
	}
	boolean eq(FFB other) {
	    return this.fb == other.fb;
	}
	boolean eq(FNum other) {
	    return false;
	}
	public String toString() {
	    return fb.toString();
	}
    }
    
    /* subclass that holds an integer */
    private class FNum extends F {
	int num;
	
	FNum(int num) {
	    this.num = num; 
	}

	boolean eq(F f) {
	    return f.eq(this);
	}
	boolean eq(FFB other) {
	    return false;
	}
	boolean eq(FNum other) {
	    return this.num == other.num;
	}
	public String toString() {
	    return Integer.toString(num);
	}
    }

    public static void main(String[] args) {
	Fizzbuzz fb1 = new Fizzbuzz(Integer.valueOf(args[0]));
	Fizzbuzz fb2 = new Fizzbuzz(Integer.valueOf(args[1]));
	fb1.calcFizzbuzz();
	fb2.calcFizzbuzz();
    }
}
