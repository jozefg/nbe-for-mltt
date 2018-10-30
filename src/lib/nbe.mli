exception Nbe_failed of string

(* Main functions for doing a full normalization *)
val normalize : env:Syntax.env -> term:Syntax.t -> tp:Syntax.t -> Syntax.t

(* Evaluate a syntactic term into a semantic value *)
val eval : Syntax.t -> Domain.env -> Domain.t

(* Quote back a type *)
val read_back_nf : int -> Domain.nf -> Syntax.t

(* Check whether a semantic type is a subtype of another *)
val check_subtype : int -> Domain.t -> Domain.t -> bool

(* Functions to manipulate elements of the semantic domain *)
val do_clos : Domain.clos -> Domain.t -> Domain.t
val do_clos2 : Domain.clos2 -> Domain.t -> Domain.t -> Domain.t
val do_ap : Domain.t -> Domain.t -> Domain.t
