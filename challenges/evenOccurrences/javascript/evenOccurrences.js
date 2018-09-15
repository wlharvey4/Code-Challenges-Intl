/**
   challenges/evenOccurrences/javascript/evenOccurrences.js
   ============================================================
   CREATED: 2018-09-15
   UPDATED:
   VERSION: 1.0.0
   ABOUT: Find the first item that occurs an even number of
          times in an array.  Remember to handle multiple
          even-occurance items and return the first one.
          Return null if there are no even-occurance items.
   NOTES: 
   CHANGE-LOG:
   --version 0.0.1 2018-09-15
     + Initial commit
   ============================================================
 */

const evenOccurrences = ({arr}) => {
  const ans = arr.reduce((acc, v) => {
    if (acc.b.has(v)) {
      acc.c[acc.a.findIndex(x => x === v)]++;
    } else {
      acc.a.push(v);
      acc.b.add(v);
      acc.c.push(1);
    }
    return acc;
  },{a:[], b:new Set(), c:[]});
  return arr[ans.c.findIndex(x => !(x%2))];
}

module.exports = evenOccurrences;
