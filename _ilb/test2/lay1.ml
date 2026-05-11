open Imlb
let () =
  let p3 = create_p3 120 80 in
  (*base-lay*)
  let img = create_img 120 80 in
  draw_rect img (10, 40, 20, 20) 1;

  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  free_img img;

  let img = create_img 120 80 in
  draw_circ img (10, 40) 20 1;

  p3_lay_p1 p3 img TRANSP_COLOR [| (0, 255, 0) |];
  free_img img;

  let img = create_img 120 80 in
  draw_mana img [| {x=22; y=12; v=0}; {x=20; y=10; v=1}; |];

  p3_lay_p1 p3 img TRANSP_COLOR [| (0, 0, 0) |];
  free_img img;

  print_p3 p3;
  free_p3 p3;
;;
