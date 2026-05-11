open Imlb

let main1 () =
  let img = create_img 120 80 in
  draw_rect img (10, 10, 50, 30) 1;
  draw_circ img (80, 60) (12) 1;

  print_img img;
  free_img img;
;;

let main2 () =
  let img = create_img 120 80 in
  for i = 0 to pred 10 do
    let x = (10) + (i * 10) in
    draw_losng img (x, 30) 20 1;
  done;
  print_img img;
  free_img img;
;;

let main3 () =
  let img = create_img 120 80 in
  for i = 0 to pred 30 do
    let x = (10) + (i * 10) in
    put_px img (x, 10) 1;
    put_px img (x, 20) 1;
    put_px img (x, 30) 1;
    put_px img (x, 40) 1;
  done;
  print_img img;
  free_img img;
;;

let main4 () =
  let img = create_img 120 80 in
  draw_line img (10, 40) (60, 50) 1;
  draw_line img (10, 10) (20, 60) 1;
  print_img img;
  free_img img;
;;

let main5 () =
  let img = create_img 120 80 in
  draw_line img (60, 40) (10, 50) 1;

  draw_line img (10, 50) (60, 50) 1;

  draw_line img (10, 50) (20, 10) 1;

  print_img img;
  free_img img;
;;

let main6 () =
  let img = create_img 120 80 in

  draw_line img (32, 32) (40, 40) 1;
  draw_line img (32, 28) (40, 20) 1;
  draw_line img (28, 28) (20, 20) 1;
  draw_line img (28, 32) (20, 40) 1;

  print_img img;
  free_img img;
;;

let main7 () =
  let img = create_img 120 80 in

  quad_bcurve img (10, 60) (40, 10) (70, 70) 1;

  print_img img;
  free_img img;
;;

let main8 () =
  let img = create_img 32 32 in
  draw_rect img (10,  6, 12,  2) 1;
  draw_rect img ( 8,  8,  2, 16) 1;
  draw_rect img (10, 24, 12,  2) 1;

  draw_rect img (22,  8,  2,  2) 1;
  draw_rect img (22, 22,  2,  2) 1;

  print_img img;
  free_img img;
;;

let main9 () =
  let img = create_img 32 32 in
  draw_rect img (10,  6, 12,  2) 1;
  draw_rect img ( 6,  8,  4, 16) 1;
  draw_rect img (10, 24, 12,  2) 1;

  draw_rect img (22,  8,  4,  4) 1;
  draw_rect img (22, 20,  4,  4) 1;

  print_img img;
  free_img img;
;;

let main10 () =
  let img = create_img 120 80 in
  (*
  draw_rect img (10, 10, 50, 30) 1;
  *)
  strk_circ img (20, 20) (48) 1;
  strk_circ img (50, 30) (26) 1;
  strk_circ img (56, 34) (22) 1;
  strk_circ img (58, 36) (16) 1;

  strk_circ img (10, 10) (89) 1;
  strk_circ img (-20, -20) (150) 1;

  print_img img;
  free_img img;
;;

let main11 () =
  Random.self_init ();
  let img = create_img 120 80 in
  draw_rect img (0, 0, 120, 80) 0;

  for _ = 0 to pred 20 do
    let y1 = Random.int 80 in
    let y2 = Random.int 80 in
    draw_line img (0, y1) (120, y2) 1;
  done;

  print_img img;
  free_img img;
;;

let rand_range a b =
  a + (Random.int (b - a))

let main12 () =
  Random.self_init ();
  let img = create_img 80 100 in
  draw_rect img (0, 90, 80, 10) 1;
  draw_rect img (50, 40, 20, 60) 3;
  draw_rect img (13, 28, 20, 72) 3;
  draw_rect img (60, 50, 5, 10) 0;
  draw_circ img (14, 26) (10) 3;
  (*
  draw_rect img (35, 5, 40, 25) 1;
  *)
  for _ = 0 to pred 7 do
    let x = rand_range 35 (35 + 40) in
    let y = rand_range  5 ( 5 + 25) in
    put_px img (x, y) 3;
  done;
  quad_bcurve img (-14, 89) (14, 61) (53, 89) 1;
  print_img img;
  free_img img;
;;

let main13 () =
  let img = create_img 80 100 in
  draw_rect img (25, 30, 30, 35) 1;
  draw_circ img (40, 30) (11) 1;
  draw_circ img (40, 30) (7) 0;
  put_px img (40 - 3, 28) 1;
  put_px img (40 + 3, 28) 1;
  draw_line img (25, 36) (12, 41) 1;
  draw_line img (80 - 25, 36) (80 - 12, 41) 1;
  draw_line img (34, 65) (34, 75) 1;
  draw_line img (80 - 34, 65) (80 - 34, 75) 1;
  print_img img;
  free_img img;
;;

