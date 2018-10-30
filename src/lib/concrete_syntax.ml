type ident = string
type uni_level = int

type binder = Binder of {name : ident; body : t}
and binder2 = Binder2 of {name1 : ident; name2 : ident; body : t}
and t =
  | Var of ident
  | Let of t * binder
  | Check of {term : t; tp : t}
  | Nat
  | Suc of t
  | Lit of int
  | NRec of {mot : binder; zero : t; suc : binder2; nat : t}
  | Pi of t * binder
  | Lam of binder
  | Ap of t * t list
  | Sig of t * binder
  | Pair of t * t
  | Fst of t
  | Snd of t
  | Uni of uni_level

type decl =
    Def of {name : ident; def : t; tp : t}
  | NormalizeDef of ident
  | NormalizeTerm of {term : t; tp : t}
  | Quit

type signature = decl list
