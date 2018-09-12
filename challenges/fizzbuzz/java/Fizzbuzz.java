/**
   challenges/fizzbuzz/java/Fizzbuzz.java
   ==================================================
   CREATED: 2018-09-11
   UPDATED:
   VERSION: 0.0.1
   AUTHOR: wlharvey4
   ABOUT: Fizzbuzz implemented in Java
   NOTES: This is a working version of Fizzbuzz.java
          but only from the command-line at the 
	  moment; need to implement a test runner.
   ==================================================
 */

public class Fizzbuzz {
    private enum FB {
	FIZZ, BUZZ, FIZZBUZZ
    }

    private int n;
    private F fizzbuzz;

    private abstract class F {
	abstract boolean eq(F f);
    }
    
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
	    return Integer.valueOf(num).toString();
	}
    }

    public Fizzbuzz(int n) {
	this.n = n;
	
	boolean fizz = !(n % 3 != 0);
	boolean buzz = !(n % 5 != 0);
	boolean fizzbuzz = fizz && buzz;
	
	if (fizzbuzz) this.fizzbuzz = new FFB(FB.FIZZBUZZ);
	else if (fizz || buzz) {
	    if (fizz) this.fizzbuzz = new FFB(FB.FIZZ);
	    else this.fizzbuzz = new FFB(FB.BUZZ);
	}
	else this.fizzbuzz = new FNum(n);
    }

    public boolean eq(F f1, F f2) {
	return f1.eq(f2);
    }

    public int getN() {
	return n;
    }

    public F getFizzbuzz() {
	return fizzbuzz;
    }

    public void calcFizzbuzz() {
	System.out.println("Fizzbuzz(" + getN() + ") = " + getFizzbuzz());
    }

    public static void main(String[] args) {
	Fizzbuzz fb1 = new Fizzbuzz(Integer.valueOf(args[0]));
	Fizzbuzz fb2 = new Fizzbuzz(Integer.valueOf(args[1]));
	fb1.calcFizzbuzz();
	fb2.calcFizzbuzz();
    }
}
