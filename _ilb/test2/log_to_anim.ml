let input_line_opt ic =
  try Some (input_line ic)
  with End_of_file -> None

let () =
  let log_file = Sys.argv.(1) in
  let file_name = Filename.chop_suffix log_file ".log" in
  let ic = open_in log_file in
  let open_file d =
    let n = Printf.sprintf "%03d" d in
    let oc = open_out (file_name ^ n ^ ".pbm") in
    (oc)
  in
  let print_rem d =
    let _d = d in
    let rec aux d =
      if d < 0 then () else
      begin
        let _d = _d - d in
        let n = Printf.sprintf "%03d" _d in
        Printf.printf "rm -f %s%s.pbm %s%s.png\n" file_name n file_name n;
        aux (pred d)
      end
    in
    aux d
  in
  let print_conv d =
    let _d = d in
    let rec aux d =
      if d < 0 then
        Printf.printf "convert -delay 60 -loop 0 %s*.png %s.gif\n" file_name file_name
      else begin
        let _d = _d - d in
        let n = Printf.sprintf "%03d" _d in
        Printf.printf "convert %s%s.pbm %s%s.png\n" file_name n file_name n;
        aux (pred d)
      end
    in
    aux d
  in
  let some v = match v with Some v -> v | None -> failwith "some" in
  let rec aux (oc) d =
    match input_line_opt ic with
    | None ->
        close_in ic;
        close_out (some oc);
        print_conv d;
        print_rem d
    | Some magic
      when magic = "P1"
        || magic = "P3" ->
        let d =
          match oc with
          | None -> (d)
          | Some _oc ->
              close_out _oc;
              let d = succ d in
              (d)
        in
        let oc = open_file d in
        output_string oc (magic ^ "\n");
        aux (Some oc) d
    | Some line ->
        output_string (some oc) (line ^ "\n");
        aux (oc) d
  in
  aux (None) 0
