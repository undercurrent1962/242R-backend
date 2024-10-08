const factorialize = n => {
    if (n <= 1) {
        return 1;
    }
    return factorialize(n - 1) * n;
};

const permutation = (n, r) => factorialize(n) / factorialize(n - r);

const combination = (n, r) => factorialize(n) / (factorialize(n - r) * factorialize(r));

const multiPermutation = (n, r) => n ** r;

const multiCombination = (n, r) => combination(n + r - 1, r);

module.exports = {
    factorialize: factorialize,
    permutation: permutation,
    combination: combination,
    multiPermutation: multiPermutation,
    multiCombination: multiCombination,
}