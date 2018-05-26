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
  val print_result : out_t -> unit
end

module type FIZZBUZZ =
sig
  type in_t = int
  type out_t
  val fizzbuzz : in_t -> out_t
  val fn : in_t -> out_t
  val print_result : out_t -> unit
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
  let print_result r = print_endline(
    match r with
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
  val print_result : out_t -> unit
end

module IsUnique : ISUNIQUE =
struct
  type in_t = string
  type out_t = bool
  let isUnique str =
    match str with
    | "a" -> true
    | "b" -> false
    | _ -> true
  let print_result r = print_endline (string_of_bool r)
  let fn = isUnique
end

module CodeChallenge = functor (CodeChall : CODECHALL) ->
  struct
    let fn input = CodeChall.fn input
    let print_result result = CodeChall.print_result result
  end

module Fn1 = CodeChallenge(Fizzbuzz)
module Fn2 = CodeChallenge(IsUnique)

let () = Fn1.print_result (Fn1.fn 3)
let () = Fn2.print_result (Fn2.fn "a")
