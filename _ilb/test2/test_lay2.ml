open Imlb

let () =
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  let img2 = create_img 120 80 in
  draw_circ img (20, 20) 48 1;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  for x = 20 to 100 do
    put_p3_rgb p3 x 10 (0, 0, 255);
    put_p3_rgb p3 x 20 (0, 0, 255);
  done;
  draw_rect img2 (40, 40, 50, 20) 1;
  p3_lay_p1 p3 img2 TRANSP_COLOR [| (255, 0, 0) |];
  print_p3 p3;
  free_p3 p3;
;;

