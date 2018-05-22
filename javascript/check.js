#! /usr/bin/env node

/**
   check.js
   ====================================================
   CREATED: 2018-05-14
   UPDATED: 2018-05-21
   VERSION: 0.3.0
   AUTHOR:  wlharvey4
   ABOUT:   Test script for JavaScript code challenges.
   USAGE:   ./check <code-challenge>
   NOTES:
   ----------------------------------------------------
 */

const assert = require('assert').strict;
const fs = require('fs');

const OK = 'ok';
const FAILED = 'failed';
const _JSON = '.json';
const _JS = '.js';

// Find absolute path to root directory irrespective of path from which executable is called
const BASE = 'Code-Challenges-Intl';
const re = new RegExp(BASE);
const EXEC_PATH = fs.realpathSync('.') // path from which executable is called
EXEC_PATH.search(re);
const ROOT_PATH = RegExp.leftContext + BASE;

const assertError = (params, result, expected) => {
    console.error('----------------------------------------------------');
    console.error('Params:  ', params);
    console.error('Expected:', expected);
    console.error('Received:', result);
    console.error('----------------------------------------------------\n');
}

const report = results => {
  console.log(`Attempted:\t${results.ok + results.failed}\nOk:\t\t${results.ok}\nFailed:\t\t${results.failed}\n`);
}

const load = (cc, type) => {
  try {
    const ccDir = ROOT_PATH + '/' + cc;
    let ccFile;
    switch (type) {
    case _JSON:
      ccFile = ccDir + '/' + cc + type;
      return fs.readFileSync(ccFile, {encoding: 'utf-8'});
    case _JS:
      ccFile = ccDir + '/javascript/' + cc + type;
      return ccFile;
    default:
      throw new Error(`LOAD ERROR: cc: ${cc}\ttype: ${type}`);
    }
  } catch(err) {
    console.error(`ERROR attempting to load ${type}: `, err);
  }
}

const processDatum = (datum, fn) => {
  const result = fn(datum.params);
  try {
    assert.deepStrictEqual(result, datum.expected);
  } catch(e) {
    assertError(datum.params, result, datum.expected);
    return FAILED;
  }
  return OK;
}

const processDataJSON = (dataJSON, fn) => {
  return dataJSON.reduce((results, datum) => {
    const result = processDatum(datum, fn);
    results[result]++;
    return results;
  }, {ok: 0, failed: 0})
}

const check = () => {
  const cc = process.argv[2];
  const fn = require(load(cc, _JS));
  let dataJSON = JSON.parse(load(cc, _JSON));
  return processDataJSON(dataJSON, fn);
}

const results = check();
report(results);

module.exports = check;
