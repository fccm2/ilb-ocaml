\ocaml -I ../caml/ imlb.cma -I . opAm6.cma test_u10.ml am4 > u10.log
\ocaml ../test2/log_to_anim.ml u10.log > u10.sh
sh u10.sh
