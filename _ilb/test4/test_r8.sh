make -f opAm.mk
#AM="an1"
#AM="an2"
#AM="an3"
#AM="an4"
#AM="an5"
#AM="an6"

AM="an4"
\ocaml -I ../caml/ imlb.cma -I . opAm.cma test_r8.ml $AM > r8-m4.log
#\ocaml ../test2/log_to_anim.ml r8-m4.log > r8-m4.sh
#sh r8-m4.sh
#ls -l r8-m4.gif
#rm -f r8-m4.log
#rm -f r8-m4.sh

# 
# AM="an5"
# \ocaml -I ../caml/ imlb.cma -I . opAm.cma test_r8.ml $AM > r8-m5.log
# \ocaml ../test2/log_to_anim.ml r8-m5.log > r8-m5.sh
# sh r8-m5.sh
# ls -l r8-m5.gif
# rm -f r8-m5.log
# rm -f r8-m5.sh
# 

# 
# AM="an6"
# \ocaml -I ../caml/ imlb.cma -I . opAm.cma test_r8.ml $AM > r8-m6.log
# \ocaml ../test2/log_to_anim.ml r8-m6.log > r8-m6.sh
# sh r8-m6.sh
# ls -l r8-m6.gif
# rm -f r8-m6.log
# rm -f r8-m6.sh
# 

# 
# AM="an7"
# \ocaml -I ../caml/ imlb.cma -I . opAm.cma test_r8.ml $AM > r8-m7.log
# \ocaml ../test2/log_to_anim.ml r8-m7.log > r8-m7.sh
# sh r8-m7.sh
# ls -l r8-m7.gif

# \ocaml -I ../caml/ imlb.cma -I . opAm.cmo test_r8.ml > r8.log
# \ocaml ../test2/log_to_anim.ml r8.log > r8.sh
# sh r8.sh
# mv r8.gif
