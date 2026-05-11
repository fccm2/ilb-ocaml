all: imlb.cma
opt: imlb.cmxa

imlb.cmxa: imlb.cmx dllimlb_stub.so
	ocamlopt -a -o $@ $< -cclib -limlb_stub -ccopt -L../lib -cclib -limgp1

imlb.cma: imlb.cmo dllimlb_stub.so
	ocamlc -a -custom -o $@ $< -dllib dllimlb_stub.so

imlb.cmi: imlb.mli
	ocamlc -c $<

imlb.cmo: imlb.ml imlb.cmi
	ocamlc -c $<

imlb.cmx: imlb.ml imlb.cmi
	ocamlopt -c $<

imglib.o: imglib.c
	ocamlopt -c $<

imlb_stub.o: imlb_stub.c
	ocamlopt -c -I ../lib $<

../lib/libimgp1.so:
	$(MAKE) -C ../lib

dllimlb_stub.so: imlb_stub.o ../lib/libimgp1.so
	ocamlmklib -o imlb_stub $< -L../lib -limgp1
doc:
	mkdir -p doc
	ocamldoc -html -d doc imlb.mli
clean:
	$(RM) imlb.cmxa
	$(RM) imlb.cma
	$(RM) imlb.cmo
	$(RM) imlb.cmx
	$(RM) imlb.cmi
	$(RM) imlb.o
	$(RM) imlb.a
	$(RM) dllimlb_stub.so
	$(RM) libimlb_stub.a
	$(RM) imlb_stub.o
	$(RM) imglib.o
