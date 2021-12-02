let rec map func l = 
   match l with
      [] -> []
   | h::t -> func h :: map func t


let entry_of_channel ch =
   let number = input_line ch in int_of_string number


let rec list_of_channel ch =
   try
      let e = entry_of_channel ch in
      e :: list_of_channel ch
   with
      End_of_file -> []


let list_of_file filename =
   let ch = open_in filename in
      let distance_list = list_of_channel ch in
         close_in ch;
         distance_list


let number_of_increase l =
   let rec inner count prev l =
      match l with 
      | h::t ->
            (if h > prev then inner (count+1) h t else inner count h t)
      | [] -> count
   in
   inner 0 infinity l


let number_of_triple_increase l =
   let rec inner count seen prev1 prev2 prev3 l = 
      match l with
      | [] -> count
      | h::t -> (
         if seen < 3
            then inner count (seen+1) h prev1 prev2 t
            else (
               if (h + prev1 + prev2) > (prev1 + prev2 + prev3) 
                  then inner (count+1) (seen+1) h prev1 prev2 t 
                  else inner (count) (seen+1) h prev1 prev2 t
            )
      )
   in
   inner 0 0 0 0 0 l
