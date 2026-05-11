type f3 = F1 | F2 | F3 | F7
type f4 = F4
type i4 = Il of int list | In of int
type c = int * int * int
type op4 =
  | Img_r of (int * int)
  | Lin_r of (i4 * i4) * (i4 * i4) * c * f3 * f4
  | Tri_r of (i4 * i4) * (i4 * i4) * (i4 * i4) * c * f3 * f4
  | Sirc_r of (i4 * i4) * i4 * c * f3 * f4
  | Rect_s of (i4 * i4 * i4 * i4) * c
  | Rect_r of (i4 * i4 * i4 * i4) * c * f3 * f4
  | Circ_s of (i4 * i4) * i4 * c
  | Circ_r of (i4 * i4) * i4 * c * f3 * f4
  | Px_r of (i4 * i4) * c * f3 * f4
val op_an_f : int -> op4 list -> unit
