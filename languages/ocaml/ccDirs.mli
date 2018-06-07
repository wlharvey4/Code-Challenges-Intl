(*
   ocaml/ccDirs.mli
   ====================================================
   CREATED: 2018-05-28
   VERSION: 0.1.0
   AUTHOR: wlharvey4
   ABOUT: Interface for utility module for dealing with directories and Yojson
   NOTES: 
   ----------------------------------------------------
*)


type dir = string
val cC : dir
val jsonFile : dir
val ccJson : Yojson.Basic.json
val ppJson : Yojson.Basic.json -> unit
