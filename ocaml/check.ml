(*
   ocaml/check.ml
   ====================================================
   CREATED: 2018-05-28
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Test runner for OCaml code challenges
   NOTES: 
   COMPILATION: corebuild ocaml/check.native -I fizzbuzz/ocaml -I isUnique/ocaml -package yojson
   ----------------------------------------------------
*)

open Core

module type CODECHALL =
sig
  type in_t
  type out_t
  type params_t
  val fn : params_t -> out_t
  val equal : out_t -> out_t -> bool
  val j_to_p : Yojson.Basic.json -> params_t
  val j_to_e : Yojson.Basic.json -> out_t
  val string_of_params : params_t -> string
  val string_of_out : out_t -> string
end

module Check (CC : CODECHALL) = (* a functor *)
struct

  type dir = string
  (* convert JSON to list of JSON params and expected's *)
  let ccJsonL = Yojson.Basic.Util.to_list (CcDirs.ccJson)
  let params j = CC.j_to_p (Yojson.Basic.Util.member "params" j)
  let expected j = CC.j_to_e (Yojson.Basic.Util.member "expected" j)

  type results = {mutable ok:int; mutable failed:int}
  let results  = {ok=0; failed=0}

  let print_failed params applied expected = 
    begin
      print_endline("Failed expectation");
      print_endline("-----------------------------");
      print_endline(" Params:\t" ^ CC.string_of_params params);
      print_endline(" Result:\t" ^ CC.string_of_out applied);
      print_endline(" Expected:\t" ^ CC.string_of_out expected ^ "\n");
    end

  let print_results () =
    begin
      print_endline("Code Challenge: ");
      print_endline("================================");
      print_endline("Total Tests:\t" ^ string_of_int (results.ok + results.failed));
      print_endline("OK:\t\t" ^ string_of_int results.ok);
      print_endline("Failed:\t\t" ^ string_of_int results.failed ^ "\n");
    end

  let check () =
    begin
      List.iter ccJsonL ~f:(fun j ->
          let params = params j in
          let applied = CC.fn params in
          let expected = expected j in
          let result = CC.equal applied expected in
          if result
          then
            results.ok <- results.ok + 1
          else
            (print_failed params applied expected;
             results.failed <- results.failed + 1;)
        );
      print_results()
    end
end

module FizzBuzzCC = Check(Fizzbuzz)
module IsUniqueCC = Check(IsUnique)

let () = match CcDirs.cC with
  | "Fizzbuzz" -> FizzBuzzCC.check()
  | "IsUnique" -> IsUniqueCC.check()
  | _ -> failwith "Should not be here"
