all: opAm3.cma
opAm3.cmi: opAm3.mli
	ocamlc -c -I ../caml/ imlb.cma $<
opAm3.cmo: opAm3.ml opAm3.cmi
	ocamlc -c -I ../caml/ imlb.cma $<
opAm3.cma: opAm3.cmo
	ocamlc -a -o $@ $<
doc:
	mkdir doc
	ocamldoc -html -d doc opAm3.mli
clean:
	$(RM) opAm3.cmi
	$(RM) opAm3.cmo
	$(RM) opAm3.cma
