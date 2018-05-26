(*
   functors.ml
   ====================================================
   CREATED: 2018-05-25
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Playing with functors in the Code_Challenge_Intl arena
   NOTES: This actually worked!!
   ----------------------------------------------------
*)

module type CODECHALL =
sig
  type in_t
  type out_t
  val fn : in_t -> out_t
  val print_fn : in_t -> unit
end

module type FIZZBUZZ =
sig
  type in_t = int
  type out_t
  val fizzbuzz : in_t -> out_t
  val fn : in_t -> out_t
  val print_fn : in_t -> unit
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
  let fizzbuzz n =
    let fizz = match (n mod 3) with 0 -> true | _ -> false in
    let buzz = match (n mod 5) with 0 -> true | _ -> false in
    match (fizz, buzz) with
    | (true, true)  -> Fizzbuzz
    | (true, false) -> Fizz
    | (false, true) -> Buzz
    | _ -> Num(n)
  let print_fn n =
    let result = fizzbuzz n in
    print_endline((string_of_int n) ^ " -> " ^
    match result with
      | Num n -> string_of_int n
      | Fizz -> "Fizz"
      | Buzz -> "Buzz"
      | Fizzbuzz -> "Fizzbuzz")
  let fn = fizzbuzz
end

module type ISUNIQUE =
sig
  type in_t = string
  type out_t
  val isUnique : in_t -> out_t
  val fn : in_t -> out_t
  val print_fn : in_t -> unit
end

module IsUnique : ISUNIQUE =
struct
  type in_t = string
  type out_t = bool
  let isUnique str =
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
  let print_fn s =
    let result = isUnique s in
    print_endline (s ^ " -> " ^ string_of_bool result)
  let fn = isUnique
end

module CodeChallenge = functor (CodeChall : CODECHALL) ->
  struct
    let fn input = CodeChall.fn input
    let print_fn input = CodeChall.print_fn input
  end

module Fn1 = CodeChallenge(Fizzbuzz)
module Fn2 = CodeChallenge(IsUnique)

let () = Fn1.print_fn 3
let () = Fn1.print_fn 5
let () = Fn1.print_fn 15
let () = Fn1.print_fn 1
let () = Fn2.print_fn "a"
let () = Fn2.print_fn "abc"
let () = Fn2.print_fn "abca"
let () = Fn2.print_fn "aa"
