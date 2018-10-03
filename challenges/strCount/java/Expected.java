/* challenges/strCount/java/Expected.java
   =========================================================================
   CREATED: 2018-10-03T06:51:00
   UPDATED: 2018-10-03T09:00:00
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Receives Expected as JSON and converts to Java
   ROOT:    Code-Challenge-Intl
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

import com.google.gson.JsonElement;
import languages.java.*;

// Expected class is simply a Result class with a different name
public class Expected extends Result implements IExpected {

    public Expected(JsonElement expected) {
    	super(expected);
    }

    public int expected() {
	return this.result();
    }
}
