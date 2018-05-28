(*
   ocaml/codechall.ml
   ====================================================
   CREATED: 2018-05-28
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: 
   NOTES:
   ----------------------------------------------------
*)


module Codechall :
sig
  type in_t
  type out_t
  type params_t
  val fn : params_t -> out_t
  val print_failed : params_t -> out_t -> out_t -> unit
  val equal : out_t -> out_t -> bool
  val j_to_p : Yojson.Basic.json -> params_t
  val j_to_e : Yojson.Basic.json -> out_t
end
=
functor(CC : Codechall) ->
struct
  type params_t = CC.params_t
  let fn = CC.fn
  let print_failed = CC.print_failed
  let equal = CC.equal
  let j_to_p = CC.j_to_p
  let j_to_e = CC.j_to_e
end

module CC = Codechall(Fizzbuzz)
(* module CC = CodeChall(IsUnique) *)
