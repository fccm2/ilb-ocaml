open Imlb

let range a b =
  a + (Random.int (b - a))

let ds = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19;
  20; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30; 31; 32; 33; 34; 35; 36; 37; 38;
  39; 40; 41; 42; 43; 44; 45; 46; 47; 48; 49; 50; 51; 52; 53; 54; 55; 56; 57;
  58; 59; 60; 61; 62; 63; 64; 65; 66; 67; 68; 69; 70; 71; 72; 73; 74; 75; 76;
  77; 78; 79]

let squares = List.map (fun d -> (d * d)) ds
let squares_assoc =  (* map2: not-tail-rec *)
  List.map2 (fun a b -> let c = (a, b) in (c))
    squares ds

let _sqrt d =
  List.assoc d squares_assoc

let _sqrt_opt d =
  try Some (List.assoc d squares_assoc)
  with Not_found -> (None)

let floor_sqrt d =
  let rec aux d =
    if d < 0 then 0 else
    match _sqrt_opt d with
    | Some (v) -> (v)
    | None -> aux (pred d)
  in
  aux d

let dist p1 p2 =
  let x1, y1 = (p1) in
  let x2, y2 = (p2) in

  let dx = (x2 - x1) in
  let dy = (y2 - y1) in

  let sq_dist = (dx * dx) + (dy * dy) in

  floor_sqrt (sq_dist)

let sq_dist p1 p2 =
  let x1, y1 = (p1) in
  let x2, y2 = (p2) in

  let dx = (x2 - x1) in
  let dy = (y2 - y1) in

  let sq_dist = (dx * dx) + (dy * dy) in

  (sq_dist)

let strk_circ (w, h) cx cy r () =
  let _x1 = cx - r in
  let _y1 = cy - r in
  let _x2 = cx + r in
  let _y2 = cy + r in

  let r2 = r * r in

  let lst = ref [] in
  for y = _y1 to _y2 do
    for x = _x1 to _x2 do
      let p = (x, y) in
      let c = (cx, cy) in
      let d = sq_dist c p in
      (*
      if ((r2 - d) < (r*2)) then
      *)
      if abs (r2 - d) < 12 then
        lst := (x, y) :: !lst
    done;
  done;
  (!lst)
;;

let draw_circ (w, h) cx cy r () =
  let _x1 = cx - r in
  let _y1 = cy - r in
  let _x2 = cx + r in
  let _y2 = cy + r in

  let lst = ref [] in
  for y = _y1 to _y2 do
    for x = _x1 to _x2 do
      let p = (x, y) in
      let c = (cx, cy) in
      let d = dist c p in
      if x >= 0 && x < w then
      begin
        if y >= 0 && y < h then
        begin
          if (d < r) then
          begin
            lst := (x, y) :: !lst
          end;
        end;
      end;
    done;
  done;
  (!lst)
;;

let main1 () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let cx, cy = (20, 40) in
  let ps = draw_circ (120, 80) cx cy 40 () in
  List.iter (fun (x, y) ->
    let cols = [|
      (255, 255, 0);
      (255, 0, 255);
      (0, 0, 255);
      (0, 255, 0);
      (255, 0, 0);
    |] in
    let col = cols.(Random.int (Array.length cols)) in
    let (r, g, b) = col in
    let col = (r, g, b) in
    put_p3_rgb p3 x y col;
  ) ps;
  print_p3 p3;
  free_p3 p3;
  free_img img;
;;

let main2 () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  draw_rect img (0, 10, 90, 50) 1;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let cx, cy = (36, 44) in
  let ps = strk_circ (120, 80) cx cy 30 () in
  List.iter (fun (x, y) ->
    let cols = [|
      (255, 255, 0);
      (255, 0, 255);
      (0, 0, 255);
      (0, 255, 0);
      (255, 0, 0);
    |] in
    let col = cols.(Random.int (Array.length cols)) in
    let (r, g, b) = col in
    let col = (r, g, b) in
    put_p3_rgb p3 x y col;
  ) ps;
  print_p3 p3;
  free_p3 p3;
  free_img img;
;;

let rect_pnt (x, y, w, h) acc =
  let lst = ref acc in
  for _x = x to (x + w) do
    lst := (_x, y) :: !lst;
    lst := (_x, y + h) :: !lst;
  done;
  for _y = y + 1 to pred (y + h) do
    lst := (x, _y) :: !lst;
    lst := (x + w, _y) :: !lst;
  done;
  (!lst)

let main3 () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  Imlb.draw_circ img (10, 36) 50 1;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let ps = rect_pnt (6, 14, 90, 50) [] in
  let ps = rect_pnt (28, 58, 36, 14) ps in
  List.iter (fun (x, y) ->
    let cols = [|
      (255, 255, 0);
      (255, 0, 255);
      (0, 0, 255);
      (0, 255, 0);
      (255, 0, 0);
    |] in
    let col = cols.(Random.int (Array.length cols)) in
    let (r, g, b) = col in
    let col = (r, g, b) in
    put_p3_rgb p3 x y col;
  ) ps;
  print_p3 p3;
  free_p3 p3;
  free_img img;
;;

let main4 () =
  Random.self_init ();
  let p3 = create_p3 120 80 in
  let img = create_img 120 80 in
  let w = range 36 52 in
  let w2 = range 4 8 in
  draw_rect img (0, 0, w, 80) 1;
  draw_rect img (120 - 26 - w2, 0, 26 + w2, 80) 1;
  if p3_p1_eq_size p3 img
  then p3_of_p1 p3 img;
  let rec aux d acc =
    if d <= 0 then acc else
    let x1 = range 4 36 in
    let dr = (3 - d) in
    let y1 = range (dr * 14 + 2) (dr * 14 + 26) in
    let w = range 26 62 in
    let h = range 18 28 in
    let ps = rect_pnt (x1, y1, w, h) acc in
    aux (pred d) (ps)
  in
  let ps = aux 3 [] in
  let rec aux2 d acc =
    if d <= 0 then acc else
    let cx = range 82 96 in
    let dr = (3 - d) in
    let cy = range (dr * 14 + 6) (dr * 14 + 26) in
    let r = range 6 22 in
    let ps = strk_circ (120, 80) cx cy r () in
    aux2 (pred d) (ps @ acc)
  in
  let ps = aux2 4 ps in
  List.iter (fun (x, y) ->
    let cols = [|
      (255, 255, 0);
      (255, 0, 255);
      (0, 0, 255);
      (0, 255, 0);
      (255, 0, 0);
    |] in
    let col = cols.(Random.int (Array.length cols)) in
    let (r, g, b) = col in
    let col = (r, g, b) in
    put_p3_rgb p3 x y col;
  ) ps;
  print_p3 p3;
  free_p3 p3;
  free_img img;
;;

let main = main1
let main = main2
let main = main3
let main = main4

let () = main ()

