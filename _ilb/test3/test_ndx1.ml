open Imlb
let () =
  let p3 = create_p3 120 90 in
  let ndx = create_ndx 120 90 in
  let c0 = (255, 255, 255) in
  let c1 = (0, 0, 255) in
  let c2 = (0, 255, 0) in
  let c3 = (255, 0, 0) in

  default_ndx_rgb ndx c0;

  put_ndx_rgb ndx 1 1 c1;
  put_ndx_rgb ndx 2 1 c2;
  put_ndx_rgb ndx 3 1 c3;
  p3_of_ndx p3 ndx;

  print_p3 p3;
  free_p3 p3;
  free_ndx ndx;
;;
