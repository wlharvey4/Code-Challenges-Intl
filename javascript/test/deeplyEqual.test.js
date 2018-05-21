/**
   deeplyEqual.test.js
   ====================================================
   CREATED: 2018-05-14
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: tests for 'deeplyEqual.js'
   NOTES: This uses Mocha and NodeJS's assert library
   ----------------------------------------------------
 */

const assert = require('assert').strict;
const deeplyEqual = require('../deeplyEqual');

describe('deeplyEqual', function() {
  describe('Null and undefined values', function() {
    it('should return true for two null values', function() {
      assert.equal(deeplyEqual(null, null), true);
    });
    it('should return true for two undefined values', function() {
      assert.equal(deeplyEqual(undefined, undefined), true);
    });
    it('should return false for one null value, one undefined value', function() {
      assert.equal(deeplyEqual(null, undefined), false);
    });
    it('should return false for one undefined value, one null value', function() {
      assert.equal(deeplyEqual(undefined, null), false);
    });
    it('should return false for one null value, one real value', function() {
      assert.equal(deeplyEqual(null, 0), false);
    });
    it('should return false for one undefined value, one real value', function() {
      assert.equal(deeplyEqual(undefined, 0), false);
    });
    it('should return false for one real value, one null value', function() {
      assert.equal(deeplyEqual(0, null), false);
    });
    it('should return false for one real value, one undefined value', function() {
      assert.equal(deeplyEqual(0, undefined), false);
    });
  });
  describe('Basic values', function() {
    it('should return true for two equal numbers', function() {
      assert.equal(deeplyEqual(1, 1), true);
    });
    it('should return false for two non-equal numnbers', function() {
      assert.equal(deeplyEqual(1, 2), false);
    });
    it('should return true for two zeros', function() {
      assert.equal(deeplyEqual(0, 0), true);
    });
    it('should return false for one number, one object', function() {
      assert.equal(deeplyEqual(1, {}), false);
    });
    it('should return true for two equal strings', function() {
      assert.equal(deeplyEqual('abc', 'abc'), true);
    });
    it('should return false for one string, one number', function() {
      assert.equal(deeplyEqual('abc', 1), false);
    });
    it('should return false for one number, one string', function() {
      assert.equal(deeplyEqual(1, 'abc'), false);
    });
    it('should return true for two equal booleans', function() {
      assert.equal(deeplyEqual(true, true), true);
    });
    it('should return false for two unequal booleans', function() {
      assert.equal(deeplyEqual(true, false), false);
    });
  });
  describe('Arrays', function() {
    it('should return true for two equal arrays', function() {
      assert.equal(deeplyEqual([1,2,3], [1,2,3]), true);
    });
    it('should return false for two non-equal arrays', function() {
      assert.equal(deeplyEqual([1,2,3], [1,2]), false);
    });
    it('should return false for one array, one value', function() {
      assert.equal(deeplyEqual([1,2,3], 1), false);
    });
  });
  describe('Objects', function() {
    it('should return true for two equal objects', function() {
      assert.equal(deeplyEqual({a: 1, b: 2}, {a: 1, b: 2}), true);
    });
    it('should return false for two non-equal objects', function() {
      assert.equal(deeplyEqual({a: 1, b: 2}, {a: 1, b: 3}), false);
    });
    it('should return false for an object and a value', function() {
      assert.equal(deeplyEqual({a: 1, b: 2}, 1), false);
    });
    it('should return false for an object and an object with a null value', function() {
      assert.equal(deeplyEqual({a: 1}, {b: null}), false);
    });
    it('should return true for deeply nested objects', function() {
      assert.equal(deeplyEqual({a: {b: [1,2,3]}}, {a: {b: [1,2,3]}}), true);
    });
    it('should return false for deeply nested objects-contains a null', function() {
      assert.equal(deeplyEqual({a: {b: [1,2,3]}}, {a: {b: null}}), false);
    });    
    it('should return true for two deeply nested equal objects', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: {c: [4,5,6]}}), true);
    });
    it('should return false for two deeply nested non-equal objects-different array sizes', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: {c: [4,5,6,7]}}), false);
    });
    it('should return false for two deeply nested non-equal objects-different array values', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: {c: [4,5,7]}}), false);
    });
    it('should return false for two deeply nested non-equal objects-different key values', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {d: [1,2,3], b: {c: [4,5,6]}}), false);
    });
    it('should return false for two deeply nested non-equal objects-different object values', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: {c: [4,5,6], d: "abc"}}), false);
    });
    it('should return false for two deeply nested non-equal objects-a null object value', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: null}), false);
    });
    it('should return false for two deeply nested non-equal objects-an undefined object value', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: [4,5,6]}}, {a: [1,2,3], b: undefined}), false);
    });
    it('should return false for two deeply nested objects with null and undefined', function() {
      assert.equal(deeplyEqual({a: [1,2,3], b: {c: null}}, {a: [1,2,3], b: {c: undefined}}), false);
    });
  });
});
