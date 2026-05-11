open Imlb
let () =
  let res = [
    Base ((120, 90), [ (* base *)
      Img ((120, 90), "img0");
    ]);
    Layer (TRANSP_COLOR, [| (110, 10, 50) |], [ (* up-rect *)
      Img ((120, 90), "imga");
      Rect ((0, 0, 120, 45), 1, "imga");
    ]);
    Layer (TRANSP_COLOR, [| (90, 10, 40) |], [ (* bot-rect *)
      Img ((120, 90), "imgb");
      Rect ((0, 45, 120, 45), 1, "imgb");
    ]);
    Layer (TRANSP_COLOR, [| (120, 10, 40) |], [ (* bottom *)
      Img ((120, 90), "img1");
      Circ ((60, 45), 30, 1, "img1");
      Rect ((0, 0, 120, 45), 0, "img1");
    ]);
    Layer (TRANSP_COLOR, [| (130, 20, 70) |], [ (* up *)
      Img ((120, 90), "img2");
      Circ ((60, 45), 30, 1, "img2");
      Rect ((0, 45, 120, 45), 0, "img2");
    ]);
  ] in
  op_lay_f res;
;;
