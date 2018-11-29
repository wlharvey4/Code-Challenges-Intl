# Code-Challenges-Intl
Code Challenges in many different languages, with tests

## Objective
The objective of this project is to make it easy to solve a variety of
code challenges in multiple languages by utilizing a single JSON data
structure to hold test input and expected output values and to quickly
and easily test your implementation against the data by making a
simple command-line call.

## Framework
This project has two main directories: `languages` and `challenges`.
Inside the `languages` directory are multiple sub-directories named
for the languages that you want to learn, such as `javascript`,
`python`, etc.  Inside the `challenges` directory are multiple
sub-directories named for the code challenges that you are
implementing, such as `fizzbuzz` and `isUnique`.  Inside each of these
code challenge sub-directories are language sub-directories, inside of
which are the implementations of the challenge in the respective
languages.  So, for a Javascript implementation of `fizzbuzz`, the
directory structory will look like this:

    Code-Challenges-Intl/challenges/fizzbuzz/javascript/fizzbuzz.js

and for Python, the directory structure will look like this:

    Code-Challenges-Intl/challenges/fizzbuzz/python/fizzbuzz.py

### How to Use the Framework
1. First, create a sub-directory in the `challenges` sub-directory
named for the code challenge you are currently working on.  For
example, if you want to work on a code challenge called `fizzbuzz`,
then you would create the following directory structure:

    Code-Challenges-Intl/challenges/fizzbuzz
    
2. Second, create a JSON file in this directory that contains input
arguments and expected results from these arguments; the main
structure of the JSON file is an array, with each array entry being an
object of the form: `{"params": {"param1": value1, "param2": value2,
..., "param_n": value_n}, "expected": value}`.  For example, for the
code challenge `fizzbuzz`, you would create something like the
following JSON file:

    ```
    [
      {"params": {"n": 1}, "expected": 1},
      {"params": {"n": 2}, "expected": 2},
      {"params": {"n": 3}, "expected": "fizz"}
    ]
    ```

The `params` argument should be an object which the code challenge
will accept and use in its implementation.

3. Third, create folders inside this code challenge folder named after
the languages you will be implementing solutions in, i.e.,
`javascript`, `ocaml`, `python`, `ruby`, `perl`, etc, i.e.,

    Code-Challenges-Intl/challenges/fizzbuzz/javascript

4. Fourth, create your implementation of the code challenge in each of
the languages sub-directory, inside of their respective folders.
Export the function as appropriate for the language.

5. Fifth, go inside a language folder from the root directory, e.g.,
`Code-Challenges-Intl/languages/javascript`, where you will find a
test runner, e.g.,
`Code-Challenges-Intl/languages/javascript/check.js`.  If a test
runner has not yet been created, then you will need to create one, or
send a request for one to be made.  To test your implementation,
execute the test runner from the command line, giving it the name of
the code challenge (which must be the same name as your folder from
step 1 above).  For example, for JavaScript, being in the above
directory, you would execute `./check fizzbuzz` or `./check isUnique`.
For Perl, you would be in the directory `Code-Challenges-Intl/languages/perl`,
and you would execute `./check fizzbuzz` or `./check isUnique`.  The
program `check` will report failed tests, and final statistics for
every language.

## Interesting Articles
* [Learn Every Language](https://blog.bradfieldcs.com/in-2017-learn-every-language-59b11f68eee)

* [Why logic puzzles make good interview questions](https://imranontech.com/2007/01/10/why-logic-puzzles-make-good-interview-questions/)

* [Dave Thomas Interview: The Corruption of Agile; Ruby and Elixir; Katas and More](http://www.drdobbs.com/architecture-and-design/dave-thomas-interview-the-corruption-of/240166688)

> Katas

> AB: You are the person who invented code katas, small self-contained programming exercises that refine a pattern of behaviors.

> DT: Yes. The initial idea behind the kata was to discuss something I do all the time. I like coding and I like to experiment with code, so typically I'll take some algorithm and try coding it in different ways: different languages, different techniques, or anything that will give me different insights. And as programmers, we rely on tacit knowledge. Alfred North Whitehead said, "Civilization advances by extending the number of important operations which we can perform without thinking of them." And katas are ways of forcing your brain to internalize patterns of experience, to associate stimuli and response.

* [Hacking Passion, by Katrina Owen (creator of _exercism_)](http://www.kytrinyx.com/talks/hacking-passion/)

> Practice is a strange beast.  It's not play.  It's not intended to be fun.  It's also not work.
  It's not intended to produce anything.  Practice is a thing entirely unto itself....  For
  practice to be truly effective, it should be focused and deliberate.  The most basic form of
  practice is the drill.  A good drill boils down to three elements: focus, repetition, and
  continuous feedback.  A drill takes an activity and warps it until you are focusing on a narrow
  slice of that skill in a way that is repeatable, and provides immediate and continuous feedback.

> Practice doesn't make perfect, it makes permanent.  So: choose one thing that you can kind of
  almost do.  Deliberately warp it to focus on a specific aspect of that skill, make it repeatable
  so you can do it over and over and over, and then make the feedback loop as short as
  possible.  Then go do it.

> I had come to accept that talent is not boolean.  It's *not* some innate genetic trait that you
  have to go look for and may or may not find.  The truth is: talent is bullshit.  Skill can be
  developed systematically.  A SYSTEM is *awesome*.  A system, you can understand.  A system you can
  HACK.  The technical term for levelling up is called skill acquisition.

> A couple of researchers, a pair of brothers by the name of Dreyfus, created a model of how skill
  development works. The scale goes like this:

* Novice: where you know nothing
* Advanced beginner: where you still suck, but you start seeing what this might be about
* Competent: where you can start getting shit done
* Proficient: where you get shit done really well
* Expert: where the shit you get done seems like magic to pretty much everyone else.

> Skill grows by focusing intently on the things that stretch you.  Passion grows by giving
  something your full attention long enough to gain depth and understand nuances.  Talent is
  bullshit.  Skill is cultivated.  Passion is curated.

* [Learn Programming Language from Diving into Source Code](http://stardiviner.github.io/Blog/Learn-Programming-Language-from-Diving-into-Source-Code.html)

## Resources
* [Programming Interviews Exposed: Secrets to Landing Your Next Job
  by by John Mongan (Author), Noah Kindler (Author)](https://www.amazon.com/Programming-Interviews-Exposed-Secrets-Landing/dp/0471383562)

* [Project Euler](https://projecteuler.net)

* [CodeKata](http://codekata.com/)

* [Exercism](http://www.kytrinyx.com/exercism/)

* [Simple Programming Problems](https://adriann.github.io/programming_problems.html)
