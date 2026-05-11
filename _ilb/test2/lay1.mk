lay1.ml: test_lay2h.xml
	\ocaml -I xmlerr-0.08.3b/src/ xmlerr.cma read_lay.ml test_lay2h.xml > lay1.ml
viz: lay1.ml
	\ocaml -I ../caml/ imlb.cma lay1.ml | feh -
