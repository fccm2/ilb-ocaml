type f3 = F0 | F1 | F2 | F3 | F7
type f4 = F4 | F5 | F6
type i3 = In of int | Ir of int * int
type op3 =
  | Img_r of (int * int)
  | Lin_r of (i3 * i3) * (i3 * i3) * int * f3 * f4
  | Tri_r of (i3 * i3) * (i3 * i3) * (i3 * i3) * int * f3 * f4
  | Sirc_r of (i3 * i3) * i3 * int * f3 * f4
  | Rect_s of (i3 * i3 * i3 * i3) * int
  | Rect_r of (i3 * i3 * i3 * i3) * int * f3 * f4
  | Circ_s of (i3 * i3) * i3 * int
  | Circ_r of (i3 * i3) * i3 * int * f3 * f4
  | Px_r of (i3 * i3) * int * f3 * f4
val op_an_f : int -> op3 list -> unit
