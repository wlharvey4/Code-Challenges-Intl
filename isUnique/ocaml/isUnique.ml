(*
   isUnique/ocaml/isUnique.ml
   ====================================================
   CREATED: 2018-05-27
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: IsUnique code challenge in OCaml
   NOTES: Must conform to CODECHALL interface from check.ml
   COMPILATION: ocamlfind ocamlopt -c isUnique.ml -package yojson
   	        ocamlfind ocamlopt -a -o isUnique.cmxa isUnique.cmx -package yojson
   ----------------------------------------------------
*)

type in_t = string
type out_t = bool
type params_t = {str: in_t}

(* IsUnique Code Challenge *)
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

(* TODO: this is not a deep equal *)
let equal result expected = result = expected

let print_failed {str} e r =
  begin
    print_string ("ERROR: str: " ^ str);
    print_string ("\tres: " ^ (string_of_bool r));
    print_endline ("\texp: " ^ (string_of_bool e));
  end

let fn = isUnique

let j_to_p j = {str = Yojson.Basic.Util.to_string(Yojson.Basic.Util.member "str" j)}
let j_to_e j = Yojson.Basic.Util.to_bool j
