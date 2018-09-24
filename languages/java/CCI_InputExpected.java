/**
   languages/java/CCI_InputExpected.java
   =========================================================================
   CREATED: 2018-09-23
   UPDATED: 2018-09-24
   VERSION: 0.0.3
   AUTHOR:  wlharvey4
   ABOUT:   Interface for Input_Expected.java, which converts JSON into Java
   	    objects
   CLASSPATH: /usr/local/gson-2.8.5/gson.jar:/usr/local/<...path-to->/Code-Challenges-Intl/
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-23T16:45 Version 0.0.1
   - initial commit
   .........................................................................
   2018-09-23T23:42 Version 0.0.2
   - factored interface into class
   .........................................................................
   2018-09-24T10:30 Version 0.0.3
   - experimenting with data structure that can load JSON from Gson; this code
     compiles and runs properly;
   -------------------------------------------------------------------------
 */

package languages.java;

public class CCI_InputExpected {

    Params params;
    String expected;

    CCI_InputExpected() {}

    public String toString() {
	return "CCI_InputExpected:\n\tParams: " + this.params + "\n\tExpected: " + this.expected;
    }

    static class Params {
	int n;

	Params() {}
	Params(int n) {
	    this.n = n;
	}
	public String toString() {
	    return "n: " + this.n;
	}
    }
}
