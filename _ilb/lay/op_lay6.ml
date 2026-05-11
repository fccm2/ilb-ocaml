open Imlb
let () =
  let res = [
    Base ((120, 90), [
      Img ((120, 90), "img0");
    ]);
    Layer (TWO_COLOR, [| (0, 0, 255); (255, 255, 0) |], [
      Img ((120, 90), "img1");
      Rect ((20, 20, 40, 60), 1, "img1");
      Rect ((50, 30, 20, 10), 3, "img1");
      Rect ((50, 50, 20, 10), 3, "img1");
    ]);
    Layer (TRANSP_COLOR, [| (255, 255, 255) |], [
      Img ((120, 90), "img2");
      Rect ((90, 50, 20, 30), 1, "img2");
    ]);
  ] in
  op_lay_f res;
;;
