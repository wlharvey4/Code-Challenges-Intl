/* challenge/fizzbuzz/java/Fizzbuzz.java
   =========================================================================
   CREATED: 2018-09-28
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   fizzbuzz challenge in Java
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-28T16:40 version 0.0.1
   - Initial
   .........................................................................
   2018-09-28T19:36 version 0.0.2
   - changed calculate to return void, but set an instance variable Result
     result
     .........................................................................
   2018-09-29T07:04 version 0.0.3
   - added required Result result();
   .........................................................................
   2018-09-29T10:04 version 0.0.4
   - corrected using interface parameters instead of local parameters:
     IParams and IResult;
   .........................................................................
   2018-09-29T10:13 version 0.0.5
   - refactored to have calculate() return an IResult type;
   - refactored to have constructor call the calculate() method directly and
     assign return value to instance variable result;
   - refactored to have getParams() be called params() and be required through
     interface ICC;
     .........................................................................
   2018-09-29T14:10 version 0.0.6
   - refactored instance variables to hold Params and Result instead of IParams
     and IResult; needed to cast constructor argument IParams into Params;
     the instance method getters return IParams and IResult though;
   - refactored calculate() to not accept a parameter, but use its own instance
     variable;
   - implemented calculate() to obtain the param n;
   .........................................................................
   2018-09-29T15:55 version 0.1.0
   - fully implemented calculate() method; correctly returns Result value;
   .........................................................................
   2018-09-30T14:15 version 0.1.1
   - refactored all types to interface types, and cast values to private types
     internally;
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/challenges/fizzbuzz/java; adjusted
     packages;
   -------------------------------------------------------------------------
*/

package challenges.fizzbuzz.java;

import languages.java.*;

public class Fizzbuzz implements ICC {
    private Params params;
    private Result result;

    public Fizzbuzz() {}

    /* constructor must accept IParams; can then cast it into a local
       Params for storage and use; calculate returns an IResult, then
       casts it into Result for internal storage;
    */
    public Fizzbuzz(IParams p) {
	this.params = (Params)p;
	this.result = (Result)this.calculate();
    }

    public IResult calculate() {
	int n = params.n();

	//=====================================================================
	// this is Fizzbuzz code challenge solution
	boolean fizz = n % 3 == 0;
	boolean buzz = n % 5 == 0;
	boolean fizzbuzz = fizz && buzz;
	Result result;

	if (fizz || buzz || fizzbuzz) {
	    FB fb;
	    if (fizzbuzz) fb = FB.FIZZBUZZ;
	    else fb = fizz ? FB.FIZZ : FB.BUZZ;
	    result = new Result(fb);
	} else {
	    result = new Result(n);
	}

	return result;
	//======================================================================
    }

    public IParams params() {
	return this.params;
    }
    public IResult result() {
	return this.result;
    }
}
