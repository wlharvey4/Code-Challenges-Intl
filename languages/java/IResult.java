/* languages.java/IResult.java
   =========================================================================
   CREATED: 2018-09-28
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Interface file for code challenge Result type, which is equivalent
   	    to the Expected type
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-28T16:54 version 0.0.1
   - Initial
   .........................................................................
   2018-09-30T13:37 version 0.1.0
   - Basic IResult interface;
   .........................................................................
   2018-09-30T15:15 version 0.1.1
   - Added methods equals(IExpected) and equals(IResult);
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/languages/java; adjusted package;
   -------------------------------------------------------------------------
*/

package languages.java;

public interface IResult {
    public boolean equals(IExpected that);
    public boolean equals(IResult that);
}
