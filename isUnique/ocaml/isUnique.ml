(*
   isUnique/ocaml/isUnique.ml
   ====================================================
   CREATED: 2018-05-27
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: IsUnique code challenge in OCaml
   NOTES:
   ----------------------------------------------------
*)

type in_t = string
type out_t = bool
type params_t = {str: in_t}
type string_of_params = params_t -> string
type string_of_out = out_t -> string

(* The IsUnique Code Challenge *)
let isUnique {str} =
  let rec eval i =
    try
      let c = String.get str i in
      let f = String.contains_from str (i+1) c in
      match f with
      | true -> false
      | false -> eval (i + 1)
    with 
    | Invalid_argument _ -> true
    | e -> raise e
  in eval 0

let fn = isUnique

let equal result expected = result = expected

let j_to_p j = {str = Yojson.Basic.Util.to_string(Yojson.Basic.Util.member "str" j)}
let j_to_e j = Yojson.Basic.Util.to_bool j

let string_of_params p = "{str: " ^ p.str ^ "}"
let string_of_out o = string_of_bool o
