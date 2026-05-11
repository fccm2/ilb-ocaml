type f3 = F1 | F2 | F3 | F7 | F9
type f4 = F4 | F5
type i4 = Il of int list | In of int | Iv of int | Ir of int * int
type c = int * int * int
type op4 =
  | Img_r of ((int * int) * int)
  | Lin_r of (i4 * i4) * (i4 * i4) * c * f3 * f4
  | Tri_r of (i4 * i4) * (i4 * i4) * (i4 * i4) * c * f3 * f4
  | Sirc_r of (i4 * i4) * i4 * c * f3 * f4
  | Rest_s of (i4 * i4 * i4 * i4) * c
  | Rest_r of (i4 * i4 * i4 * i4) * c * f3 * f4
  | Rect_s of (i4 * i4 * i4 * i4) * c
  | Rect_r of (i4 * i4 * i4 * i4) * c * f3 * f4
  | Quad_r of (i4 * i4) * (i4 * i4) * (i4 * i4) * c * f3 * f4
  | Circ_s of (i4 * i4) * i4 * c
  | Circ_r of (i4 * i4) * i4 * c * f3 * f4
  | Px_r of (i4 * i4) * c * f3 * f4
type lay4 =
  | Layer of Imlb.append_mode * (int * int * int) array * op4 list
  | Base of (int * int) * op4 list
val op_an_f : int -> lay4 list -> unit
