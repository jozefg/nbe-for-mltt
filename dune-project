(lang dune 3.7)

(using menhir 2.0)

(name mltt)

(authors "Daniel Gratzer")

(maintainers "Daniel Gratzer")

(version 0.0.0)

(generate_opam_files true)

(source
 (github jozefg/nbe-for-mltt))

(license MIT)

(package
 (name mltt)
 (synopsis "An implementation of Martin-Loef type theory")
 (depends
  (menhir
   (>= 20211230))
  (ocaml
   (>= 4.12.0))
  dune
  (sexplib
   (>= 0.16.0))
  (cmdliner
   (>= 1.2.0))))
