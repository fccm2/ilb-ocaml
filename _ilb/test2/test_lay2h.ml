open Imlb

let () =
  let p3 = create_p3 120 80 in
  let img2 = create_img 120 80 in
  let img3 = create_img 120 80 in

  if p3_p1_eq_size p3 img2
  then p3_of_p1 p3 img2;

  draw_circ img3 (40, 20) 32 1;

  draw_mana img2 [| (* plots *)
    { x = 20; y = 10; v = 1; };
    { x = 22; y = 12; v = 0; };
  |];
  p3_lay_p1 p3 img3 TRANSP_COLOR [| (0, 255, 0) |];
  p3_lay_p1 p3 img2 TRANSP_COLOR [| (0, 0, 0) |];

  print_p3 p3;
  free_img img3;
  free_img img2;
  free_p3 p3;
;;

