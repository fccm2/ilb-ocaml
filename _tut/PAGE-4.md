## automate the builds

the command to create the `.p1` images is:
```
$ \ocaml -I ../caml/ imlb.cma img.ml > img.p1
```

so the `makefile` to automate this build is:

```
img.p1: img.ml
	\ocaml -I ../caml/ imlb.cma $< > $@
```

the characters `$@`, stands for the destination  
image produced: `img.p1`, and `$<` for the source  
element,

the complete `makefile` then becomes:

```
all: img.p1 img.p1.lzma
img.p1: img.ml
	\ocaml -I ../caml/ imlb.cma $< > $@
img.p1.lzma: img.p1
	lzma --best img.p1
clean:
	$(RM) img.p1
	$(RM) img.p1.lzma
	$(RM) img.png
```

test w/:
```
$ make
$ make clean
```

