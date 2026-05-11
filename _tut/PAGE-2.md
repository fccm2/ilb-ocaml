## create a simple image

```
$ \ocaml -I ../caml/ imlb.cma img.ml > img.p1
$ feh img.p1
```

```
$ cat img.ml
```

```
module Im = Imlb
let () =
  let img = Im.create_img 120 90 in
  Im.draw_rect img (10, 10, 60, 20) 1;
  Im.print_img img;
  Im.free_img img;
;;
```
