open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (20, 40) 30 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=24; y=74; v=1}; {x=55; y=81; v=0}; {x=74; y=18; v=0}; {x=24; y=34; v=1}; {x=15; y=62; v=1}; {x=27; y=73; v=1}; {x=31; y=66; v=0}; {x=8; y=16; v=1}; {x=107; y=58; v=1}; {x=46; y=14; v=1}; {x=64; y=19; v=1}; {x=11; y=15; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
