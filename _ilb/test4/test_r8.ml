open OpAm
let () = Random.self_init () ;;
let an1 () =
  let op_r = [
    Img_r (120, 90);
    Rect_s ((In (0), In (0), In 53, In 90), 1);
    Lin_r ((In (50), In 0), (In (50), In 90), 3, F1, F4);
    Lin_r ((Ir (0, 30), Ir (10, 20)), (Ir (90, 110), Ir (40, 80)), 3, F1, F4);
    Tri_r ((Ir (20, 40), In 20), (In 20, In 70), (Ir (80, 90), Ir (40, 70)), 3, F1, F4);
  ] in
  let ps =
    List.init 34 (fun _ ->
      Px_r ((Ir (10, 20), Ir (0, 90)), 0, F1, F5);
    )
  in
  let op_r = op_r @ ps in
  op_an_f 5 op_r
let an2 () =
  let op_r = [
    Img_r (120, 90);
    Lin_r ((In 20, Ir (25, 27)), (In 100, Ir (25, 27)), 3, F1, F4);
    Lin_r ((In 20, Ir (40, 42)), (In 100, Ir (40, 42)), 3, F1, F4);
    Lin_r ((In 20, Ir (55, 57)), (In 100, Ir (55, 57)), 3, F1, F4);
  ] in
  op_an_f 3 op_r
let an3 () =
  let op_r = [
    Img_r (120, 90);
    Lin_r ((Ir (40, 41), Ir (20, 22)), (Ir (40, 41), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (65, 66), Ir (20, 22)), (Ir (65, 66), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (90, 91), Ir (20, 22)), (Ir (90, 91), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (115, 116), Ir (20, 22)), (Ir (115, 116), Ir (98, 110)), 3, F1, F4);
  ] in
  op_an_f 3 op_r
let an4 () =
  let op_r = [
    Img_r (120, 90);
    Lin_r ((Ir (30, 31), Ir (20, 22)), (Ir (30, 31), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (50, 51), Ir (20, 22)), (Ir (50, 51), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (70, 71), Ir (20, 22)), (Ir (70, 71), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (90, 91), Ir (20, 22)), (Ir (90, 91), Ir (98, 110)), 3, F1, F4);
    Lin_r ((Ir (110, 111), Ir (20, 22)), (Ir (110, 111), Ir (98, 110)), 3, F1, F4);
  ] in
  op_an_f 3 op_r
let an5 () =
  let op_r = [
    Img_r (120, 90);
    Lin_r ((Ir (30, 31), Ir (29, 31)), (Ir (30, 31), Ir (93, 104)), 3, F1, F4);
    Sirc_r ((In 30, In 30), In 24, 1, F1, F4);
    Circ_s ((In 90, In 60), In 14, 1);
    Sirc_r ((In 90, In 60), In 14, 0, F1, F4);
    Sirc_r ((In 90, In 60), In 12, 0, F1, F4);
    Sirc_r ((In 90, In 60), In 16, 1, F1, F4);
    Sirc_r ((In 106, In 10), In 7, 1, F1, F4);
    Lin_r ((Ir (70, 71), In (17)), (Ir (75, 76), In (17)), 1, F1, F4);
    Lin_r ((Ir (53, 54), In (61)), (Ir (116, 117), In (61)), 3, F1, F4);
    Lin_r ((Ir (70, 71), In (14)), (Ir (111, 112), In (14)), 3, F1, F4);
  ] in
  op_an_f 3 op_r
let an6 () =
  let op_r = [
    Img_r (120, 90);
    Circ_r ((In 20, In 30), In 52, 3, F3, F4);
  ] in
  op_an_f 3 op_r
let an7 () =
  let op_r = [
    Img_r (120, 90);
    Rect_r ((In 10, In 10, In 40, In 22), 1, F0, F4);
    Rect_r ((In 60, In 10, In 40, In 22), 1, F1, F4);
    Rect_r ((In 10, In 36, In 40, In 22), 1, F7, F4);
    Rect_r ((In 60, In 36, In 40, In 22), 1, F3, F4);
  ] in
  op_an_f 3 op_r
let () =
  match Sys.argv.(1) with
  | "an1" -> an1 ()
  | "an2" -> an2 ()
  | "an3" -> an3 ()
  | "an4" -> an4 ()
  | "an5" -> an5 ()
  | "an6" -> an6 ()
  | "an7" -> an7 ()
  | _ -> assert false
