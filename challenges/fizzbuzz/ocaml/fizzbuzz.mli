(*
   fizzbuzz/ocaml/fizzbuzz.mli
   ====================================================
   CREATED: 2018-05-28
   VERSION 0.1.0
   AUTHOR: wlharvye4
   ABOUT: Interface for Fizzbuzz code challenge in OCaml
   NOTES:
   ----------------------------------------------------
*)

type in_t = int
type out_t
type params_t
val fn : params_t -> out_t
val equal : out_t -> out_t -> bool
val j_to_p : Yojson.Basic.json -> params_t
val j_to_e : Yojson.Basic.json -> out_t
val string_of_params : params_t -> string
val string_of_out : out_t -> string
val fizzbuzz : params_t -> out_t
