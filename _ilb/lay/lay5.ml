open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  draw_rect img1 (20, 20, 40, 60) 1;
  draw_rect img1 (50, 30, 20, 10) 3;
  draw_rect img1 (50, 50, 20, 10) 3;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TWO_COLOR [| (0, 0, 255); (255, 0, 0) |];

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
