## generic rules

you can then edit your `makefile`,  
and convert it w/ generic rules,  
to continue with other images:

```
all: img.p1 img.p1.lzma
%.p1: %.ml
	\ocaml -I ../caml/ imlb.cma $< > $@
%.p1.lzma: %.p1
	lzma --best $<
%.gif: %.p1
	convert $< $@
%.png: %.p1
	convert $< $@
clean:
	$(RM) *.p1
	$(RM) *.p1.lzma
	$(RM) *.png
	$(RM) *.gif
```

