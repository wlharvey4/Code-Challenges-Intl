(*
   fizzbuzz/ocaml/fizzbuzz.mli
   ====================================================
   CREATED: 2018-05-27
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Interface file for Fizzbuzz code challenge
   NOTES:
   COMPILATION: ocamlfind ocamlc -c fizzbuzz.mli -package yojson
   ----------------------------------------------------
*)

type in_t = int
type out_t
type params_t
val fn : params_t -> out_t
val print_failed : params_t -> out_t -> out_t -> unit
val equal : out_t -> out_t -> bool
val j_to_p : Yojson.Basic.json -> params_t
val j_to_e : Yojson.Basic.json -> out_t
val fizzbuzz : params_t -> out_t
