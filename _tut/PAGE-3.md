## produce a .png for a smaller file size

```
$ convert img.p1 img.png
$ ll img.p1 img.png
-- 22K - img.p1
-- 238 - img.png
$ feh img.png
```

you can also compress w/ lzma,  
in case you would like to produce  
a smaller file size:

```
$ lzma --best img.p1
$ ll img.*
-- 124 - img.ml
-- 101 - img.p1.lzma
-- 238 - img.png
```

