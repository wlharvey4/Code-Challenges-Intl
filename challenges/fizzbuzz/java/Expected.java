/* challenges/fizzbuzz/java/Expected.java
   =========================================================================
   CREATED: 2018-09-26
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Receives Expected as JSON and converts to Java
   ROOT:    Code-Challenge-Intl
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-26 version 0.1.0
   - initial commit
   .........................................................................
   2018-09-26 version 0.1.1
   - adjusted packages
   .........................................................................
   2018-09-27 version 0.1.2
   - adjusted packages again
   - added code information
   .........................................................................
   2018-09-28 version 0.2.0
   - creaed challenges.fizzbuzz.java.Expected
   .........................................................................
   2018-09-28 version 0.2.1
   - refactored toString()
   .........................................................................
   2018-09-29 version 0.2.2
   - removed static from instance variable
   .........................................................................
   2018-09-29 version 0.2.3
   - convert Expected to a Result instead of String
   .........................................................................
   2018-09-29T08:53 version 0.2.4
   - refactored Expected constructor to convert incoming JsonElement into the
     appropriate Result type
   .........................................................................
   2018-09-29T09:25 version 0.2.5
   - refactored Scanner check into Result constructor
   - refactored toString() to return getExpected() instead of instance variable
     directly
   .........................................................................
   2018-09-29T17:50 version 0.2.6
   - cleaned up constructor code a bit;
   - refactored getExpected() to expected();
   - reformatted toString();
   .........................................................................
   2018-09-30T14:10 version 0.3.0
   - completely gutted Expected and made it a subclass of Result with one
     constructor and one getter; all other methods are resolved by Result;
   .........................................................................
   2018-10-01T15:40 version 0.3.1
   - added clarifying comment
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/challenges/fizzbuzz/java; adjusted
     packages
   -------------------------------------------------------------------------
*/

package challenges.fizzbuzz.java;

import com.google.gson.JsonElement;
import languages.java.*;

// Expected class is simply a Result class with a different name
public class Expected extends Result implements IExpected {

    public Expected(JsonElement expected) {
    	super(expected);
    }

    public FizzbuzzResult expected() {
	return this.result();
    }
}
