/**
   challenges/fizzbuzz/java/fizzbuzz.java
   ====================================================
   CREATED: 2018-07-07
   UPDATED: 2018-07-11
   VERSION: v0.0.1
   AUTHOR: wlharvey4
   ABOUT: Fizzbuzz implemented in Java
   NOTES: See "Union types in Java?" @ http://lambda-the-ultimate.org/node/2694
          See also https://github.com/pakoito/JavaSealedUnions
	  See perhaps https://docs.oracle.com/javase/7/docs/api/javax/lang/model/type/UnionType.html
	  	public interface UnionType extends TypeMirror
		Represents a union type. As of the RELEASE_7 source version, union types can appear
		as the type of a multi-catch exception parameter. 

	  But really see: "Substitutes for Missing C Constructs" by Joshua Bloch
	        @ http://www.oracle.com/technetwork/java/page1-139488.html

	  "The designers of the Java programming language chose to
	  omit the union construct because there is a much better
	  mechanism for defining a single data type capable of
	  representing objects of various types: subtyping. A
	  discriminated union is really just a pallid imitation of a
	  class hierarchy."

   CHANGE-LOG:
   v0.0.1: initial commit
   ----------------------------------------------------
 */

/* From "Union types in Java?" @ http://lambda-the-ultimate.org/node/2694 */
public class Fizzbuzz<A, B> {
    private Fizzbuzz() { }

    public A fb() { return null; }
    public B i()  { return null; }

    public final static class Fb<A, B> extends Fizzbuzz<A, B> {
	private A fb;
	public Fb(A fb) { this.fb = fb; }
	public A fb() { return fb; }
    }

    public static class I<A, B> extends Fizzbuzz<A, B> {
	private B i;
	public I(B i) { this.i = i; }
	public B i() { return i; }
    }

    public <C> C Fizzbuzz(Map<A, C> f, Map<B, C> g) {
	if (this instanceof Fb) return f.apply(fb());
	return g.apply(i());
    }
}

interface Map<A, B> {
    B apply(A a);
}
