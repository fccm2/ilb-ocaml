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
  let res = [
    Base ((120, 90), [
      Img ((120, 90), "img0");
      Circ ((range 10 110, range 10 80), range 20 36, 1, "img0");
      Circ ((range 10 110, range 10 80), range 20 36, 1, "img0");
      Circ ((range 10 110, range 10 80), range 20 36, 1, "img0");
    ]);
    Layer (TRANSP_COLOR, [| (0, 255, 0) |], [
      Img ((120, 90), "img1");
      Mana ("img1", plots);
    ]);
  ] in
  op_lay_f res;
;;
