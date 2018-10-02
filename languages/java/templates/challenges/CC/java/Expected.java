/* challenges/<cc>/java/Expected.java
   =========================================================================
   CREATED: <DATE>
   UPDATED: 
   VERSION: 0.0.1
   AUTHOR:  wlharvey4
   ABOUT:   Receives Expected as JSON and converts to Java
   ROOT:    Code-Challenge-Intl
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   <DATE> version 0.0.1
   - initial commit
   -------------------------------------------------------------------------
*/

package challenges.<cc>.java;

import com.google.gson.JsonElement;
import languages.java.*;

// Expected class is simply a Result class with a different name
public class Expected extends Result implements IExpected {

    public Expected(JsonElement expected) {
    	super(expected);
    }

    public <CC>Result expected() {
	return this.result();
    }
}
