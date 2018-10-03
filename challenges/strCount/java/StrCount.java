/* challenges/strCount/java/StrCount.java
   =========================================================================
   CREATED: 2018-10-03T06:51:00
   UPDATED: 2018-10-03T09:00:00
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   StrCount challenge in Java.  Create a function called strCount()
            that accepts two string arguments and returns an integer of the
	    count of occurrences the second argument is found in the first
	    one.  If no occurrences can be found, a cound of zero should be
	    returned.  The first argument can be an empty string; the second
	    argument will always be of length 1.
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-10-03T06:51:00 version 0.0.1
   - initial commit;
   .........................................................................
   2018-10-03T09:00:00 version 1.0.0
   - completed
   -------------------------------------------------------------------------
*/

package challenges.strCount.java;

import languages.java.*;

public class StrCount implements ICC {
    private Params params;
    private Result result;

    /* constructor must accept IParams; can then cast it into a local
       Params for storage and use; calculate returns an IResult, then
       casts it into Result for internal storage;
    */
    public StrCount(IParams p) {
	this.params = (Params)p;
	this.result = (Result)this.calculate();
    }

    /* Specific instance variables will depend upon the requirements of the
       Code Challenge, and could include any number or type, which will be
       modeled by CCParams in Params class
    */
    public IResult calculate() {
	String str1 = params.str1();
	String str2 = params.str2();

	//=====================================================================
	// StrCount Code Challenge solution here

	int r = 0;
	int fromIndex = 0;
	int foundIndex = -1;

	while ((foundIndex = str1.indexOf(str2, fromIndex)) != -1) {
	    r++;
	    fromIndex = foundIndex + 1;
	}

	return new Result(r);
	//======================================================================
    }

    public IParams params() {
	return this.params;
    }
    public IResult result() {
	return this.result;
    }
}
