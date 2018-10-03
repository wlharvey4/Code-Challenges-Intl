/* challenges/<cc>/java/<CC>.java
   =========================================================================
   CREATED: <DATE>
   UPDATED: 
   VERSION: 0.0.1
   AUTHOR:  wlharvey4
   ABOUT:   <CC> challenge in Java
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   <DATE> version 0.0.1
   - initial commit;
   -------------------------------------------------------------------------
*/

package challenges.<cc>.java;

import languages.java.*;

public class <CC> implements ICC {
    private Params params;
    private Result result;

    public <CC>() {}

    /* constructor must accept IParams; can then cast it into a local
       Params for storage and use; calculate returns an IResult, then
       casts it into Result for internal storage;
    */
    public <CC>(IParams p) {
	this.params = (Params)p;
	this.result = (Result)this.calculate();
    }

    /* Specific instance variables will depend upon the requirements of the
       Code Challenge, and could include any number or type, which will be
       modeled by CCParams in Params class
    */
    public IResult calculate() {
	int n = params.n();

	//=====================================================================
	// <CC> Code Challenge solution here
	// ...

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
