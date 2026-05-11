test: ../caml/imlb.cma
	\ocaml -I ../caml imlb.cma draw.ml 1 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 2 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 3 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 4 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 5 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 6 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 7 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 8 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 9 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 10 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 11 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 12 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 13 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 14 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 15 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 16 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 17 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 18 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 19 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 20 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 21 | feh -
	\ocaml -I ../caml imlb.cma draw.ml 22 | feh -
opt: draw.opt
draw.opt: ../caml/imlb.cmxa
	ocamlopt -o $@ -I ../caml imlb.cmxa draw.ml
../caml/imlb.cmxa:
	$(MAKE) -C ../caml imlb.cmxa
../caml/imlb.cma:
	$(MAKE) -C ../caml imlb.cma
clean:
	$(RM) draw.opt
	$(RM) draw.cmi
	$(RM) draw.cmx
	$(RM) draw.o
