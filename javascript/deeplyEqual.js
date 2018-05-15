/**
   deeplyEqual.js
   ====================================================
   CREATED: 2018-05-14
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: checks whether two data structures are deeply
          equal
   NOTES: 
   ----------------------------------------------------
 */

const OBJECT = 'object';
const ARRAY = 'array';
const NUMBER = 'number';
const STRING = 'string';
const BOOLEAN = 'boolean';
const NULL = 'null';
const UNDEFINED = 'undefined';

const deeplyEqual = (obj1, obj2) => {
  if (typeof obj1 !== typeof obj2) return false;
  switch (typeof obj1) {
    case OBJECT:
      if (!obj1) return true;
      if (Array.isArray(obj1) && Array.isArray(obj2)) {
	if (obj1.length !== obj2.length) return false;
	return obj1.reduce((acc, elem, index) => acc && deeplyEqual(elem, obj2[index]), true);
      } else {
	if (obj2 === null) return false;
	const allKeys1 = Object.keys(obj1);
	const allKeys2 = Object.keys(obj2);
	if (allKeys1.length !== allKeys2.length) return false;
	return allKeys1.reduce((acc, key, index) => {
	  if (key !== allKeys2[index]) return false;
	  return (acc && deeplyEqual(obj1[key], obj2[allKeys2[index]]))
	}, true)
      }
    case UNDEFINED:
      return true;
    case NUMBER:
    case STRING:
    case BOOLEAN:
      return obj1 === obj2;
    default:
      throw new Error(`ERROR in deeply equal: what kind of thing is ${obj1}?`);
  }
}

module.exports = deeplyEqual;
