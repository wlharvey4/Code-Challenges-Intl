#! /usr/bin/env node

/**
   check.js
   ====================================================
   CREATED: 2018-05-14
   UPDATED: 2018-05-22
   VERSION: 0.3.0
   AUTHOR:  wlharvey4
   ABOUT:   Test script for JavaScript code challenges.
   USAGE:   ./check <code-challenge>
   NOTES:
   ----------------------------------------------------
 */

const assert = require('assert').strict;
const fs = require('fs');
const path = require('path');

const OK = 'ok';
const FAILED = 'failed';

// get the Code Challenge name from the command-line argument
let cc;
try {
  cc = process.argv[2];
  if (!cc) throw new Error("ERROR: Need a code challenge name");
} catch(e) {
  console.error(e.message);
  console.log('USAGE: ./check <code-challenge>');
  process.exit(0);
}

// construct paths to resources
const ROOT_PATH = path.format({ // absolute path to root directory
  root: path.dirname(path.dirname(module.filename))
});
const ccDir = path.format({
  dir: ROOT_PATH,
  name: cc
});
const ccJson = path.format({ // path to JSON data
  dir: ccDir,
  name: cc,
  ext: '.json'
});

// load and parse the test data into a JS object
const json = JSON.parse(fs.readFileSync(ccJson, {encoding: 'utf-8'}));

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
results = json.reduce((results, datum) => {
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
