(*
   functors.ml
   ====================================================
   CREATED: 2018-05-25
   UPDATED: 2018-05-26
   VERSION: 1.1.1
   AUTHOR: wlharvey4
   ABOUT: Playing with functors in the Code_Challenge_Intl arena
   NOTES: Yojson => https://mjambon.github.io/mjambon2016/yojson
	  Yojson docs => https://mjambon.github.io/mjambon2016/yojson-doc/Yojson.html
	  Yojson.Basic=> https://mjambon.github.io/mjambon2016/yojson-doc/Yojson.Basic.html
	  Yojson.Basic.Util => https://mjambon.github.io/mjambon2016/yojson-doc/Yojson.Basic.Util.html
   	           ^  This module provides combinators for extracting fields from JSON values
	  Yojson.Safe => https://mjambon.github.io/mjambon2016/yojson-doc/Yojson.Safe.html
   COMPILATION: 
     corebuild code_challenges.native -package yojson
   ----------------------------------------------------
*)

module type CODECHALL =
sig
  type in_t
  type out_t
  type params_t
  val fn : params_t -> out_t
  val print_fn : params_t -> unit
  val equal : out_t -> out_t -> bool
  val j_to_p : Yojson.Basic.json -> params_t
  val j_to_e : Yojson.Basic.json -> out_t
end

module type FIZZBUZZ =
sig
  type in_t = int
  type out_t
  type params_t = {n: in_t}
  val fn : params_t -> out_t
  val print_fn : params_t -> unit
  val equal : out_t -> out_t -> bool
  val j_to_p : Yojson.Basic.json -> params_t
  val j_to_e : Yojson.Basic.json -> out_t
  val fizzbuzz : params_t -> out_t
end

module Fizzbuzz : FIZZBUZZ =
struct

  type in_t = int
  type out_t = 
    | Num of int
    | Fizz
    | Buzz
    | Fizzbuzz
  type params_t = {n: in_t}

  (* The Fizzbuzz Code Challenge *)
  let fizzbuzz {n} =
    let fizz = match (n mod 3) with 0 -> true | _ -> false in
    let buzz = match (n mod 5) with 0 -> true | _ -> false in
    match (fizz, buzz) with
    | (true, true)  -> Fizzbuzz
    | (true, false) -> Fizz
    | (false, true) -> Buzz
    | (false,false) -> Num(n)

  let print_fn {n} =
    let result = fizzbuzz {n} in
    print_endline((string_of_int n) ^ " -> " ^
    match result with
      | Num n -> string_of_int n
      | Fizz -> "Fizz"
      | Buzz -> "Buzz"
      | Fizzbuzz -> "Fizzbuzz")

  let fn = fizzbuzz

  (* TODO: This is not a deep equals *)
  let equal result expected = result = expected

  (* convert JSON params value into Fizzbuzz params_t value *)
  let j_to_p j = {n = (Yojson.Basic.Util.to_int(Yojson.Basic.Util.member "n" j))}

  (* convert JSON out value to Fizzbuzz out_t value *)
  let j_to_e j =
    match j with
    | `String s -> (
        match s with
        | "fizzbuzz" -> Fizzbuzz
        | "fizz" -> Fizz
        | "buzz" -> Buzz
        | _ -> invalid_arg "Should not be here"
      )
    | `Int n -> Num n
    | _ -> invalid_arg "Should not be here"
end

module type ISUNIQUE =
sig
  type in_t = string
  type out_t
  type params_t = {str: in_t}
  val fn : params_t -> out_t
  val print_fn : params_t -> unit
  val equal : out_t -> out_t -> bool
  val j_to_p : Yojson.Basic.json -> params_t
  val j_to_e : Yojson.Basic.json -> out_t
  val isUnique : params_t -> out_t
end

module IsUnique : ISUNIQUE =
struct

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

  let print_fn {str} =
    let result = isUnique {str} in
    print_endline (str ^ " -> " ^ string_of_bool result)

  let fn = isUnique

  let j_to_p j = {str = Yojson.Basic.Util.to_string(Yojson.Basic.Util.member "str" j)}
  let j_to_e j = Yojson.Basic.Util.to_bool j
end

module CodeChall = functor(CC : CODECHALL) ->
struct
  type params_t = CC.params_t
  let fn = CC.fn
  let print_fn = CC.print_fn
  let equal = CC.equal
  let j_to_p = CC.j_to_p
  let j_to_e = CC.j_to_e
end

module CC = CodeChall(Fizzbuzz)
(* module CC = CodeChall(IsUnique) *)

module type CHECK =
sig
  val check : unit -> unit
end

module Check : CHECK=
struct

  (* code challenge name as given on the command-line *)                    
  let cc = try
      Array.get Sys.argv 1
    with
    | Invalid_argument _ -> failwith "You must supply a cc name on the command-line: "
    | e -> raise e

  (* capitalized code challenge name *)
  (* let cC = String.capitalize_ascii cc *)

  let ccDir = Filename.concat (Core.Filename.realpath Core.Filename.parent_dir_name) cc

  (* OCaml list of JSON data objects *)
  let ccJson =
    let ccJsonFile = Filename.concat ccDir (cc ^ ".json") in
    Yojson.Basic.Util.to_list(Yojson.Basic.from_file ccJsonFile)

  let check json =
    let () = print_endline("==> " ^ Yojson.Basic.to_string json) in
    let params = CC.j_to_p(Yojson.Basic.Util.member "params" json) in
    let expected = CC.j_to_e(Yojson.Basic.Util.member "expected" json) in
    let result = CC.equal (CC.fn params) expected in
    let () = print_endline("Result: " ^ string_of_bool result) in
    CC.print_fn params

  let rec checkList jsonl =
    match jsonl with
    | [] -> exit 0
    | json :: json' -> check json; checkList json'

   let check () = checkList ccJson

end

let () = Check.check()
