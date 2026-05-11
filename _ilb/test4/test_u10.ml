open Imlb
open OpAm6
let an0 () =
  let c0 = (0, 0, 255) in
  let c1 = (255, 255, 0) in
  let c2 = (255, 255, 255) in
  let c3 = (1, 0, 0) in
  let ol = [
    Img_r ((120, 90), 3);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Rect_s ((Iv 20, Iv 20, In 40, In 60), c1);
    Rect_s ((Iv 90, Iv 50, In 20, In 30), c2);
  ] in
  let ol2 = [
    Img_r ((120, 90), 1);
    Rect_s ((Iv 50, Iv 40, In 20, In 20), c3);
  ] in
  let ol3 = [
    Img_r ((120, 90), 1);
    Rest_s ((Iv 50, Iv 40, In 20, In 20), c3);
  ] in
  let ol = [
    Base ((120, 90), ol);
    Layer (TRANSP_COLOR, [| (255, 255, 0) |], ol2);
    Layer (TRANSP_COLOR, [| (0, 0, 255) |], ol3);
  ] in
  (*
  let ol = [
    Img_r (120, 90);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Rect_s ((Iv 20, Iv 20, In 40, In 60), c1);
    Rect_s ((Iv 90, Iv 50, In 20, In 30), c2);
  ] in
  *)
  op_an_f 3 ol

let an1 () =
  let c0 = (0, 0, 255) in
  let c1 = (255, 255, 0) in
  let c2 = (255, 255, 255) in
  let c3 = (1, 0, 0) in
  let ol = [
    Img_r ((120, 90), 3);
    Rect_s ((In 0, In 0, In 120, In 90), c0);
    Rect_s ((Iv 20, Iv 20, In 40, In 60), c1);
    Rect_s ((Iv 90, Iv 50, In 20, In 30), c2);
  ] in
  let ol2 = [
    Img_r ((120, 90), 1);
    Rect_s ((Iv 50, Iv 40, In 20, In 20), c3);
  ] in
  let ol3 = [
    Img_r ((120, 90), 1);
    Rest_s ((Iv 50, Iv 40, In 20, In 20), c3);
  ] in
  let ol = [
    Base ((120, 90), ol);
    Layer (TRANSP_COLOR, [| (255, 255, 0) |], ol2);
    Layer (TRANSP_COLOR, [| (0, 0, 255) |], ol3);
  ] in
  op_an_f 3 ol

let an2 () =
  let c2 = (255, 255, 255) in
  let c3 = (1, 0, 0) in
  let c4 = (3, 0, 0) in
  let ol1 = [
    Img_r ((120, 90), 3);
  ] in
  let ol2 = [
    Img_r ((120, 90), 1);
    Rect_s ((Iv 20, Iv 20, In 40, In 60), c3);
    Rect_s ((Iv 50, Iv 30, In 20, In 10), c4);
    Rect_s ((Iv 50, Iv 50, In 20, In 10), c4);
  ] in
  let ol3 = [
    Img_r ((120, 90), 1);
    Rect_s ((Iv 90, Iv 50, In 20, In 30), c3);
  ] in
  let ol = [
    Base ((120, 90), ol1);
    Layer (TWO_COLOR, [| (0, 0, 255); (255, 255, 0) |], ol2);
    Layer (TRANSP_COLOR, [| c2 |], ol3);
  ] in
  op_an_f 3 ol

let an3 () =
  Random.self_init ();
  let c1 = (255, 255, 255) in
  let c3 = (1, 0, 0) in
  (*
  let c4 = (3, 0, 0) in
  *)
  let rnd_tk ar =
    let n = Array.length ar in
    ar.(Random.int n)
  in
  let flt_af = [| F3; F7 |] in
  let f () = rnd_tk flt_af in
  let r a b =
    a + (Random.int (b - a))
  in
  let ol1 = [
    Img_r ((120, 90), 3);
    Rect_s ((In 0, In 0, In 120, In 90), c1);
  ] in
  let ol2 = [
    Img_r ((120, 90), 1);
    Rect_r ((Iv 10, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 28, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 46, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 64, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 77, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 95, Iv (r 34 36), In 12, Ir (40, 44)), c3, f(), F5);
  ] in
  let ol3 = [
    Img_r ((120, 90), 1);
    Rest_r ((Iv 3, Iv 3, In 112, In 80), c3, F1, F4);
  ] in
  let ol = [
    Base ((120, 90), ol1);
    Layer (TRANSP_COLOR, [| (0, 0, 0) |], ol2);
    Layer (TRANSP_COLOR, [| (0, 0, 0) |], ol3);
  ] in
  op_an_f 3 ol

let an4 () =
  Random.self_init ();
  let c1 = (255, 255, 255) in
  let c3 = (1, 0, 0) in
  let c4 = (3, 0, 0) in
  let rnd_tk ar =
    let n = Array.length ar in
    ar.(Random.int n)
  in
  let flt_af = [| F3; F7 |] in
  let f () = rnd_tk flt_af in
  let r a b =
    a + (Random.int (b - a))
  in
  let ol1 = [
    Img_r ((120, 90), 3);
    Rect_s ((In 0, In 0, In 120, In 90), c1);
  ] in
  let ol2 = [
    Img_r ((120, 90), 1);
    Rect_r ((Iv 10, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 28, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 46, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 64, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 77, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Rect_r ((Iv 95, Iv (r 36 37), In 12, Ir (40, 44)), c3, f(), F5);
    Lin_r ((In 0, In 76), (In 120, In 76), c4, F1, F4);
  ] in
  let ol3 = [
    Img_r ((120, 90), 1);
    Rest_r ((Iv 3, Iv 3, In 112, In 80), c3, F1, F4);
  ] in
  let ol4 = [
    Img_r ((120, 90), 1);
    Sirc_r ((In 108, In 8), In 12, c3, F1, F4);
  ] in
  let ol5 =
    List.init 46 (fun _ ->
      Px_r ((In (r 10 90), In (r 5 19)), c3, F9, F4);
    )
  in
  let ol4 = ol4 @ ol5 in
  let ol = [
    Base ((120, 90), ol1);
    Layer (TRANSP_COLOR, [| (0, 0, 0) |], ol2);
    Layer (TRANSP_COLOR, [| (0, 0, 0) |], ol3);
    Layer (TRANSP_COLOR, [| (0, 0, 0) |], ol4);
  ] in
  op_an_f 3 ol

let am_ () =
  match Sys.argv.(1) with
  | "am0" -> an0
  | "am1" -> an1
  | "am2" -> an2
  | "am3" -> an3
  | "am4" -> an4
  | _ -> an4
let am = try am_ () with _ -> an4
let () = am ()
