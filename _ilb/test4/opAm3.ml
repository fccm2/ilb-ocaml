open Imlb
let range a b =
  a + (Random.int (b - a))

let sq_dist (x1, y1) (x2, y2) =
  let dx = x2 - x1 in
  let dy = y2 - y1 in
  let sq_dist = (dx * dx) + (dy * dy) in
  (sq_dist)

let v_next v =
  match Random.int 3 with
  | 0 -> v
  | 1 -> v + 1
  | 2 -> v - 1
  | _ -> assert false
type f3 =
  | F1
  | F2
  | F3
  | F7
type f4 =
  | F4
  | F5
  | F6
type i3 =
  | In of int
  | Ir of int * int
type env3 =
  | P3 of p3
type c = (int * int * int)
type op2 =
  | Img_t of (int * int)
  | Lin_t of (int * int) * (int * int) * c * f3 * f4
  | Tri_t of (int * int) * (int * int) * (int * int) * c * f3 * f4
  | Sirc_t of (int * int) * int * c * f3 * f4
  | Rect_u of (int * int * int * int) * c
  | Rect_t of (int * int * int * int) * c * f3 * f4
  | Circ_u of (int * int) * int * c
  | Circ_t of (int * int) * int * c * f3 * f4
  | Px_t of (int * int) * c * f3 * f4
type op3 =
  | Img_r of (int * int)
  | Lin_r of (i3 * i3) * (i3 * i3) * c * f3 * f4
  | Tri_r of (i3 * i3) * (i3 * i3) * (i3 * i3) * c * f3 * f4
  | Sirc_r of (i3 * i3) * i3 * c * f3 * f4
  | Rect_s of (i3 * i3 * i3 * i3) * c
  | Rect_r of (i3 * i3 * i3 * i3) * c * f3 * f4
  | Circ_s of (i3 * i3) * i3 * c
  | Circ_r of (i3 * i3) * i3 * c * f3 * f4
  | Px_r of (i3 * i3) * c * f3 * f4

let init_1 v =
  match v with
  | In d -> d
  | Ir (d1, d2) -> range d1 d2
let f_aff f rs =
  match f with
  | F1 -> List.filter (fun (_, _) -> (Random.int 2) = 0) rs
  | F2 -> List.map (fun (x, y) -> (v_next x, v_next y)) rs
  | F3 -> List.filter (fun (_, _) -> (Random.int 19) <> 0) rs
  | F7 -> List.filter (fun (_, _) -> (Random.int 11) <> 0) rs
let f_next a (x, y) =
  match a with
  | F4 -> (v_next x, v_next y)
  | F5 -> (x, y+1)
  | F6 -> (x+1, y)

