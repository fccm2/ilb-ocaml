## drawing negate

```
$ cat img2.ml
```

```
module Im = Imlb
let () =
  let img = Im.create_img 120 90 in
  Im.draw_rect img (10, 10, 60, 20) 1;
  Im.draw_rect img (12, 12,  6,  2) 0;
  Im.draw_rect img (60, 24, 40, 10) 3;
  Im.print_img img;
  Im.free_img img;
;;
```

result:
```
$ feh img2.png
```

