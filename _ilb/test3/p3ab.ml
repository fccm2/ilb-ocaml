let input_line_opt ic =
  try Some (input_line ic)
  with End_of_file -> None
let () =
  let ic = open_in Sys.argv.(1) in
  let l1 = input_line_opt ic in
  let l2 = input_line_opt ic in
  let l3 = input_line_opt ic in
  begin match l1 with Some "P6" -> () | Some _ | None -> failwith "not a p6" end;
  let w, h =
    match l2 with
    | Some s -> Scanf.sscanf s "%d %d" (fun w h -> w, h)
    | None -> failwith "read dims failed"
  in
  begin match l3 with Some "255" -> () | Some _ | None -> failwith "not a 255" end;
  let n = (w * h * 3) in
  let lst = ref [] in
  for _ = 0 to pred n do
    let c = input_char ic in
    lst := c :: !lst
  done;
  close_in ic;
  let lst = List.rev !lst in
  print_endline "P6";
  Printf.printf "%d %d\n" w h;
  Printf.printf "# %d\n" (List.length lst);
  print_endline "255";
  List.iter (fun (c) ->
    let d = int_of_char c in
    Printf.printf " %d" d;
  ) lst;
  Printf.printf "\n%!";
;;
