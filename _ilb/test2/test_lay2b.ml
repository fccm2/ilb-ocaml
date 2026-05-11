open Imlb

let range a b =
  a + (Random.int (b - a))

let () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  let img2 = create_img 120 80 in
  for i = 0 to pred 10 do
    let x = Random.int 100 in
    let y = Random.int 80 in
    let r = Random.int 40 in
    draw_circ img (x, y) r 1;
  done;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let cols = [|
    (255, 255, 0);
    (255, 0, 255);
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
  for y = 1 to 6 do
    let col = cols.(Random.int (Array.length cols)) in
    let x1 = range 10 20 in
    let x2 = range 90 110 in
    for x = x1 to x2 do
      let y = y * 10 in
      put_p3_rgb p3 x y col;
    done;
  done;
  draw_mana img2 begin (* plots *)
    Array.init 80 (fun _ ->
      let plots = {
        x = Random.int 100;
        y = Random.int 80;
        v = Random.int 2;
      } in
      (plots)
    )
  end;
  p3_lay_p1 p3 img2 TRANSP_COLOR [| (255, 0, 0) |];
  print_p3 p3;
  free_p3 p3;
;;

