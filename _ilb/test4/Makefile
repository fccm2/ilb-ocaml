all: opAm opAm3 opAm4 opAm5 opAm6
.PHONY: opAm6
opAm6:
	$(MAKE) -f opAm6.mk
.PHONY: opAm5
opAm5:
	$(MAKE) -f opAm5.mk
.PHONY: opAm4
opAm4:
	$(MAKE) -f opAm4.mk
.PHONY: opAm3
opAm3:
	$(MAKE) -f opAm3.mk
.PHONY: opAm
opAm:
	$(MAKE) -f opAm.mk
clean:
	$(MAKE) -f opAm.mk clean
	$(MAKE) -f opAm3.mk clean
	$(MAKE) -f opAm4.mk clean
	$(MAKE) -f opAm5.mk clean
	$(MAKE) -f opAm6.mk clean
u9.gif: test_u9.ml
	$(MAKE) -f opAm5.mk
	\ocaml -I ../caml/ imlb.cma -I . opAm5.cmo test_u9.ml > u9.log
	\ocaml ../test2/log_to_anim.ml u9.log > u9.sh
	sh u9.sh
	ls -l u9.gif
	$(RM) u9.log u9.sh
u10.gif: test_u10.ml
	$(MAKE) -f opAm6.mk
	\ocaml -I ../caml/ imlb.cma -I . opAm6.cmo test_u10.ml > u10.log
	\ocaml ../test2/log_to_anim.ml u10.log > u10.sh
	sh u10.sh
	$(RM) u10.log u10.sh
