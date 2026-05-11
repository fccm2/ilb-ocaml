open Imlb

let f (plots) =
  let op = [
    Img ((120, 90), "img1");
    Mana ("img1", plots);
    Print "img1";
    Free "img1";
  ] in
  op_f op;
;;

let () =
  Random.self_init ();
  let plots =
    Array.init 80 (fun _ ->
      let x = Random.int 120 in
      let y = Random.int 90 in
      let v = Random.int 2 in
      let plot = (x, y, v) in
      (plot)
    )
  in
  let aux_f plots =
    let op = [
      Img ((120, 90), "img1");
      Mana ("img1", plots);
      Print "img1";
      Free "img1";
    ] in
    op_f op;
  in
  let next plots =
    Array.map (fun (x, y, v) ->
      let f z =
        match Random.int 3 with
        | 0 -> z
        | 1 -> z + 1
        | 2 -> z - 1
        | _ -> assert false
      in
      let x = f x in
      let y = f y in
      (x, y, v)
    ) plots
  in
  let rec aux plots d =
    if d <= 0 then () else
    begin
      aux_f plots;
      let plots = next plots in
      aux plots (pred d)
    end
  in
  aux plots 10
;;
