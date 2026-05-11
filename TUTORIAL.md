You can first go in the `_ilb` directory,  
and then compile the .c library with:
```
$ make
```
then you can compile the ocaml interface,  
with the command:  
```
$ make caml
```
after don't forget to read, and follow  
the instructions in the `ld` file:  
```
$ cat ld
```
then you can check that everything functions  
in the directory `test` with:
```
$ make test
```
