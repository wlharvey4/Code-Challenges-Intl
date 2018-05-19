# Code-Challenges-Intl
Code Challenges in many different languages, with tests

## Objective
Learn the intricacies of several different languages by solving the same code challenges in the different languages.  

## Framework
This library allows one to create one JSON file with input arguments and expected output values for any given challenge (regardless of language implementation), and then, using a custom-built test runner, to check the implementation of a challenge solution quickly using this JSON file.

### How to Use the Framework
1. First, create a directory in the root folder named for the code challenge you are currently working on.  For example, if you want to work on a code challenge called `fizzbuzz`, then you would create the following directory structure:

    `Code_Challenges-Intl/fizzbuzz`
    
2. Second, create a JSON file in this directory that contains input arguments and expected results from these arguments; the outer structure of the JSON file is an array, with each array entry being an object of the form: `{"params": {"param1": value1, "param2": value2, ..., "param_n": value_n}, "expected": value}`.  For example, for the code challenge `fizzbuzz`, you would create something like the following JSON file:

    `[{"params": {"n": 1}, "expected": 1}, {"params": {"n": 2}, "expected": 2}, {"params": {"n": 3}, "expected": "fizz"}]`

    The `params` argument should be an object which the code challenge will accept and use in its implementation.

3. Third, create folders inside this code challenge folder named after the languages, i.e., `javascript`, `ocaml`, `python`, `ruby`, `perl`, etc.
4. Fourth, create your implementation of the code challenge in each of the languages, inside of their respective folders.  Export the function as appropriate for the language.
5. Fifth, go inside a language folder from the root directory, where you will find a test runner.  To test your implementation, execute the test runner, giving it the name of the code challenge (which must be the same name as your folder from step 1 above).  For example, for JavaScript, you would be in the directory: `Code-Challenges-Intl/javascript` and you would execute `./check fizzbuzz` or `./check isUnique`.  The program `check` will report failed tests, and final statistics.
