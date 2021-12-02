#load "str.cma";;

let rec map func l = 
   match l with
      [] -> []
   | h::t -> func h :: map func t


let parse_line line =
  let format_line line = 
    match line with
    | [x; y] -> (x, int_of_string y)
  in
  format_line (Str.split ( Str.regexp " ") line)


let entry_of_channel ch =
   parse_line (input_line ch)


let rec list_of_channel ch =
   try
      let e = entry_of_channel ch in
      e :: list_of_channel ch
   with
      End_of_file -> []


let parse_file filename =
   let ch = open_in filename in
      let parsed_list = list_of_channel ch in
         close_in ch;
         parsed_list

let compute_pos l =
  let rec inner aim xpos ypos l =
    match l with
    | ("forward", x)::t -> inner aim (xpos + x) (ypos+aim*x) t
    | ("up", y)::t  -> inner (aim-y) xpos ypos t
    | ("down", y)::t -> inner (aim+y) xpos ypos t
    | (str, y)::t -> inner aim xpos ypos t 
    | [] -> (xpos, ypos)
  in inner 0 0 0 l 
