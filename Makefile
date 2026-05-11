all:
	$(MAKE) -C _ilb
	$(MAKE) -C _ilb/caml opt
	$(MAKE) -C _ilb/test4
.PHONY: _mans man
man: _mans
_mans:
	mkdir -p _mans
	ocamldoc -d _mans -html \
	 -I _ilb/caml/ \
	 _ilb/caml/imlb.mli \
	 _ilb/test4/opAm.mli \
	 _ilb/test4/opAm3.mli \
	 _ilb/test4/opAm4.mli \
	 _ilb/test4/opAm5.mli \
	 _ilb/test4/opAm6.mli \
	#Eol
clean:
	$(MAKE) -C _ilb clean
	$(RM) -r _mans/
