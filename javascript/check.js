/**
   check.js
   ====================================================
   CREATED: 2018-05-14
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Test program for JavaScript challenges.
   USAGE: node check.js <cc>
   NOTES:
   ----------------------------------------------------
 */

const fs = require('fs');
const deeplyEqual = require('./deeplyEqual');

const cc = process.argv[2];

const OK = 'ok';
const FAILED = 'failed';
const JSON = '.json';
const JS = '.js';

const reportFailed = (allParams, result, expected) => {
  console.error(`allParams: ${allParams}\nresult: ${result}\nexected: ${expected}\n`);
}

/* cc := Code Challenge as a String, i.e. 'fizzbuzz' */
/* type := '.json' | '.js' */
const load = (cc, type) => {
  try {
    const contents = fs.readdirSync(cc);
    const ccFile = contents.find(file => file.match(cc + type));
    return fs.readFileSync(ccFile[0]);
  } catch(err) {
    console.error('ERROR attempting to load JSON: ', err);
  }
}

const processDatum = (datum, fn) => {
  let allParams;
  const { params, expected } = datum;
  if (typeof params === 'object' && !Array.isArray(params)) {
    allParams = Object.values(params);
  } else {
    allParams = params;
  }
  const result = fn.apply(null, allParams);
  if (deepEqual(result, expected)) return OK;
  reportedFailed(allParams, result, expected);
  return FAILED;
}

const processDataJSON = (dataJSON, fn) => {
  return dataJSON.reduce((results, datum) => {
    const result = processDatum(datum, fn);
    switch (result) {
      case OK: results.ok++;
      case FAILED: results.failed++;
    }
  }, {ok: 0, failed: 0});
  
}

try {
  const dataJSON = (cc, JSON) => load(cc, JSON);
  const fn = (cc, JS) => load(cc, JS);
  return processDataJSON(dataJSON, fn);
} catch(err) {
  console.error(err);
}
