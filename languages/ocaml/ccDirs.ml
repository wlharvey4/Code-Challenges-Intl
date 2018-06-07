(*
   ocaml/ccDirs.ml
   ====================================================
   CREATED: 2018-05-28
   UPDATED: 2018-06-06
   VERSION: 1.0.0
   AUTHOR: wlharvey4
   ABOUT: Utility module CcDirs for dealing with directories and Yojson
   NOTES: 
   ----------------------------------------------------
*)

open Core

type dir = string

let jsonExt = ".json"
let challenges = "challenges"

(* code challenge name as given on the command-line *)                    
let cc = try
    Array.get Sys.argv 1
  with
  | Invalid_argument _ -> failwith "You must supply a cc name on the command-line: "
  | e -> raise e

(* capitalized code challenge name *)
let cC = String.capitalize cc

(* check.native will be generated in the root directory Code-Challenges-Intl
   starting from Code-Challenges-Intl/languages/ocaml *)
let root = Filename.dirname (Filename.realpath Filename.parent_dir_name)

(* ROOT/challenges/<cc> *)
let jsonDir = Filename.concat (Filename.concat root challenges) cc

(* ROOT/challenges/<cc>/<cc>.json *)
let jsonFile = Filename.concat jsonDir (cc ^ jsonExt)

(* the JSON data *)
let ccJson = Yojson.Basic.from_file jsonFile

let ppJson j = Yojson.Basic.pretty_to_channel stdout j
