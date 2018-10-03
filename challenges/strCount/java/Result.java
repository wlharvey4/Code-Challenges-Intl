/* challenges/strCount/java/Result.java
   =========================================================================
   CREATED: 2018-10-03T06:51:00
   UPDATED: 2018-10-03T09:00:00
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Concrete class representing a code challenge Result, which is
   	    equivalent to an Expected type
   ROOT:    CCI-GsonExample/
   CLASSPATH: .:gson-2.8.5.jar
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

public class Result implements IResult {
    private int result;

    public Result(int result) {
	this.result = result;
    }

    public Result(JsonElement result) {
	this.result = result.getAsInt();
    }

    /* basic getter */
    public int result() {
	return this.result;
    }

    public String toString() {
	return Integer.toString(this.result());
    }

    public boolean equals(IExpected that) {
	return this.equals((Expected)that);
    }

    public boolean equals(Expected that) {
	return this.result() == that.expected();
    }

    public boolean equals(IResult that) {
	return this == (Result) that;
    }

    public boolean equals(Result that) {
	return this.result() == that.result();
    }

}
