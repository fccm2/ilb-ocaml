open Imlb
let rand_pnt () =
  (Random.int 120,
   Random.int 90)
let () =
  Random.self_init ();
  let r = create_img 120 90 in
  let a = rand_pnt () in
  let b = rand_pnt () in
  let c = rand_pnt () in
  let rs = draw_tri_r a b c in
  Array.iter (fun (x, y) ->
    let v = Random.int 2 in
    put_px r (x, y) v;
  ) rs;
  print_img r;
  free_img r;
;;
