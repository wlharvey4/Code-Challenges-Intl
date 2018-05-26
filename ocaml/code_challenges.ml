(*
   functors.ml
   ====================================================
   CREATED: 2018-05-25
   UPDATED: 2018-05-26
   VERSION: 1.0.4
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
  val j_to_p : Yojson.Basic.json -> params_t
end

module type FIZZBUZZ =
sig
  type in_t = int
  type out_t
  type params_t = {n: in_t}
  val fizzbuzz : params_t -> out_t
  val fn : params_t -> out_t
  val print_fn : params_t -> unit
  val j_to_p : Yojson.Basic.json -> params_t
end

module Fizzbuzz : FIZZBUZZ =
struct
  type fizzbuzz =
    | Num of int
    | Fizz
    | Buzz
    | Fizzbuzz
  type in_t = int
  type out_t = fizzbuzz
  type params_t = {n: in_t}
  let toParams n = {n}
  let fizzbuzz {n} =
    let fizz = match (n mod 3) with 0 -> true | _ -> false in
    let buzz = match (n mod 5) with 0 -> true | _ -> false in
    match (fizz, buzz) with
    | (true, true)  -> Fizzbuzz
    | (true, false) -> Fizz
    | (false, true) -> Buzz
    | _ -> Num(n)
  let print_fn {n} =
    let result = fizzbuzz {n} in
    print_endline((string_of_int n) ^ " -> " ^
    match result with
      | Num n -> string_of_int n
      | Fizz -> "Fizz"
      | Buzz -> "Buzz"
      | Fizzbuzz -> "Fizzbuzz")
  let fn = fizzbuzz
  (* given JSON params, convert to Fizzbuzz params_t *)
  let j_to_p j =
    let n = Yojson.Basic.Util.to_int(Yojson.Basic.Util.member "n" j) in
    toParams n
end

module type ISUNIQUE =
sig
  type in_t = string
  type out_t
  type params_t = {str: in_t}
  val isUnique : params_t -> out_t
  val fn : params_t -> out_t
  val print_fn : params_t -> unit
  val j_to_p : Yojson.Basic.json -> params_t
end

module IsUnique : ISUNIQUE =
struct
  type in_t = string
  type out_t = bool
  type params_t = {str: in_t}
  let toParams str = {str}
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
  let print_fn {str} =
    let result = isUnique {str} in
    print_endline (str ^ " -> " ^ string_of_bool result)
  let fn = isUnique
  let j_to_p j =
    let str = Yojson.Basic.Util.to_string(Yojson.Basic.Util.member "str" j) in
    toParams str
end

module CodeChallenge = functor (CodeChall : CODECHALL) ->
  struct
    let fn input = CodeChall.fn input
    let print_fn input = CodeChall.print_fn input
  end

module Fn1 = CodeChallenge(Fizzbuzz)
module Fn2 = CodeChallenge(IsUnique)

let () = Fn1.print_fn {n = 3}
let () = Fn1.print_fn {n = 5}
let () = Fn1.print_fn {n = 15}
let () = Fn1.print_fn {n = 1}
let () = Fn2.print_fn {str = "a"}
let () = Fn2.print_fn {str = "abc"}
let () = Fn2.print_fn {str = "abca"}
let () = Fn2.print_fn {str = "aa"}

module type CCJSON =
sig
  type dir
  type ccRecord_t
  type ccFullRecord_t = {params: ccRecord_t; expected: ccRecord_t}
  type ccJson_t = Yojson.Basic.json
  val rootDir : dir
  val jsonDir : dir
  val ccDir : dir
  val ccJson : ccJson_t
  val ccFullRecord : ccFullRecord_t
  val getParams : ccFullRecord_t -> ccRecord_t
  val getExpected : ccFullRecord_t -> ccRecord_t
end

module Check =
struct

  (* cc := code challenge as given on the command-line *)                    
  let cc = try
      Array.get Sys.argv 1
    with
    | Invalid_argument _ -> failwith "You must supply a cc name on the command-line: "
    | e -> raise e

  (* cC := capitalized name of the code challenge *)
  let cC = String.capitalize_ascii cc

  let ccDir = Filename.concat (Core.Filename.realpath Core.Filename.parent_dir_name) cc

  let ccJson =
    let ccJsonFile = Filename.concat ccDir (cc ^ ".json") in
    Yojson.Basic.Util.to_list(Yojson.Basic.from_file ccJsonFile)

  let check json print_fn j_to_p =
    let () = print_endline("==> " ^ Yojson.Basic.to_string json) in
    let params = Yojson.Basic.Util.member "params" json in
    print_fn (j_to_p params)

  let rec checkList jsonl print_fn j_to_p =
    match jsonl with
    | [] -> exit 0
    | json :: jsonl' -> check json print_fn j_to_p; checkList jsonl' print_fn j_to_p

  module CodeChall = functor(CC : CODECHALL) ->
  struct
    type params_t = CC.params_t
    let fn = CC.fn
    let print_fn = CC.print_fn
    let j_to_p = CC.j_to_p
    let expect params expected = (fn params = expected)
    let doCheck () = checkList ccJson print_fn j_to_p
  end

  module CC = CodeChall(Fizzbuzz)

end
