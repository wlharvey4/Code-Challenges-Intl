/**
   check-data.js
   ================================================================
   CREATED:	2018-05-11
   VERSION:	1.0
   AUTHOR:	pinecone
   ABOUT:	Testing module for code challenges
   USAGE:	checkData(data, fn)  where 'data' is an  array of objects of the form {in: in-value, out: out-value}, and 'fn' is a
          function with which to apply  each datum.in value and and
          check against the datum.out value.
   NOTES:
   ----------------------------------------------------------------
 */

const GREEN = process.env.F_GREEN;
const RED = process.env.F_RED;
const YELLOW = process.env.F_YELLOW;
const BLUE = process.env.F_BLUE;
const BLACK = process.env.F_BLACK;
const CYAN = process.env.B_CYAN;
const B_C = BLACK + CYAN;
const CLEAR = process.env.CLEAR;

exports.checkData = (data, fn) => {
  let passed = 0,
      tried = 0;

  data.forEach((datum, n) => {
    tried++;

    try {
      const result = fn(datum.in);

      if (result !== datum.out) {
	console.error(
	  ` \
${YELLOW}[${n}]${CLEAR} \
${B_C}value ${CLEAR}  ${GREEN}${datum.in}${CLEAR}\t \
${B_C}received ${CLEAR}  ${RED}${result}${CLEAR}\t \
${B_C}expected ${CLEAR}  ${BLUE}${datum.out}${CLEAR}`)
      } else {
	passed++;
      }
    } catch(e) {
      console.error(`[${n}] In: ${datum.in}\texpected: ${datum.out}\treceived error: ${e}`);
    }
  })

  console.error(`\n${BLUE}Tried:\t${tried}\n${GREEN}Passed:\t${passed}\n${RED}Failed:\t${tried - passed}${CLEAR}`);
}
