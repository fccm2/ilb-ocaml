open Imlb
let rand_pnt () =
  (Random.int 120,
   Random.int 90)
let () =
  Random.self_init ();
  let p3 = create_p3 120 90 in
  let ndx = create_ndx 120 90 in
  let c0 = (255, 255, 255) in

  default_ndx_rgb ndx c0;

  let a = rand_pnt () in
  let b = rand_pnt () in
  let c = rand_pnt () in
  let rs = draw_tri_r a b c in

  Array.iter (fun (x, y) ->
    let c = (Random.int 255, Random.int 255, Random.int 255) in
    put_ndx_rgb ndx x y c;
  ) rs;

  p3_of_ndx p3 ndx;

  print_p3 p3;
  free_p3 p3;
  free_ndx ndx;
;;
