module Xe = Xmlerr
open Xmlerr
let dims = ref (0, 0)
let mode = ref ""
let col = ref ""
let () =
  let xs = Xmlerr.parse_file ~filename:Sys.argv.(1) in
  let xs = Xmlerr.strip_space xs in
  let get_attr n ass = List.assoc n ass in
  let _ = get_attr in
  let rec aux_mana xs acc =
    match xs with
    | Tag ("plot", attrs) :: xs ->
        let x = get_attr "x" attrs in
        let y = get_attr "y" attrs in
        let v = get_attr "v" attrs in
        let x = int_of_string x in
        let y = int_of_string y in
        let v = int_of_string v in
        let plot = (x, y, v) in
        aux_mana xs (plot::acc)
    | Tag (n, attrs) :: xs -> aux_mana xs acc
    | ETag ("mana") :: xs -> (xs, acc)
    | ETag (n) :: xs -> aux_mana xs acc
    | _ :: xs -> aux_mana xs acc
    | [] -> assert false
  in
  let rec aux xs =
    match xs with
    | Tag (n, attrs) :: xs ->
        let xs =
          match n with
          | "lay" ->
              let w = get_attr "w" attrs in
              let h = get_attr "h" attrs in
              let w = int_of_string w in
              let h = int_of_string h in
              Printf.printf "open Imlb\nlet () =\n";
              Printf.printf "  let p3 = create_p3 %d %d in\n" w h;
              dims := (w, h);
              (xs)
              (*
              Printf.printf "op-lay\n";
              *)
          | "img" ->
            begin
              try
                let _mode = get_attr "lay-mode" attrs in
                let _col = get_attr "lay-col" attrs in
                mode := _mode;
                col := _col;
                (*
                Printf.printf " op-img\n";
                *)
                let w, h = !dims in
                Printf.printf "  let img = create_img %d %d in\n" w h;
                (xs)
              with Not_found ->
                (*
                Printf.printf "\n";
                Printf.printf "  if p3_p1_eq_size p3 img\n";
                Printf.printf "  then p3_of_p1 p3 img;\n";
                Printf.printf "\n";
                *)
                let w, h = !dims in
                Printf.printf "  (*base-lay*)\n";
                Printf.printf "  let img = create_img %d %d in\n" w h;
                (xs)
            end
              (*
            <mana>
              <plot x="20" y="10" v="1" />
              <plot x="22" y="12" v="0" />
            </mana>
              *)
          | "mana" ->
              let xs, plots = aux_mana xs [] in
              let plots = List.map (fun (x, y, v) -> Printf.sprintf "{x=%d; y=%d; v=%d};" x y v) plots in
              let plots = String.concat " " plots in
              Printf.printf "  draw_mana img [| %s |];\n" plots;
              Printf.printf "\n";
              (*
              Printf.printf " -op-mana\n";
              *)
              (xs)
          | "rect" ->
              let x = get_attr "x" attrs in
              let y = get_attr "y" attrs in
              let w = get_attr "w" attrs in
              let h = get_attr "h" attrs in
              let x = int_of_string x in
              let y = int_of_string y in
              let w = int_of_string w in
              let h = int_of_string h in
              let v = get_attr "v" attrs in
              let v = int_of_string v in
              Printf.printf "  draw_rect img (%d, %d, %d, %d) %d;\n" x y w h v;
              Printf.printf "\n";
              (*
              Printf.printf " -op-rect\n";
              *)
              (xs)
          | "bquad" ->
              let x1 = get_attr "x1" attrs in
              let y1 = get_attr "y1" attrs in
              let x2 = get_attr "x2" attrs in
              let y2 = get_attr "y2" attrs in
              let x3 = get_attr "x3" attrs in
              let y3 = get_attr "y3" attrs in
              let v = get_attr "v" attrs in
              let x1 = int_of_string x1 in
              let y1 = int_of_string y1 in
              let x2 = int_of_string x2 in
              let y2 = int_of_string y2 in
              let x3 = int_of_string x3 in
              let y3 = int_of_string y3 in
              let v = int_of_string v in
              Printf.printf "  quad_bcurve img (%d, %d) (%d, %d) (%d, %d) %d;\n" x1 y1 x2 y2 x3 y3 v;
              Printf.printf "\n";
              (xs)
          | "line" ->
              let x1 = get_attr "x1" attrs in
              let y1 = get_attr "y1" attrs in
              let x2 = get_attr "x2" attrs in
              let y2 = get_attr "y2" attrs in
              let x1 = int_of_string x1 in
              let y1 = int_of_string y1 in
              let x2 = int_of_string x2 in
              let y2 = int_of_string y2 in
              let v = get_attr "v" attrs in
              let v = int_of_string v in
              Printf.printf "  draw_line img (%d, %d) (%d, %d) %d;\n" x1 y1 x2 y2 v;
              Printf.printf "\n";
              (xs)
          | "sirc" ->
              let x = get_attr "x" attrs in
              let y = get_attr "y" attrs in
              let r = get_attr "r" attrs in
              let x = int_of_string x in
              let y = int_of_string y in
              let r = int_of_string r in
              let v = get_attr "v" attrs in
              let v = int_of_string v in
              Printf.printf "  strk_circ img (%d, %d) %d %d;\n" x y r v;
              Printf.printf "\n";
              (xs)
          | "circ" ->
              let x = get_attr "x" attrs in
              let y = get_attr "y" attrs in
              let r = get_attr "r" attrs in
              let x = int_of_string x in
              let y = int_of_string y in
              let r = int_of_string r in
              let v = get_attr "v" attrs in
              let v = int_of_string v in
              Printf.printf "  draw_circ img (%d, %d) %d %d;\n" x y r v;
              Printf.printf "\n";
              (xs)
              (*
              Printf.printf " -op-circ\n";

              <rect x="10" y="40" w="20" h="20" v="1" />
              <circ x="10" y="40" r="20" v="1" />
              *)
          | _ -> (xs)
        in
        aux xs
    | ETag (n) :: xs ->
        begin
          match n with
          | "lay" ->
              (*
              Printf.printf "e-lay\n";
              *)
              Printf.printf "  print_p3 p3;\n";
              Printf.printf "  free_p3 p3;\n";
              Printf.printf ";;\n";
              (*
              *)
          | "img" ->
              (*
              Printf.printf " e-img\n";
              *)
              (*
              if p3_p1_eq_size p3 img
              then p3_of_p1 p3 img;
              *)
              let _mode = !mode in
              let _col = !col in
              begin
                match _mode, _col with
                | "", "" ->
                  Printf.printf "  if p3_p1_eq_size p3 img\n";
                  Printf.printf "  then p3_of_p1 p3 img;\n";
                  Printf.printf "  free_img img;\n";
                  Printf.printf "\n";
                | _mode, _col ->
                  Printf.printf "  p3_lay_p1 p3 img %s [| %s |];\n" _mode _col;
                  Printf.printf "  free_img img;\n";
                  Printf.printf "\n";
              end
          | _ -> ()
        end;
        aux xs
    | _ :: xs -> aux xs
    | [] -> ()
  in
  aux xs
