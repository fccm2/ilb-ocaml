all: opAm.cma
opAm.cmi: opAm.mli
	ocamlc -c -I ../caml/ imlb.cma $<
opAm.cmo: opAm.ml opAm.cmi
	ocamlc -c -I ../caml/ imlb.cma $<
opAm.cma: opAm.cmo
	ocamlc -a -o $@ $<
doc:
	mkdir doc
	ocamldoc -html -d doc opAm.mli
clean:
	$(RM) opAm.cmi
	$(RM) opAm.cmo
	$(RM) opAm.cma
