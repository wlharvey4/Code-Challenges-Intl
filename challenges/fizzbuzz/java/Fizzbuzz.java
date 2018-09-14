/**
   challenges/fizzbuzz/java/Fizzbuzz.java
   ==================================================
   CREATED: 2018-09-11
   UPDATED: 2018-09-13
   VERSION: 0.1.4
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
     + Initial commit
   --version 0.0.2 2018-09-11
     + Added USAGE; changed toString() of num
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
   --version 0.1.3 2018-09-12
     + Refactored the check for a fizz and a buzz
     + Refactored to use Input input, which will be from 
       the JSON data structure
   --version 0.1.4 2018-09-13
     + Refactored to use interface F with eq() using double dispatch
   ==================================================
 */

public class Fizzbuzz {

    private int n;	// the input number
    private F fizzbuzz;	// the calculated Fizzbuzz output
    			// can be one of FIZZ,BUZZ,FIZZBUZZ, or n

    /* the constructor; calculates F fizzbuzz from int n */
    public Fizzbuzz(Input input) {
	this.n = input.n();
	
	boolean fizz = (n % 3 == 0);
	boolean buzz = (n % 5 == 0);
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

    public int n() {		// getter for n
	return n;
    }

    public F fizzbuzz() {	// getter for fizzbuzz
	return fizzbuzz;
    }

    public void calcFizzbuzz() {// prints a nice message
	System.out.println("Fizzbuzz(" + n() + ") = " + fizzbuzz());
    }

    public String toString() {
	return this.fizzbuzz().toString();
    }

    public boolean eq(Fizzbuzz that) {
        return this.fizzbuzz().eq(that.fizzbuzz());
    }



    
    /* INTERNAL IMPLEMENTATION DETAILS */
    
    private enum FB {
	FIZZ, BUZZ, FIZZBUZZ
    }

    /* the F interface ties the subclasses together through their
       equality attributes; an F can hold an enum or an integer */
    private interface F {
	boolean eq(F f);
	boolean eq(FFB f);
	boolean eq(FNum f);
    }
    
    /* subclass that holds an enum */
    private class FFB implements F {
	private FB fb;		// holds an enum FIZZ, BUZZ, or FIZZBUZZ
	
	public FFB(FB fb) {	// constructor
	    this.fb = fb;
	}

	public FB fb() {	// getter
	    return this.fb;
	}

	/* this is where double dispatch takes place; `this' is an FFB
	   but `that's type is unknown, so let `that' dispatch itself, carrying
	   `this' FFB with it as an argument.  `this' will pick the correct
	   overloaded method to use; the same thing happens in FNum */
	public boolean eq(F that) {
	    return that.eq(this);
	}

	/* Enums have their own equality method built-in */
	public boolean eq(FFB that) {
	    return this.fb() == that.fb();
	}

	/* an FFB cannot be equal to an FNum */
	public boolean eq(FNum that) {
	    return false;
	}

	public String toString() {
	    return fb.toString();
	}
    }
    
    /* subclass that holds an integer */
    private class FNum implements F {
	private int num;
	
	public FNum(int num) {
	    this.num = num; 
	}

	public int num() {
	    return this.num;
	}

	public boolean eq(F that) {
	    return that.eq(this);
	}

	public boolean eq(FFB that) {
	    return false;
	}

	public boolean eq(FNum that) {
	    return this.num() == that.num();
	}

	public String toString() {
	    return Integer.toString(num);
	}
    }

    public static void main(String[] args) {
	Input input1 = new Input(Integer.valueOf(args[0]));
	Input input2 = new Input(Integer.valueOf(args[1]));
	Fizzbuzz fb1 = new Fizzbuzz(input1);
	Fizzbuzz fb2 = new Fizzbuzz(input2);
	fb1.calcFizzbuzz();
	fb2.calcFizzbuzz();
	Result result = new Result(fb1);
	Expected expected = new Expected(fb2);

	System.out.println("Result   (" + result + ")");
	System.out.println("Expected (" + expected + ")");
	System.out.println(fb1.eq(fb2));
    }
}
