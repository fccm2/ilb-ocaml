open Imlb
let () =
  let img = create_img 120 90 in
  strk_circ img (23, 15) (41) 1;
  strk_circ img (81, 39) (16) 1;
  strk_circ img (72, 14) (11) 1;
  strk_circ img (42, 32) (20) 1;
  strk_circ img (20, 65) (17) 1;
  strk_circ img (58, 75) (10) 1;
  strk_circ img (103, 78) (10) 1;
  strk_circ img (107, 38) (17) 1;
  strk_circ img (97, 14) (11) 1;
  strk_circ img (8, 5) (10) 1;
  strk_circ img (15, 27) (16) 1;
  strk_circ img (85, 64) (23) 1;
  strk_circ img (33, 85) (13) 1;
  strk_circ img (3, 81) (20) 1;
  strk_circ img (40, 0) (20) 1;
  strk_circ img (81, 72) (43) 1;
  strk_circ img (84, 58) (11) 1;
  strk_circ img (113, 70) (7) 1;
  strk_circ img (108, 32) (19) 1;
  strk_circ img (10, 31) (26) 1;
  strk_circ img (16, 68) (22) 1;
  strk_circ img (55, 50) (26) 1;
  strk_circ img (40, 10) (7) 1;
  print_img img;
  free_img img;
;;
