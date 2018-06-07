(*
   ocaml/ccDirs.ml
   ====================================================
   CREATED: 2018-05-28
   VERSION: 0.1.1
   AUTHOR: wlharvey4
   ABOUT: Utility module CcDirs for dealing with directories and Yojson
   NOTES: 
   ----------------------------------------------------
*)

open Core

type dir = string

let jsonExt = ".json"

(* code challenge name as given on the command-line *)                    
let cc = try
    Array.get Sys.argv 1
  with
  | Invalid_argument _ -> failwith "You must supply a cc name on the command-line: "
  | e -> raise e

(* capitalized code challenge name *)
let cC = String.capitalize cc

(* check.native will be generated in the root directory *)
let root = Filename.realpath Filename.parent_dir_name

(* ROOT/<cc> *)
let jsonDir = Filename.concat root cc

(* ROOT/<cc>/<cc>.json *)
let jsonFile = Filename.concat jsonDir (cc ^ jsonExt)

(* the JSON data *)
let ccJson = Yojson.Basic.from_file jsonFile

let ppJson j = Yojson.Basic.pretty_to_channel stdout j
