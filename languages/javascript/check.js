#! /usr/bin/env node

/**
   check.js
   ====================================================
   CREATED: 2018-05-14
   UPDATED: 2018-06-06
   VERSION: 1.0.0
   AUTHOR:  wlharvey4
   ABOUT:   Test script for JavaScript code challenges.
   USAGE:   ./check <code-challenge>
   NOTES:
   ----------------------------------------------------
 */

// utility libraries
const assert = require('assert').strict;
const fs     = require('fs');
const path   = require('path');

// constants
const OK = 'ok';
const FAILED = 'failed';
const USAGE  = 'USAGE: ./check <code-challenge>'; 
const CHALLENGES = '/challenges';

let cc;  // the name of the code challenge, from the CL
try {
  cc = process.argv[2];
  if (!cc) throw new Error("ERROR: Need a code challenge name");
} catch(e) {
  console.error(e.message);
  console.log(USAGE);
  process.exit(-1);
}

// construct paths to resources
const challengesDir = path.join (
  /* absolute path to `challenges' directory
     from languages/<language> directory */
  path.format({root: path.dirname(path.dirname(path.dirname(module.filename)))}),
  CHALLENGES
);
// challenges/<code-challenge>/
const ccDir = path.format({
  dir: challengesDir,
  name: cc
});
// JSON file holding test data for code challenge
const ccJSON = path.format({ // path to JSON data
  dir: ccDir,
  name: cc,
  ext: '.json'
});

// load and parse the test data into a JS object
const jsonData = JSON.parse(fs.readFileSync(ccJSON, {encoding: 'utf-8'}));

const ccLangDir = path.format({
  dir: ccDir,
  name: 'javascript'
});
const ccJs = path.format({ // path to code challenge
  dir: ccLangDir,
  name: cc,
  ext: '.js'
});

// the code challenge
const fn = require(ccJs);

const assertError = (params, result, expected) => {
  console.error('----------------------------------------------------');
  console.error('Params:  ', params);
  console.error('Expected:', expected);
  console.error('Received:', result);
  console.error('----------------------------------------------------\n');
}

// the test runner; uses assert.deepStrictEqual
results = jsonData.reduce((results, datum) => {
  const result = fn(datum.params);
  try {
    assert.deepStrictEqual(result, datum.expected);
    results[OK]++;
  } catch(e) {
    assertError(datum.params, result, datum.expected);
    results[FAILED]++;
  }
  return results;
}, {ok: 0, failed: 0})

console.error('====================================================');
console.log(`Attempted:\t${results.ok + results.failed}`);
console.log(`Ok:\t\t${results.ok}`);
console.log(`Failed:\t\t${results.failed}`);
console.log('====================================================');
