type env = t list
and clos =
    Clos of {term : Syntax.t; env : env}
  | ConstClos of t
and clos2 = Clos2 of {term : Syntax.t; env : env}
and t =
  | Lam of clos
  | Neutral of {tp : t; term : ne}
  | Nat
  | Zero
  | Suc of t
  | Pi of t * clos
  | Sig of t * clos
  | Pair of t * t
  | Uni of Syntax.uni_level
and ne =
  | Var of int (* DeBruijn levels for variables *)
  | Ap of ne * nf
  | Fst of ne
  | Snd of ne
  | NRec of clos * t * clos2 * ne
and nf =
  | Normal of {tp : t; term : t}

val mk_var : t -> int -> t

val to_sexp : t -> Sexplib.Sexp.t
val to_sexp_nf : nf -> Sexplib.Sexp.t
val to_sexp_ne : ne -> Sexplib.Sexp.t

val pp : t -> string
val pp_nf : nf -> string
val pp_ne : ne -> string
