const {
    permutation,
    combination,
    multiCombination,
    multiPermutation,
} = require("./cases"); 
// import only needed functions

const n = 8;
const r = 3;
console.log(`n = ${n}, r = ${r}`);
console.log(`Permutation: ${permutation(n, r)}`);
console.log(`Combination: ${combination(n, r)}`);
console.log(`Multi Permutation: ${multiPermutation(n, r)}`);
console.log(`Multi Combination: ${multiCombination(n, r)}`);
