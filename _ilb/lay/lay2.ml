open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (54, 41) 27 1;
  draw_circ img0 (47, 42) 22 1;
  draw_circ img0 (103, 55) 30 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=67; y=50; v=0}; {x=56; y=61; v=0}; {x=75; y=10; v=1}; {x=62; y=87; v=0}; {x=16; y=76; v=1}; {x=38; y=17; v=0}; {x=39; y=69; v=1}; {x=83; y=48; v=0}; {x=52; y=58; v=1}; {x=59; y=62; v=0}; {x=118; y=84; v=0}; {x=79; y=78; v=1}; {x=13; y=87; v=0}; {x=66; y=41; v=1} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR [| (0, 255, 0) |];

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