let main14 () =
  Random.self_init ();
  let plots = Array.init 60 (fun _ -> Random.int 100, Random.int 80, Random.int 2, 0) in
  let img = create_img 100 80 in
  for y = 0 to pred 80 do
    for x = 0 to pred 100 do
      let _, _, v, _ =
        Array.fold_left
          (fun (xp, yp, vp, dp) (_x, _y, v, d) ->
            let _d = mana_dist (x, y) (_x, _y) in
            if _d < dp
            then (_x, _y, v, _d)
            else (xp, yp, vp, dp)
          )
          (0, 0, 1, 260)
          plots
      in
      put_px img (x, y) v;
    done;
  done;
  print_img img;
  free_img img;
;;

let main15 () =
  let img = create_img 30 8 in
  draw_letter img (10, 2) 'c' 1;
  draw_letter img (16, 2) 'd' 1;
  draw_letter img (22, 2) 'e' 1;
  print_img img;
  free_img img;
;;

let main16 () =
  Random.self_init ();
  let img = create_img 120 60 in
  let za_diff = (int_of_char 'z' - int_of_char 'a') in
  let zn_diff = (int_of_char '9' - int_of_char '0') in
  let rand_letter () = (int_of_char 'a' + Random.int za_diff) in
  let rand_num () = (int_of_char '0' + Random.int zn_diff) in
  for j = 0 to pred 4 do
    let y = 2 + (j * 8) in
    for i = 0 to pred 18 do
      let c = rand_letter () in
      let x = 2 + (i * 6) in
      draw_letter img (x, y) (char_of_int c) 1;
    done;
  done;
  for i = 0 to pred 16 do
    let c = rand_num () in
    let x = 2 + (i * 6) in
    draw_letter img (x, 49) (char_of_int c) 1;
  done;
  let y = 2 + (4 * 8) in
  String.iteri (fun i c ->
    let x = 2 + (i * 6) in
    draw_letter img (x, y) (c) 1;
  ) "<img> ltr{c[0]}";
  print_img img;
  free_img img;
;;

let main17 () =
  Random.self_init ();
  let img = create_img 120 80 in
  let range_rnd a b =
    a + (Random.int b - a)
  in
  for _ = 0 to pred 16 do
    let x = range_rnd (-20) (120 + 2*20) in
    let y = range_rnd (-10) ( 80 + 2*10) in
    let r = range_rnd (6) (120) in
    strk_circ img (x, y) (r) 1;
  done;
  print_img img;
  free_img img;
;;

let main18 () =
  let img = create_img 120 80 in
  draw_tri img (79, 59) (60, 12) (33, 50) 1;
  (*
  draw_tri img (79, 59) (33, 50) (60, 12) 1;
  draw_tri img (60, 12) (79, 59) (33, 50) 1;
  *)
  print_img img;
  free_img img;
;;

let read_file fn =
  let ic = open_in fn in
  let n = in_channel_length ic in
  let s = really_input_string ic n in
  close_in ic;
  (s)

let main19 () =
  let s = read_file "img17l.pbm" in
  let img = read_p1 s in
  (*
  let img = read_p1 "string producing an error" in
  *)
  print_img img;
  free_img img;
  (*
  ignore (img)
  *)
;;

let main20 () =
  let img = create_img 120 80 in
  draw_rect img (20, 10, 30, 20) 1;
  let ba = get_ba img in
  Printf.printf "P1\n";
  Printf.printf "%d %d\n" 120 80;
  for y = 0 to pred 80 do
    for x = 0 to pred 120 do
      if x = 0
      then Printf.printf  "%d" ba.{y,x}
      else Printf.printf " %d" ba.{y,x};
    done;
    Printf.printf "\n";
  done;
  free_img img;
;;

let main21 () =
  let img = create_img 120 80 in
  (*
  draw_tri img (79, 59) (60, 12) (33, 50) 1;
  *)
  draw_cnvx img [| (79, 59); (60, 12); (33, 50); |] 1;
  print_img img;
  free_img img;
;;

let main22 () =
  Random.self_init ();
  let plots =
    Array.init 60 (fun _ ->
      let plots = {
        x = Random.int 100;
        y = Random.int 80;
        v = Random.int 2;
      } in
      (plots)
    )
  in
  let img = create_img 100 80 in
  draw_mana img plots;
  print_img img;
  free_img img;
;;

let () =
  match Sys.argv.(1) with
  | "1" -> main1 ()
  | "2" -> main2 ()
  | "3" -> main3 ()
  | "4" -> main4 ()
  | "5" -> main5 ()
  | "6" -> main6 ()
  | "7" -> main7 ()
  | "8" -> main8 ()
  | "9" -> main9 ()
  | "10" -> main10 ()
  | "11" -> main11 ()
  | "12" -> main12 ()
  | "13" -> main13 ()
  | "14" -> main14 ()
  | "15" -> main15 ()
  | "16" -> main16 ()
  | "17" -> main17 ()
  | "18" -> main18 ()
  | "19" -> main19 ()
  | "20" -> main20 ()
  | "21" -> main21 ()
  | "22" -> main22 ()
  | _ -> ()
