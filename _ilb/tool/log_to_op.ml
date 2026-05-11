let input_line_opt ic =
  try let line = input_line ic in Some(line)
  with End_of_file -> None

let input_lines file =
  let ic = open_in file in
  let rec aux acc =
    match input_line_opt ic with
    | Some line -> aux (line::acc)
    | None -> close_in ic; List.rev (acc)
  in
  aux []

type logs =
  | Dims of int * int
  | Rect of (int * int) * (int * int) * int
  | Px of (int * int) * int
  | Sirc of (int * int) * (int) * int
  | Circ of (int * int) * (int) * int
  | Mant of (int * int) * int
  | Nant
  | Lin of (int * int) * (int * int) * int
  | Tri of (int * int) * (int * int) * (int * int) * int
  | End

(*
# Dims: 120,90
# Rect: 12,60 12,19 ; 1
# Px: 55,31 ; 3
*)

let read_px s =
  let x, y, v =
    Scanf.sscanf s "# Px: %d,%d ; %d"
      (fun x y v -> x, y, v)
  in
  Px((x, y), v)

(*
# Lin: 83,32 89,37 ; 1
*)

let read_lin s =
  let x1, y1, x2, y2, v =
    Scanf.sscanf s "# Lin: %d,%d %d,%d ; %d"
      (fun x1 y1 x2 y2 v -> x1, y1, x2, y2, v)
  in
  Lin((x1, y1), (x2, y2), v)

let read_rect s =
  let x1, y1, x2, y2, v =
    Scanf.sscanf s "# Rect: %d,%d %d,%d ; %d"
      (fun x1 y1 x2 y2 v -> x1, y1, x2, y2, v)
  in
  Rect((x1, y1), (x2, y2), v)

(*
# Circ: 66,49 7 ; 1
*)

let read_circ s =
  let cx, cy, r, v =
    Scanf.sscanf s "# Circ: %d,%d %d ; %d"
      (fun cx cy r v -> cx, cy, r, v)
  in
  Circ((cx, cy), (r), v)

let read_sirc s =
  let cx, cy, r, v =
    Scanf.sscanf s "# Sirc: %d,%d %d ; %d"
      (fun cx cy r v -> cx, cy, r, v)
  in
  Sirc((cx, cy), (r), v)

(*
# Tri: 72,3 65,16 92,19 ; 3
*)

let read_mant s =
  let px, py, v =
    Scanf.sscanf s "# Mant: %d,%d ; %d"
      (fun px py v -> px, py, v)
  in
  Mant((px, py), v)

(*
# Nant
*)

let read_nant s =
  if s = "# Nant" then Nant
  else assert false

(*
# Mant: 39,68 ; 0
*)

let read_tri s =
  let x1, y1, x2, y2, x3, y3, v =
    Scanf.sscanf s "# Tri: %d,%d %d,%d %d,%d ; %d"
      (fun x1 y1 x2 y2 x3 y3 v -> x1, y1, x2, y2, x3, y3, v)
  in
  Tri((x1, y1), (x2, y2), (x3, y3), v)

let read_dims s =
  let w, h =
    Scanf.sscanf s "# Dims: %d,%d"
      (fun w h -> w, h)
  in
  Dims(w, h)

let read_end s =
  if s = "# End" then End
  else assert false

let read_log s =
  try read_px s
  with _ ->
    try read_lin s
    with _ ->
      try read_rect s
      with _ ->
        try read_nant s
        with _ ->
          try read_mant s
          with _ ->
            try read_sirc s
            with _ ->
              try read_circ s
              with _ ->
                try read_tri s
                with _ ->
                  try read_dims s
                  with _ ->
                    try read_end s
                    with _ ->
                      invalid_arg "read_log"

let get_logs () =
  let log_file =
    match Sys.argv with
    | [| _ |] -> assert false
    | [| _; file |] -> file
    | _ -> raise Exit
  in
  let lines = input_lines log_file in
  let rec aux lines acc =
    match lines with
    | [] -> List.rev (acc)
    | line :: lines ->
        let len = String.length line in
        match len with
        | d when d > 1 ->
            let c0 = String.get line 0 in
            let acc =
              if c0 = '#'
              then (read_log line)::acc
              else acc
            in
            aux lines acc
        | _ -> aux lines acc
  in
  aux lines []

let mants = ref []

let some ns = match ns with Some n -> n | None -> "n"
let _ =
  Random.self_init ();
  let logs = get_logs () in
  List.fold_left (fun ns log ->
    match log with
    | Px((x, y), v) ->
        let n = some ns in
        Printf.printf "  Px ((%d, %d), %d, \"%s\");\n" x y v n;
        (ns)
    | Lin((x1, y1), (x2, y2), v) ->
        let n = some ns in
        Printf.printf "  Lin ((%d, %d), (%d, %d), %d, \"%s\");\n" x1 y1 x2 y2 v n;
        (ns)
    | Mant((px, py), v) ->
        mants := ((px, py), v) :: !mants;
        (ns)
    | Nant ->
        Printf.printf "  let plots = [|\n";
        List.iter (fun ((px, py), v) ->
          Printf.printf "    { x=%d; y=%d; v=%d; };\n" px py v;
        ) !mants;
        Printf.printf "  |] in\n";
        Printf.printf "  draw_mana img plots;\n";
        mants := [];
        (ns)
    | Sirc((cx, cy), (r), v) ->
        let n = some ns in
        Printf.printf "  Sirc ((%d, %d), %d, %d, \"%s\");\n" cx cy r v n;
        (ns)
    | Circ((cx, cy), (r), v) ->
        let n = some ns in
        Printf.printf "  Circ ((%d, %d), %d, %d, \"%s\");\n" cx cy r v n;
        (ns)
    | Rect((x1, y1), (x2, y2), v) ->
        let n = some ns in
        Printf.printf "  Rect ((%d, %d, %d, %d), %d, \"%s\");\n" x1 y1 x2 y2 v n;
        (ns)
    | Tri((x1, y1), (x2, y2), (x3, y3), v) ->
        let n = some ns in
        Printf.printf "  Tri ((%d, %d), (%d, %d), (%d, %d), %d, \"%s\");\n" x1 y1 x2 y2 x3 y3 v n;
        (ns)
    | Dims(w, h) ->
        let max_v = pred (1 lsl 30) in
        let s = string_of_int (Random.int max_v) in
        let hex = Digest.string s in
        let n = (Digest.to_hex hex) in
        let n = "n" ^ (String.sub n 0 5) in
        Printf.printf "open Imlb\n";
        Printf.printf "let () = op_f [\n";
        Printf.printf "  Img ((%d, %d), \"%s\");\n" w h n;
        (Some n)
    | End ->
        let n = some ns in
        Printf.printf "  Print \"%s\";\n" n;
        Printf.printf "  Free \"%s\";\n" n;
        Printf.printf "] ;;\n";
        (None)
  ) None logs

