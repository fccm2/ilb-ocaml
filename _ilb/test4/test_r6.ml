open OpAm
let () =
  let op_r = [
    Img_r (120, 90);
    Lin_r ((Ir (0, 20), In 10), (Ir (90, 110), In 80), 1, F1, F4);
    Tri_r ((In 40, In 20), (In 20, In 70), (In 90, In 60), 1, F1, F4);
  ] in
  op_an_f 3 op_r
