open Imlb

let plot_img () =
  Random.self_init ();
  let img = create_img 120 80 in
  draw_mana img begin (* plots *)
    Array.init 80 (fun _ ->
      let plots = {
        x = Random.int 100;
        y = Random.int 80;
        v = Random.int 2;
      } in
      (plots)
    )
  end;
  (img)
;;

let () =
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  for i = 0 to pred 10 do
    let x = Random.int 100 in
    let y = Random.int 80 in
    let r = Random.int 50 in
    draw_circ img (x, y) r 1;
  done;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let cols = [|
    (0, 0, 255);
    (0, 255, 0);
    (255, 0, 0);
  |] in
  for y = 2 to 6 do
    let y = y * 10 in
    for x = 20 to 100 do
      let col = cols.(Random.int (Array.length cols)) in
      put_p3_rgb p3 x y col;
    done;
  done;
  let img2 = plot_img () in
  p3_lay_p1 p3 img2 TRANSP_COLOR [| (255, 0, 0) |];
  (*
  print_img img2;
  print_img img;
  *)
  (*
  *)
  print_p3 p3;
  free_img img2;
  free_img img;
  free_p3 p3;
;;

