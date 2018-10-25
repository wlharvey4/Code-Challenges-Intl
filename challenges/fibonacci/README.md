Fibbonacci Numbers
==================

In mathematics, the Fibonacci numbers are  the numbers in the following integer
sequence, called  the Fibonacci  sequence, and characterized  by the  fact that
every number after the first two is the sum of the two preceding ones:

    1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...

Often, especially in modern usage, the sequence is extended by one more initial
term:

    0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...

By definition, the first two numbers in the Fibonacci sequence are either 1 and
1, or 0 and 1, depending on the chosen starting point of the sequence, and each
subsequent number is the sum of the previous two.

The sequence Fn of Fibonacci numbers is defined by the recurrence relation:

    Fn = Fn-1 + Fn-2

with seed values:

    F1 = 1, F2 = 1

or

    F0 = 0, F1 = 1

Fibonacci numbers  appear unexpectedly  often in mathematics,  so much  so that
there is an  entire journal dedicated to their study,  the Fibonacci Quarterly.
Applications  of Fibonacci  numbers  include computer  algorithms  such as  the
**Fibonacci search technique**  and the **Fibonacci heap  data structure**, and
graphs  called  **Fibonacci  cubes**  used  for  interconnecting  parallel  and
distributed  systems.   They  also  appear  in  biological  settings,  such  as
branching in  trees, phyllotaxis  (the arrangement  of leaves  on a  stem), the
fruit sprouts of a pineapple, the  flowering of an artichoke, an uncurling fern
and the arrangement of a pine cone's bracts.


Fibonacci Search Technique
--------------------------

In computer science, the Fibonacci search  technique is a method of searching a
sorted array  using a divide and  conquer algorithm that narrows  down possible
locations with  the aid of Fibonacci  numbers. Compared to binary  search where
the  sorted array  is  divided into  two  equal-sized parts,  one  of which  is
examined further, Fibonacci  search divides the array into two  parts that have
sizes that are consecutive Fibonacci numbers.   On average, this leads to about
4% more  comparisons to  be executed, but  it has the  advantage that  one only
needs addition and  subtraction to calculate the indices of  the accessed array
elements,  while   classical  binary   search  needs  bit-shift,   division  or
multiplication, operations that  were less common at the  time Fibonacci search
was  first  published.   Fibonacci  search   has  an  average-  and  worst-case
complexity of O(log n).


Fibonacci Heap Data Structure
-----------------------------

In computer  science, a Fibonacci heap  is a data structure  for priority queue
operations, consisting of a collection of  heap-ordered trees.  It has a better
amortized running time than many other priority queue data structures including
the binary  heap and binomial heap.   Michael L.  Fredman and  Robert E. Tarjan
developed Fibonacci heaps in 1984 and published them in a scientific journal in
1987.  Fibonacci heaps are named after the Fibonacci numbers, which are used in
their running time analysis.

Fibonacci Cubes
---------------

The Fibonacci  cubes or Fibonacci  networks are  a family of  undirected graphs
with   rich  recursive   properties   derived  from   its   origin  in   number
theory. Mathematically  they are similar  to the  hypercube graphs, but  with a
Fibonacci number of vertices.