open Lex
open Lexing

exception Parse_error of string
exception File_not_found of string

let print_position lexbuf =
  let pos = lexbuf.lex_curr_p in
  Printf.sprintf "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)

let parse_with_error lexbuf =
  try Grammar.sign Lex.token lexbuf with
  | SyntaxError msg ->
    let location = print_position lexbuf in
    let msg = Printf.sprintf "%s: %s\n" location msg in
    raise (Parse_error msg)
  | Grammar.Error ->
    let location = print_position lexbuf in
    let msg = Printf.sprintf "%s: syntax error.\n" location in
    raise (Parse_error msg)

let load_file filename =
  let ch =
    try open_in filename with
    | Sys_error _ -> raise (File_not_found filename) in
  let lexbuf = Lexing.from_channel ch in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
  let sign = parse_with_error lexbuf in
  close_in ch; sign
