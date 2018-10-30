## nbe-for-mltt

An implementation of Normalization by Evaluation for Martin-Löf Type Theory with dependent products
(pi), dependent sums (sigma), natural numbers, and a cumulative hierarchy. This implementation
correctly handles eta for both pi and sigma.

This implementation has also been extended to include a type checker based on Coquand's semantic
type checker. In order to interact with the normalizer, therefore, one can write a file containing a
list of definitions and commands to normalize various terms.

For example:

```
let plus : Nat -> Nat -> Nat =
  fun m ->
  fun n ->
  rec n at x -> Nat with
  | zero -> m
  | suc _, p -> suc p

let fib : Nat -> Nat =
  fun n ->
  let worker : Nat * Nat =
    rec n at _ -> Nat * Nat with
    | zero -> <1, 0>
    | suc _, p -> <plus (fst p) (snd p), fst p> in
  snd worker

normalize fib 25 at Nat
```

A list of other examples may be found in `test/`.

The algorithm for normalization is heavily based on the description provided in "Normalization by
Evaluation Dependent Types and Impredicativity" by Andreas Abel. The type checker is loosely based
on "lA simple type-theoretic language: Mini-TT" by Thierry Coquand, Yoshiki Kinoshita, Bengt
Nordström, and Makoto Takeyama.

Once built, the executable `mltt` may be used to normalize programs.  Simply feed it a file
containing two sexprs, a term and a type.

An explanation of the algorithm may be found in `nbe-explanation.md`. An explanation of the type
checker may be found (eventually) in `check-explanation.md`.
