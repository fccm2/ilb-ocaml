open Imlb
let () =
  let ndx = create_ndx 120 90 in
  let c0 = (255, 255, 255) in
  let cs = [|
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
  let n = Array.length cs in
  default_ndx_rgb ndx c0;
  let rs = draw_circ_r (10, 20) 13 in
  let c = cs.(Random.int n) in
  Array.iter (fun (x, y) ->
    put_ndx_rgb ndx x y c;
  ) rs;
  print_ndx ndx;
  free_ndx ndx;
;;
let an () =
  let p3 = create_p3 120 90 in
  let ndx = create_ndx 120 90 in
  let c0 = (255, 255, 255) in
  let cs = [|
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
  let n = Array.length cs in
  default_ndx_rgb ndx c0;
  let rs = draw_circ_r (10, 20) 13 in
  Array.iter (fun (x, y) ->
    let c = cs.(Random.int n) in
    put_ndx_rgb ndx x y c;
  ) rs;
  p3_of_ndx p3 ndx;
  print_p3 p3;
  free_ndx ndx;
  free_p3 p3;
;;
let an () =
  (*
  Random.self_init ();
  *)
  let p3 = create_p3 120 90 in
  (*
  let ndx = create_ndx 120 90 in
  *)
  (*
  let c0 = (255, 255, 255) in
  let cs = [|
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
  let n = Array.length cs in
  *)

  let rs = draw_rect_r (0, 0, 120, 90) in
  Array.iter (fun (x, y) ->
    let r, g, b = (255, 255, 255) in
    put_p3_color p3 x y r g b;
  ) rs;

  (*
  Printf.printf "#-A\n%!";
  default_ndx_rgb ndx c0;
  Printf.printf "#-B\n%!";

  let rs = draw_circ_r (10, 20) 3 in
  Printf.printf "#-C\n%!";
  let c = cs.(Random.int n) in
  Array.iter (fun (x, y) ->
    put_ndx_rgb ndx x y c;
  ) rs;
  *)

  (*
  p3_of_ndx p3 ndx;
  *)
  (*
  p3_lay_ndx p3 ndx ZERO_TRANSL [| |];
  *)

  print_p3 p3;
  free_p3 p3;
  (*
  free_ndx ndx;
  *)
;;
