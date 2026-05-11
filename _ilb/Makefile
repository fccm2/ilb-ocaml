.PHONY: lib
lib:
	$(MAKE) -C lib
.PHONY: caml
caml:
	$(MAKE) -C caml
opt:
	$(MAKE) -C caml opt
.PHONY: test
test:
	$(MAKE) -C test
.PHONY: opAm3
opAm3:
	$(MAKE) -C test4 -f opAm3.mk
.PHONY: opAm
opAm:
	$(MAKE) -C test4 -f opAm.mk
clean:
	$(MAKE) -C lib clean
	$(MAKE) -C caml clean
	$(MAKE) -C test clean
	$(MAKE) -C test4 -f opAm.mk clean
	$(MAKE) -C test4 -f opAm3.mk clean
	$(MAKE) -C test4 -f opAm4.mk clean
	$(MAKE) -C test4 -f opAm5.mk clean
	$(MAKE) -C test4 -f opAm6.mk clean
