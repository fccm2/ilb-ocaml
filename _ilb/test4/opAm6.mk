all: opAm6.cma
opAm6.cmi: opAm6.mli
	ocamlc -c -I ../caml/ imlb.cma $<
opAm6.cmo: opAm6.ml opAm6.cmi
	ocamlc -c -I ../caml/ imlb.cma $<
opAm6.cma: opAm6.cmo
	ocamlc -a -o $@ $<
doc:
	mkdir doc
	ocamldoc -html -d doc opAm6.mli
clean:
	$(RM) opAm6.cmi
	$(RM) opAm6.cmo
	$(RM) opAm6.cma