let op_an_f d op_r =
  let rec get_img env =
    match env with
    | ("img", P3 r) :: env -> (r)
    | _ :: env -> get_img env
    | [] -> failwith "get_img: not-found"
  in
  let rec aux3 op_t acc =
    match op_t with
    | Img_t (w, h) :: op_t ->
        let acc = Img_t (w, h) :: acc in
        aux3 op_t acc
    | Px_t ((x, y), v, f, a) :: op_t ->
        let x, y = f_next a (x, y) in
        let this = Px_t ((x, y), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | Lin_t ((x1, y1), (x2, y2), v, f, a) :: op_t ->
        let x1, y1 = f_next a (x1, y1) in
        let x2, y2 = f_next a (x2, y2) in
        let this = Lin_t ((x1, y1), (x2, y2), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | Tri_t ((x1, y1), (x2, y2), (x3, y3), v, f, a) :: op_t ->
        let x1, y1 = f_next a (x1, y1) in
        let x2, y2 = f_next a (x2, y2) in
        let x3, y3 = f_next a (x3, y3) in
        let this = Tri_t ((x1, y1), (x2, y2), (x3, y3), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | Sirc_t ((cx, cy), (r), v, f, a) :: op_t ->
        let cx, cy = f_next a (cx, cy) in
        let r, _ = f_next a (r, r) in
        let this = Sirc_t ((cx, cy), (r), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | Rect_t ((x, y, w, h), v, f, a) :: op_t ->
        let x, y = f_next a (x, y) in
        let w, h = f_next a (w, h) in
        let this = Rect_t ((x, y, w, h), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | Rect_u ((x, y, w, h), v) :: op_t ->
        let this = Rect_u ((x, y, w, h), v) in
        let acc = this :: acc in
        aux3 op_t acc
    | Circ_u ((cx, cy), r, v) :: op_t ->
        let this = Circ_u ((cx, cy), r, v) in
        let acc = this :: acc in
        aux3 op_t acc
    | Circ_t ((cx, cy), (r), v, f, a) :: op_t ->
        let cx, cy = f_next a (cx, cy) in
        let r, _ = f_next a (r, r) in
        let this = Circ_t ((cx, cy), (r), v, f, a) in
        let acc = this :: acc in
        aux3 op_t acc
    | [] -> (List.rev acc)
  in
  let rec aux2 d op_t env _op_t =
    if d <= 0 then () else
    match op_t with
    | Img_t (w, h) :: op_t ->
        let r = create_p3 120 90 in
        let env = ("img", P3 r) :: env in
        aux2 d op_t env _op_t
    | Px_t ((x, y), v, f, _) :: op_t ->
        let rs = [(x, y)] in
        let r = get_img env in
        let rs = f_aff f rs in
        List.iter (fun (x, y) ->
          put_p3_rgb r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | Lin_t ((x1, y1), (x2, y2), v, f, _) :: op_t ->
        let rs = draw_line_r (x1, y1) (x2, y2) in
        let r = get_img env in
        let rs = Array.to_list rs in
        let rs = f_aff f rs in
        let rs = Array.of_list rs in
        Array.iter (fun (x, y) ->
          put_p3_rgb r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | Tri_t ((x1, y1), (x2, y2), (x3, y3), v, f, _) :: op_t ->
        let rs = draw_tri_r (x1, y1) (x2, y2) (x3, y3) in
        let r = get_img env in
        let rs = Array.to_list rs in
        let rs = f_aff f rs in
        let rs = Array.of_list rs in
        Array.iter (fun (x, y) ->
          put_p3_rgb r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | Sirc_t ((cx, cy), (r), v, f, _) :: op_t ->
        let rs = strk_circ_r (cx, cy) (r) in
        let r = get_img env in
        let rs = Array.to_list rs in
        let rs = f_aff f rs in
        let rs = Array.of_list rs in
        Array.iter (fun (x, y) ->
          put_p3_rgb r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | Rect_t ((x, y, w, h), v, f, _) :: op_t ->
        let rs = draw_rect_r (x, y, w, h) in
        let r = get_img env in
        let rs = Array.to_list rs in
        let rs = f_aff f rs in
        let rs = Array.of_list rs in
        Array.iter (fun (x, y) ->
          put_p3_rgb r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | Rect_u ((x, y, w, h), v) :: op_t ->
        let r = get_img env in
        for _y = y to pred (y + h) do
          for _x = x to pred (x + w) do
            put_p3_rgb r _x _y v;
          done;
        done;
        aux2 d op_t env _op_t
    | Circ_u ((cx, cy), _r, v) :: op_t ->
        let r = get_img env in
        for _y = cy - _r to cy + _r do
          for _x = cx - _r to cx + _r do
            let p = (_x, _y) in
            let d = sq_dist (cx, cy) (p) in
            if d < (_r * _r) then begin
              put_p3_rgb r _x _y v;
            end;
          done;
        done;
        aux2 d op_t env _op_t
    | Circ_t ((cx, cy), (r), v, f, _) :: op_t ->
        let rs = draw_circ_r (cx, cy) (r) in
        let _r = get_img env in
        let rs = Array.to_list rs in
        let rs = f_aff f rs in
        let rs = Array.of_list rs in
        Array.iter (fun (x, y) ->
          put_p3_rgb _r x y v;
        ) rs;
        aux2 d op_t env _op_t
    | [] ->
        let r = get_img env in
        print_p3 r;
        free_p3 r;
        let _op_t = aux3 _op_t [] in
        aux2 (pred d) _op_t [] _op_t
  in
  let rec aux d op_r acc =
    match op_r with
    | Img_r (w, h) :: op_r ->
        let acc = Img_t (w, h) :: acc in
        aux d op_r acc
    | Px_r ((x, y), v, f, a) :: op_r ->
        let x = init_1 x in
        let y = init_1 y in
        let acc = Px_t ((x, y), v, f, a) :: acc in
        aux d op_r acc
    | Lin_r ((x1, y1), (x2, y2), v, f, a) :: op_r ->
        let x1 = init_1 x1 in
        let y1 = init_1 y1 in
        let x2 = init_1 x2 in
        let y2 = init_1 y2 in
        let acc = Lin_t ((x1, y1), (x2, y2), v, f, a) :: acc in
        aux d op_r acc
    | Tri_r ((x1, y1), (x2, y2), (x3, y3), v, f, a) :: op_r ->
        let x1 = init_1 x1 in
        let y1 = init_1 y1 in
        let x2 = init_1 x2 in
        let y2 = init_1 y2 in
        let x3 = init_1 x3 in
        let y3 = init_1 y3 in
        let acc = Tri_t ((x1, y1), (x2, y2), (x3, y3), v, f, a) :: acc in
        aux d op_r acc
    | Sirc_r ((cx, cy), (r), v, f, a) :: op_r ->
        let cx = init_1 cx in
        let cy = init_1 cy in
        let r = init_1 r in
        let acc = Sirc_t ((cx, cy), (r), v, f, a) :: acc in
        aux d op_r acc
    | Rect_s ((x, y, w, h), v) :: op_r ->
        let x = init_1 x in
        let y = init_1 y in
        let w = init_1 w in
        let h = init_1 h in
        let acc = Rect_u ((x, y, w, h), v) :: acc in
        aux d op_r acc
    | Rect_r ((x, y, w, h), v, f, a) :: op_r ->
        let x = init_1 x in
        let y = init_1 y in
        let w = init_1 w in
        let h = init_1 h in
        let acc = Rect_t ((x, y, w, h), v, f, a) :: acc in
        aux d op_r acc
    | Circ_s ((cx, cy), r, v) :: op_r ->
        let cx = init_1 cx in
        let cy = init_1 cy in
        let r = init_1 r in
        let acc = Circ_u ((cx, cy), r, v) :: acc in
        aux d op_r acc
    | Circ_r ((cx, cy), r, v, f, a) :: op_r ->
        let cx = init_1 cx in
        let cy = init_1 cy in
        let r = init_1 r in
        let acc = Circ_t ((cx, cy), r, v, f, a) :: acc in
        aux d op_r acc
    | [] ->
        let op_t = (List.rev acc) in
        aux2 d op_t [] op_t
  in
  aux d op_r []
