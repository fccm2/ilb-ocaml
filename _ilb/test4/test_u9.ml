open Imlb
open OpAm5
let an0 () =
  let c0 = (255, 255, 255) in
  let ol = [
    Img_r (120, 90);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
  ] in
  op_an_f 1 ol
let an2 () =
  let c0 = (255, 255, 255) in
  let c1 = (0, 0, 0) in
  let ol = [
    Img_r (120, 90);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Quad_r ((In 0, Ir (10, 60)), (Ir (60, 90), Ir (30, 50)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 60)), (Ir (60, 90), Ir (30, 50)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 60)), (Ir (60, 90), Ir (30, 50)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 60)), (Ir (60, 90), Ir (30, 50)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 60)), (Ir (60, 90), Ir (30, 50)), (Ir (40, 116), In 90), c1, F1, F4);
  ] in
  op_an_f 3 ol
let an1 () =
  let c0 = (255, 255, 255) in
  let c1 = (0, 0, 0) in
  let ol = [
    Img_r (120, 90);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Quad_r ((In 0, Ir (10, 80)), (Ir (70, 90), Ir (20, 40)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 80)), (Ir (70, 90), Ir (20, 40)), (Ir (40, 116), In 90), c1, F1, F4);
    Quad_r ((In 0, Ir (10, 80)), (Ir (70, 90), Ir (20, 40)), (Ir (40, 116), In 90), c1, F1, F4);
  ] in
  op_an_f 3 ol
let an3 () =
  let c0 = (0, 0, 255) in
  let c1 = (255, 255, 0) in
  let c2 = (255, 255, 255) in
  let ol = [
    Img_r (120, 90);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Rect_s ((Iv 20, Iv 20, In 40, In 60), c1);
    Rect_s ((Iv 90, Iv 50, In 20, In 30), c2);
  ] in
  op_an_f 3 ol
let an = an0
let an = an1
let an = an2
let an = an3
let () = an ()
