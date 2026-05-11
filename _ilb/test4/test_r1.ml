open Imlb
let () =
  Random.self_init ();
  let r = create_img 120 90 in
  let rs = draw_line_r (10, 10) (110, 80) in
  Array.iter (fun (x, y) ->
    let v = Random.int 2 in
    put_px r (x, y) v;
  ) rs;
  print_img r;
  free_img r;
;;
