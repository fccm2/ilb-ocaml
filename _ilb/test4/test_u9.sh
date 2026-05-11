\ocaml -I ../caml/ imlb.cma -I . opAm5.cma test_u9.ml > u9.log
\ocaml ../test2/log_to_anim.ml u9.log > u9.sh
sh u9.sh
