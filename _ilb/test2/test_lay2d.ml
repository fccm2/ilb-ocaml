open Imlb

let range a b =
  a + (Random.int (b - a))

let () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  let img2 = create_img 120 80 in
  let img3 = create_img 120 80 in
  let img4 = create_img 120 80 in
  let circ =
    Array.init 12 (fun _ ->
      let x = Random.int 100 in
      let y = Random.int 80 in
      let r = Random.int 30 in
      (x, y, r)
    )
  in
  Array.iter (fun (x, y, r) ->
    draw_circ img3 (x, y) r 1;
  ) circ;
  Array.iter (fun (x, y, r) ->
    strk_circ img4 (x, y) r 1;
  ) circ;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let cols = [|
    (255, 0, 255);
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
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
  p3_lay_p1 p3 img3 TRANSP_COLOR [| (255, 0, 0) |];
  p3_lay_p1 p3 img4 TRANSP_COLOR [| (0, 0, 0) |];
  p3_lay_p1 p3 img2 TRANSP_COLOR [| (0, 0, 0) |];
  for y = 1 to 7 do
    let col = cols.(Random.int (Array.length cols)) in
    let x1 = range 10 50 in
    let x2 = range 60 110 in
    for x = x1 to x2 do
      let y = y * 9 in
      put_p3_rgb p3 x y col;
    done;
  done;
  print_p3 p3;
  free_img img4;
  free_img img3;
  free_img img2;
  free_img img;
  free_p3 p3;
;;

