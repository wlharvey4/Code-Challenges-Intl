(*
   ocaml/check.ml
   ====================================================
   CREATED: 2018-05-27
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Test runner for OCaml code challenges
   NOTES:
   COMPILATION: corebuild check.native -I ocaml -I fizzbuzz/ocaml fizzbuzz.cmxa -package yojson
   ----------------------------------------------------
*)

module type CODECHALL =
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

module CodeChall = functor(CC : CODECHALL) ->
struct
  type params_t = CC.params_t
  let fn = CC.fn
  let print_failed = CC.print_failed
  let equal = CC.equal
  let j_to_p = CC.j_to_p
  let j_to_e = CC.j_to_e
end

module CC = CodeChall(Fizzbuzz)
(* module CC = CodeChall(IsUnique) *)

type results_t = {ok: int; failed: int}

(* code challenge name as given on the command-line *)                    
let cc = try
    Array.get Sys.argv 1
  with
  | Invalid_argument _ -> failwith "You must supply a cc name on the command-line: "
  | e -> raise e

(* capitalized code challenge name *)
let cC = String.capitalize_ascii cc

let ccDir = Filename.concat (Core.Filename.realpath Core.Filename.parent_dir_name) cc

(* OCaml list of JSON data objects *)
let ccJson =
  let ccJsonFile = Filename.concat ccDir (cc ^ ".json") in
  Yojson.Basic.Util.to_list(Yojson.Basic.from_file ccJsonFile)

let print_results {ok; failed} =
  let total = ok + failed in
  begin
    print_endline("\nCode Challenge: " ^ cC);
    print_endline("========================");
    print_endline("Total tests:\t" ^ (string_of_int total));
    print_endline("OK:\t\t" ^ (string_of_int ok));
    print_endline("Failed\t\t" ^ (string_of_int failed));
  end

let check json {ok; failed} = (* checks the function; returns an updated returns_t object *)
  (* let () = print_endline("==> " ^ Yojson.Basic.to_string json) in *)
  let params = CC.j_to_p(Yojson.Basic.Util.member "params" json) in
  let expected = CC.j_to_e(Yojson.Basic.Util.member "expected" json) in
  let result = CC.fn params in
  let test_results = CC.equal result expected in
  match test_results with
  | true -> {ok=(ok + 1); failed}
  | false -> (CC.print_failed params expected result); {ok; failed=(failed + 1)}

let rec checkList jsonl results =
  match jsonl with
  | [] -> print_results results; exit 0
  | json :: jsonl' -> checkList jsonl' (check json results)

(* starts the test runner *)
let check () = checkList ccJson {ok= 0; failed=0}

let () = check()
