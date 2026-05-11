type img
val create_img : int -> int -> img
val free_img : img -> unit

val strk_rect : img -> int * int * int * int -> int -> unit
val draw_rect : img -> int * int * int * int -> int -> unit
val draw_circ : img -> int * int -> int -> int -> unit
val strk_circ : img -> int * int -> int -> int -> unit
val draw_losng : img -> int * int -> int -> int -> unit
val put_px : img -> int * int -> int -> unit
val draw_line : img -> int * int -> int * int -> int -> unit
val quad_bcurve : img -> int * int -> int * int -> int * int -> int -> unit
val mana_dist : int * int -> int * int -> int
val get_px : img -> int * int -> int
val draw_letter : img -> int * int -> char -> int -> unit
val draw_tri : img -> int * int -> int * int -> int * int -> int -> unit
val read_p1 : string -> img

val draw_cnvx : img -> (int * int) array -> int -> unit

val get_ba : img -> (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t

type plots = {
  x : int;
  y : int;
  v : int;
}
val draw_mana : img -> plots array -> unit

val print_img : img -> unit

val draw_circ_r : int * int -> int -> (int * int) array

val strk_rect_r : int * int * int * int -> (int * int) array
val quad_bcurve_r : int * int -> int * int -> int * int -> (int * int) array
val strk_circ_r : int * int -> int -> (int * int) array
val draw_tri_r : int * int -> int * int -> int * int -> (int * int) array
val draw_line_r : int * int -> int * int -> (int * int) array
val draw_rect_r : int * int * int * int -> (int * int) array

val print_img_magic : img -> unit
val print_img_dims : img -> unit
val print_img_data : img -> unit

type p3

val create_p3 : int -> int -> p3
val free_p3 : p3 -> unit
val print_p3 : p3 -> unit

type color = (int * int * int)

val get_p3_rgb : p3 -> int -> int -> color

val put_p3_rgb : p3 -> int -> int -> color -> unit
val put_p3_color : p3 -> int -> int -> int -> int -> int -> unit

val p3_of_p1 : p3 -> img -> unit

val p3_p1_eq_size : p3 -> img -> bool

val print_p3_dims : p3 -> unit
val print_p3_data : p3 -> unit
val print_p3_magic : p3 -> unit

val ( %! ) : unit -> unit

type ndx

val create_ndx : int -> int -> ndx
val free_ndx : ndx -> unit
val put_ndx_rgb : ndx -> int -> int -> color -> unit
val p3_of_ndx : p3 -> ndx -> unit

val print_ndx : ndx -> unit

val ndx_max_num : unit -> int

val default_ndx_rgb : ndx -> color -> unit

type append_mode =
  | MINUS_APPEND
  | TRANSP_COLOR
  | TWO_COLOR
  | ZERO_TRANSL

val p3_lay_p1 : p3 -> img -> append_mode -> color array -> unit
val p3_lay_ndx : p3 -> ndx -> append_mode -> color array -> unit

type name = string (*img-name*)
type op =
  | Img of (int * int) * name
  | Sirc of (int * int) * int * int * name
  | Print of name
  | Rect of (int * int * int * int) * int * name
  | Px of (int * int) * int * name
  | Circ of (int * int) * int * int * name
  | Tri of (int * int) * (int * int) * (int * int) * int * name
  | Lin of (int * int) * (int * int) * int * name
  | Free of name
  | QuadB of (int * int) * (int * int) * (int * int) * int * name
  | Mana of name * (int * int * int) array
  | Letter of name * (int * int) * char * int

val op_f : op list -> unit

type op_lay =
  | Layer of append_mode * (int * int * int) array * op list
  | Base of (int * int) * op list

val op_lay_f : op_lay list -> unit

(*
module Op2 : sig
type op3 =
  | Img of (int * int)
  (*
  | Rect of (int * int * int * int) * int
  | Px of (int * int) * int
  *)
  | Tri_r of (int * int) * (int * int) * (int * int) * int
  | Lin_r of (int * int) * (int * int) * int
end
*)
