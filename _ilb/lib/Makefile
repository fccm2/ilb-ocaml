all: libimgp1.so
prog: main.c libimgp1.so
	gcc -o $@ $< -L. -limgp1

libimgp1.so: imglib.o
	gcc -shared -o $@ $<

imglib.o: imglib.c imglib.h
	gcc -fPIC -c $<

install:
	mkdir -p /usr/local/lib
	mkdir -p /usr/local/include
	cp libimgp1.so /usr/local/lib
	cp imglib.h /usr/local/include

test: prog
	LD_LIBRARY_PATH=. ./prog | feh -
clean:
	$(RM) libimgp1.so
	$(RM) imglib.o
	$(RM) prog
