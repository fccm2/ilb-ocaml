all: opAm5.cma
opAm5.cmi: opAm5.mli
	ocamlc -c -I ../caml/ imlb.cma $<
opAm5.cmo: opAm5.ml opAm5.cmi
	ocamlc -c -I ../caml/ imlb.cma $<
opAm5.cma: opAm5.cmo
	ocamlc -a -o $@ $<
doc:
	mkdir doc
	ocamldoc -html -d doc opAm5.mli
clean:
	$(RM) opAm5.cmi
	$(RM) opAm5.cmo
	$(RM) opAm5.cma
