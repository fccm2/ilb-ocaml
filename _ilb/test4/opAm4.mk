all: opAm4.cma
opAm4.cmi: opAm4.mli
	ocamlc -c -I ../caml/ imlb.cma $<
opAm4.cmo: opAm4.ml opAm4.cmi
	ocamlc -c -I ../caml/ imlb.cma $<
opAm4.cma: opAm4.cmo
	ocamlc -a -o $@ $<
doc:
	mkdir doc
	ocamldoc -html -d doc opAm4.mli
clean:
	$(RM) opAm4.cmi
	$(RM) opAm4.cmo
	$(RM) opAm4.cma
