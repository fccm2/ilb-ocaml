type img

external create_img : int -> int -> img
  = "caml_create_img"

external free_img : img -> unit
  = "caml_free_img"

external strk_rect : img -> int * int * int * int -> int -> unit
  = "caml_strk_rect"

external draw_rect : img -> int * int * int * int -> int -> unit
  = "caml_draw_rect"

external draw_circ : img -> int * int -> int -> int -> unit
  = "caml_draw_circ"

external strk_circ : img -> int * int -> int -> int -> unit
  = "caml_strk_circ"

external draw_losng : img -> int * int -> int -> int -> unit
  = "caml_draw_losng"

external put_px : img -> int * int -> int -> unit
  = "caml_put_px"

external draw_line : img -> int * int -> int * int -> int -> unit
  = "caml_draw_line"

external quad_bcurve : img -> int * int -> int * int -> int * int -> int -> unit
  = "caml_quad_bcurve"

external mana_dist : int * int -> int * int -> int
  = "caml_mana_dist"

external get_px : img -> int * int -> int
  = "caml_get_px"

external draw_letter : img -> int * int -> char -> int -> unit
  = "caml_draw_letter"

external draw_tri : img -> int * int -> int * int -> int * int -> int -> unit
  = "caml_draw_tri"

external draw_cnvx : img -> (int * int) array -> int -> unit
  = "caml_draw_cnvx"

external read_p1 : string -> img
  = "caml_read_p1"

type plots = {
  x : int;
  y : int;
  v : int;
}
external draw_mana : img -> plots array -> unit
  = "caml_draw_mana"

