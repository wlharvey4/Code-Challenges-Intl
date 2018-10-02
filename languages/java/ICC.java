/* languages.java/ICC.java
   =========================================================================
   CREATED: 2018-09-28
   UPDATED: 2018-10-01
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Interface for code challenges
   ROOT:    Code-Challenges-Intl/
   CLASSPATH: .:../../:gson-2.8.5.jar
   NOTES:
   CHANGE-LOG:
   .........................................................................
   2018-09-28T16:44 version 0.0.1
   - Initial
   .........................................................................
   2018-09-28T19:36 version 0.0.2
   - refactored calculate to return void (implementation will store Result
     result in an instance variable instead
   .........................................................................
   2018-09-29T07:04 version 0.0.3
   - added required method IReturn return();
   .........................................................................
   2018-09-29T10:11 version 0.0.4
   - refactored return type of result() to be IResult instead of void;
   - refactored to require method IParams params();
   .........................................................................
   2018-09-29T14:30 version 0.0.5
   - refactored parameter out of calculate() method;
   .........................................................................
   2018-10-01T18:30 version 1.0.0
   - moved code into Code-Challenges-Intl/languages/java; adjusted package;
   -------------------------------------------------------------------------
*/

package languages.java;

public interface ICC {
    public IResult calculate();
    public IParams params();
    public IResult result();
}
