(*
   fizzbuzz/ocaml/fizzbuzz.ml
   ====================================================
   CREATED: 2018-05-28
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Fizzbuzz code challenge in OCaml
   NOTES: 
   ----------------------------------------------------
*)

type in_t = int
type out_t = 
  | Num of int
  | Fizz
  | Buzz
  | Fizzbuzz
type params_t = {n: in_t}
(* TODO: provide an expected type, i.e., {e: out_t} 
   This will require a complete refactor of the JSON object
   and the other test runners. *)
type string_of_params = params_t -> string
type string_of_out = out_t -> string

(* The Fizzbuzz Code Challenge *)
let fizzbuzz {n} =
  let fizz = match (n mod 3) with 0 -> true | _ -> false in
  let buzz = match (n mod 5) with 0 -> true | _ -> false in
  match (fizz, buzz) with
  | (true, true)  -> Fizzbuzz
  | (true, false) -> Fizz
  | (false, true) -> Buzz
  | (false,false) -> Num(n)

let print_fizzbuzz fb =
  match fb with
  | Fizzbuzz -> "fizzbuzz"
  | Fizz -> "fizz"
  | Buzz -> "buzz"
  | Num n -> string_of_int n

let fn = fizzbuzz

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

let string_of_params p = "{n: " ^ (string_of_int p.n) ^ "}"
let string_of_out o = print_fizzbuzz o