external get_ba : img -> (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
  = "caml_get_ba"

external print_img : img -> unit
  = "caml_print_img"

external strk_rect_r : int * int * int * int -> (int * int) array
  = "caml_strk_rect_r"

external quad_bcurve_r : int * int -> int * int -> int * int -> (int * int) array
  = "caml_quad_bcurve_r"

external draw_circ_r : int * int -> int -> (int * int) array
  = "caml_draw_circ_r"

external strk_circ_r : int * int -> int -> (int * int) array
  = "caml_strk_circ_r"

external draw_rect_r : int * int * int * int -> (int * int) array
  = "caml_draw_rect_r"

external draw_tri_r : int * int -> int * int -> int * int -> (int * int) array
  = "caml_draw_tri_r"

external draw_line_r : int * int -> int * int -> (int * int) array
  = "caml_draw_line_r"

external print_img_magic : img -> unit = "caml_print_img_magic"
external print_img_dims : img -> unit = "caml_print_img_dims"
external print_img_data : img -> unit = "caml_print_img_data"

type p3

external create_p3 : int -> int -> p3
  = "caml_create_p3"

external free_p3 : p3 -> unit
  = "caml_free_p3"

external print_p3 : p3 -> unit
  = "caml_print_p3"

type color = (int * int * int)

external get_p3_rgb : p3 -> int -> int -> color
  = "caml_get_p3_rgb"

external put_p3_rgb : p3 -> int -> int -> color -> unit
  = "caml_put_p3_rgb"

external put_p3_color : p3 -> int -> int -> int -> int -> int -> unit
  = "caml_put_p3_color_bytecode"
    "caml_put_p3_color"

external p3_of_p1 : p3 -> img -> unit
  = "caml_p3_of_p1"

external p3_p1_eq_size : p3 -> img -> bool
  = "caml_p3_p1_eq_size"

external print_p3_dims : p3 -> unit = "caml_print_p3_dims"
external print_p3_data : p3 -> unit = "caml_print_p3_data"
external print_p3_magic : p3 -> unit = "caml_print_p3_magic"

external stdio_flush : unit -> unit = "caml_stdio_flush"

let ( %! ) = stdio_flush ;;

type ndx

external ndx_max_num : unit -> int
  = "caml_ndx_max_num"

external create_ndx : int -> int -> ndx
  = "caml_create_ndx"

external free_ndx : ndx -> unit
  = "caml_free_ndx"

external default_ndx_rgb : ndx -> color -> unit
  = "caml_default_ndx_rgb"

external put_ndx_rgb : ndx -> int -> int -> color -> unit
  = "caml_put_ndx_rgb"

external print_ndx : ndx -> unit
  = "caml_print_ndx"

external p3_of_ndx : p3 -> ndx -> unit
  = "caml_p3_of_ndx"

type append_mode =
  | MINUS_APPEND
  | TRANSP_COLOR
  | TWO_COLOR
  | ZERO_TRANSL

external p3_lay_p1 : p3 -> img -> append_mode -> color array -> unit
  = "caml_p3_lay_p1"

external p3_lay_ndx : p3 -> ndx -> append_mode -> color array -> unit
  = "caml_p3_lay_ndx"

type name = string (*img-name*)
type op =
  | Img of (int * int) * name
  | Sirc of (int * int) * int * int * name
  | Print of name
  | Rect of (int * int * int * int) * int * name
  | Px of (int * int) * int * name
  | Circ of (int * int) * int * int * name
  | Tri of (int * int) * (int * int) * (int * int) * int * name
  | Lin of (int * int) * (int * int) * int * name
  | Free of name
  | QuadB of (int * int) * (int * int) * (int * int) * int * name
  | Mana of name * (int * int * int) array
  | Letter of name * (int * int) * char * int

let op_f op =
  let rec aux op ass =
    match op with
    | Print (name) :: op ->
        let img = List.assoc name ass in
        print_img img;
        aux op (ass)
    | Free (name) :: op ->
        let img = List.assoc name ass in
        free_img img;
        let ass = List.filter (fun (n, _) -> if n = name then false else true) ass in
        aux op (ass)
    | Img ((w, h), name) :: op ->
        let img = create_img w h in
        aux op ((name, img)::ass)
    | Sirc ((cx, cy), r, v, name) :: op ->
        let img = List.assoc name ass in
        draw_circ img (cx, cy) r v;
        aux op (ass)
    | Circ ((cx, cy), r, v, name) :: op ->
        let img = List.assoc name ass in
        draw_circ img (cx, cy) r v;
        aux op (ass)
    | Px ((x, y), v, name) :: op ->
        let img = List.assoc name ass in
        put_px img (x, y) v;
        aux op (ass)
    | Rect ((x, y, w, h), v, name) :: op ->
        let img = List.assoc name ass in
        draw_rect img (x, y, w, h) v;
        aux op (ass)
    | Tri ((x1, y1), (x2, y2), (x3, y3), v, name) :: op ->
        let img = List.assoc name ass in
        draw_tri img (x1, y1) (x2, y2) (x3, y3) v;
        aux op (ass)
    | Lin ((x1, y1), (x2, y2), v, name) :: op ->
        let img = List.assoc name ass in
        draw_line img (x1, y1) (x2, y2) v;
        aux op (ass)
    | Mana (name, plots) :: op ->
        let img = List.assoc name ass in
        let plots = Array.map (fun (x, y, v) -> { x; y; v; }) plots in
        draw_mana img plots;
        aux op (ass)
    | Letter (name, (x, y), c, v) :: op ->
        let img = List.assoc name ass in
        draw_letter img (x, y) c v;
        aux op (ass)
    | QuadB ((x1, y1), (x2, y2), (x3, y3), v, name) :: op ->
        let img = List.assoc name ass in
        quad_bcurve img (x1, y1) (x2, y2) (x3, y3) v;
        aux op (ass)
    (*
    | _ :: op ->
        aux op (ass)
    *)
    | [] ->
        List.iter (fun (_, img) ->
          free_img img;
        ) ass
  in
  aux op []

let warn_n n1 n2 =
  if n1 <> n2 then
    Printf.printf "  (*lay*)\n"

let op_s op =
  let rec aux op _name =
    match op with
    | Print (name) :: op ->
        warn_n _name name;
        Printf.printf "  print_img %s;\n" name;
        aux op name
    | Free (name) :: op ->
        warn_n _name name;
        Printf.printf "  free_img %s;\n" name;
        aux op name
    | Img ((w, h), name) :: op ->
        warn_n _name name;
        Printf.printf "  let %s = create_img %d %d in\n" name w h;
        aux op name
    | Sirc ((cx, cy), r, v, name) :: op ->
        warn_n _name name;
        Printf.printf "  draw_circ %s (%d, %d) %d %d;\n" name cx cy r v;
        aux op name
    | Circ ((cx, cy), r, v, name) :: op ->
        warn_n _name name;
        Printf.printf "  draw_circ %s (%d, %d) %d %d;\n" name cx cy r v;
        aux op name
    | Px ((x, y), v, name) :: op ->
        warn_n _name name;
        Printf.printf "  put_px %s (%d, %d) %d;\n" name x y v;
        aux op name
    | Rect ((x, y, w, h), v, name) :: op ->
        warn_n _name name;
        Printf.printf "  draw_rect %s (%d, %d, %d, %d) %d;\n" name x y w h v;
        aux op name
    | Tri ((x1, y1), (x2, y2), (x3, y3), v, name) :: op ->
        warn_n _name name;
        Printf.printf "  draw_tri %s (%d, %d) (%d, %d) (%d, %d) %d;\n" name x1 y1 x2 y2 x3 y3 v;
        aux op name
    | Lin ((x1, y1), (x2, y2), v, name) :: op ->
        warn_n _name name;
        Printf.printf "  draw_line %s (%d, %d) (%d, %d) %d;\n" name x1 y1 x2 y2 v;
        aux op name
    | Mana (name, plots) :: op ->
        warn_n _name name;
        let plots = Array.map (fun (x, y, v) -> Printf.sprintf "{x=%d; y=%d; v=%d}" x y v) plots in
        let plots = String.concat "; " (Array.to_list plots) in
        Printf.printf "  let plots = [| %s |] in\n" plots;
        Printf.printf "  draw_mana %s plots;\n" name;
        aux op name
    | Letter (name, (x, y), c, v) :: op ->
        warn_n _name name;
        Printf.printf "  draw_letter %s (%d, %d) %c %d;\n" name x y c v;
        aux op name
    | QuadB ((x1, y1), (x2, y2), (x3, y3), v, name) :: op ->
        warn_n _name name;
        Printf.printf "  quad_bcurve %s (%d, %d) (%d, %d) (%d, %d) %d;\n" name x1 y1 x2 y2 x3 y3 v;
        aux op name
    (*
    | _ :: op ->
        aux op (ass)
    *)
    | [] ->
        Printf.printf "\n";
        (_name)
  in
  aux op ""

(*
+let () =
+  let p3 = create_p3 120 80 in
+  let img2 = create_img 120 80 in
+  let img3 = create_img 120 80 in
+
+  if p3_p1_eq_size p3 img2
+  then p3_of_p1 p3 img2;
+
+  draw_circ img3 (40, 20) 32 1;
+
+  draw_mana img2 [| (* plots *)
+    { x = 20; y = 10; v = 1; };
+    { x = 22; y = 12; v = 0; };
+  |];
+  p3_lay_p1 p3 img3 TRANSP_COLOR (0, 255, 0);
+  p3_lay_p1 p3 img2 TRANSP_COLOR (0, 0, 0);
+
+  print_p3 p3;
+  free_img img3;
+  free_img img2;
+  free_p3 p3;
+;;
*)

let col = function
  | (r, g, b) -> Printf.sprintf "(%d, %d, %d)" r g b

let cols cs = Array.map col cs |> Array.to_list |> String.concat "; "
let cols cs = "[| " ^ (cols cs) ^ " |]"

let a_mode = function
  | MINUS_APPEND -> "MINUS_APPEND"
  | TRANSP_COLOR -> "TRANSP_COLOR"
  | TWO_COLOR -> "TWO_COLOR"
  | ZERO_TRANSL -> "ZERO_TRANSL"

type op_lay =
  | Layer of append_mode * (int * int * int) array * op list
  | Base of (int * int) * op list

let op_lay_f op_lay =
  let rec aux op_lay acc =
    match op_lay with
    | Layer (append_mode, color, op) :: op_lay ->
        let n = op_s op in
        Printf.printf "  if p3_p1_eq_size p3 %s\n" n;
        Printf.printf "  then p3_lay_p1 p3 %s %s %s;\n\n" n (a_mode append_mode) (cols color);
        aux op_lay (n::acc)
    | Base ((w, h), op) :: op_lay ->
        Printf.printf "open Imlb\nlet () =\n";
        Printf.printf "  let p3 = create_p3 %d %d in\n\n" w h;
        let n = op_s op in
        Printf.printf "  if p3_p1_eq_size p3 %s\n" n;
        Printf.printf "  then p3_of_p1 p3 %s;\n\n" n;
        aux op_lay (n::acc)
    | [] ->
        let acc = List.rev acc in
        Printf.printf "  print_p3 p3;\n";
        List.iter (fun n ->
          Printf.printf "  free_img %s;\n" n;
        ) acc;
        Printf.printf "  free_p3 p3;\n";
        Printf.printf ";;\n%!";
        ()
  in
  aux op_lay []
