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
Learn Every Language
https://blog.bradfieldcs.com/in-2017-learn-every-language-59b11f68eee
