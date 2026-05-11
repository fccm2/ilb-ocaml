open Imlb

let () =
  let p3 = create_p3 120 80 in

  let c1 = (255, 0, 0) in
  let c2 = (0, 0, 255) in

  put_p3_color p3 0 0 255 255 255;
  put_p3_rgb p3 1 0 c1;
  for d = 0 to pred 80 do
    put_p3_rgb p3 (20+d) 8 c2;
  done;

  print_p3 p3;
  free_p3 p3;
;;

