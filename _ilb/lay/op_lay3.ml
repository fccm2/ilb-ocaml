open Imlb
let range a b =
  a + (Random.int (b - a))
let () =
  Random.self_init ();
  let plots =
    Array.init 14 (fun _ ->
      let x = Random.int 120 in
      let y = Random.int 90 in
      let v = Random.int 2 in
      (x, y, v)
    )
  in
  let a_cx = range 10 110 in
  let a_cy = range 10 80 in
  let a_r = range 20 36 in

  let b_cx = range 10 110 in
  let b_cy = range 10 80 in
  let b_r = range 20 36 in

  let c_cx = range 10 110 in
  let c_cy = range 10 80 in
  let c_r = range 20 36 in

  let res = [
    Base ((120, 90), [
      Img ((120, 90), "img0");
      Circ ((a_cx, a_cy), a_r, 1, "img0");
      Circ ((b_cx, b_cy), b_r, 1, "img0");
      Circ ((c_cx, c_cy), c_r, 1, "img0");
    ]);
    Layer (TRANSP_COLOR, [| (0, 255, 0) |], [
      Img ((120, 90), "img1");
      Mana ("img1", plots);
    ]);
  ] in

  let next_c c =
    match Random.int 3 with
    | 0 -> c
    | 1 -> c + 1
    | 2 -> c - 1
    | _ -> assert false
  in

  let next_p plots =
    Array.map (fun (x, y, v) ->
      (next_c x, next_c y, v)
    ) plots
  in

  let next_op op =
    List.map (fun op ->
      match op with
      | Circ ((cx, cy), r, v, name) ->
          Circ ((next_c cx, next_c cy), next_c r, v, name)
      | Mana (name, plots) ->
          Mana (name, next_p plots)
      | prim -> prim
    ) op
  in

  let next_r res =
    List.map (fun res ->
      match res with
      | Layer (append_mode, color, op) ->
          Layer (append_mode, color, next_op op)
      | Base ((dims), op) ->
          Base ((dims), next_op op)
    ) res
  in

  let rec aux d res =
    if d < 0 then () else
    begin
      Printf.printf "(*%d*)\n%!" (11 - d);
      op_lay_f res;
      aux (pred d) (next_r res)
    end
  in
  aux 11 res
;;
