(*0*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (65, 19) 33 1;
  draw_circ img0 (60, 48) 29 1;
  draw_circ img0 (48, 18) 35 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=26; y=75; v=0}; {x=99; y=82; v=1}; {x=6; y=3; v=1}; {x=54; y=61; v=1}; {x=20; y=44; v=0}; {x=22; y=27; v=1}; {x=21; y=55; v=1}; {x=3; y=40; v=0}; {x=29; y=60; v=1}; {x=107; y=78; v=0}; {x=114; y=15; v=1}; {x=34; y=61; v=0}; {x=82; y=44; v=0}; {x=30; y=76; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*1*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (64, 19) 33 1;
  draw_circ img0 (60, 49) 30 1;
  draw_circ img0 (48, 17) 34 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=25; y=76; v=0}; {x=99; y=82; v=1}; {x=7; y=2; v=1}; {x=53; y=62; v=1}; {x=21; y=43; v=0}; {x=22; y=27; v=1}; {x=20; y=54; v=1}; {x=2; y=41; v=0}; {x=28; y=59; v=1}; {x=106; y=79; v=0}; {x=113; y=15; v=1}; {x=35; y=61; v=0}; {x=81; y=43; v=0}; {x=30; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*2*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (63, 20) 34 1;
  draw_circ img0 (60, 50) 31 1;
  draw_circ img0 (48, 18) 35 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=26; y=75; v=0}; {x=100; y=82; v=1}; {x=7; y=1; v=1}; {x=54; y=62; v=1}; {x=20; y=43; v=0}; {x=21; y=26; v=1}; {x=20; y=53; v=1}; {x=2; y=40; v=0}; {x=29; y=60; v=1}; {x=106; y=80; v=0}; {x=112; y=15; v=1}; {x=36; y=62; v=0}; {x=82; y=42; v=0}; {x=29; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*3*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (64, 19) 33 1;
  draw_circ img0 (61, 50) 31 1;
  draw_circ img0 (49, 18) 35 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=27; y=76; v=0}; {x=99; y=83; v=1}; {x=7; y=1; v=1}; {x=53; y=61; v=1}; {x=21; y=44; v=0}; {x=22; y=25; v=1}; {x=19; y=52; v=1}; {x=3; y=41; v=0}; {x=30; y=60; v=1}; {x=107; y=80; v=0}; {x=111; y=15; v=1}; {x=35; y=63; v=0}; {x=81; y=41; v=0}; {x=28; y=76; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*4*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (63, 18) 34 1;
  draw_circ img0 (62, 50) 32 1;
  draw_circ img0 (49, 19) 36 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=26; y=75; v=0}; {x=98; y=84; v=1}; {x=8; y=1; v=1}; {x=53; y=61; v=1}; {x=20; y=44; v=0}; {x=22; y=24; v=1}; {x=19; y=53; v=1}; {x=4; y=41; v=0}; {x=31; y=59; v=1}; {x=106; y=80; v=0}; {x=112; y=15; v=1}; {x=35; y=63; v=0}; {x=82; y=42; v=0}; {x=27; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*5*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (64, 19) 33 1;
  draw_circ img0 (63, 51) 33 1;
  draw_circ img0 (48, 19) 36 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=25; y=75; v=0}; {x=97; y=84; v=1}; {x=8; y=2; v=1}; {x=52; y=62; v=1}; {x=20; y=43; v=0}; {x=21; y=24; v=1}; {x=20; y=53; v=1}; {x=5; y=42; v=0}; {x=31; y=58; v=1}; {x=106; y=81; v=0}; {x=113; y=15; v=1}; {x=35; y=62; v=0}; {x=83; y=42; v=0}; {x=27; y=76; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*6*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (64, 19) 32 1;
  draw_circ img0 (64, 52) 32 1;
  draw_circ img0 (48, 20) 36 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=24; y=75; v=0}; {x=96; y=83; v=1}; {x=7; y=3; v=1}; {x=53; y=61; v=1}; {x=20; y=43; v=0}; {x=20; y=25; v=1}; {x=19; y=54; v=1}; {x=5; y=42; v=0}; {x=32; y=59; v=1}; {x=106; y=80; v=0}; {x=114; y=14; v=1}; {x=35; y=63; v=0}; {x=82; y=43; v=0}; {x=27; y=76; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*7*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (64, 18) 31 1;
  draw_circ img0 (63, 53) 31 1;
  draw_circ img0 (47, 21) 36 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=25; y=75; v=0}; {x=97; y=82; v=1}; {x=7; y=3; v=1}; {x=54; y=60; v=1}; {x=19; y=44; v=0}; {x=20; y=24; v=1}; {x=18; y=54; v=1}; {x=5; y=42; v=0}; {x=31; y=60; v=1}; {x=106; y=81; v=0}; {x=114; y=15; v=1}; {x=34; y=64; v=0}; {x=82; y=43; v=0}; {x=26; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*8*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (63, 19) 31 1;
  draw_circ img0 (63, 54) 30 1;
  draw_circ img0 (48, 21) 35 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=24; y=74; v=0}; {x=98; y=81; v=1}; {x=7; y=4; v=1}; {x=54; y=61; v=1}; {x=20; y=45; v=0}; {x=19; y=25; v=1}; {x=17; y=55; v=1}; {x=6; y=43; v=0}; {x=31; y=61; v=1}; {x=107; y=81; v=0}; {x=114; y=16; v=1}; {x=34; y=63; v=0}; {x=81; y=43; v=0}; {x=25; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*9*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (63, 18) 30 1;
  draw_circ img0 (64, 53) 30 1;
  draw_circ img0 (49, 21) 34 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=23; y=73; v=0}; {x=98; y=81; v=1}; {x=7; y=4; v=1}; {x=54; y=62; v=1}; {x=20; y=44; v=0}; {x=18; y=26; v=1}; {x=16; y=56; v=1}; {x=7; y=42; v=0}; {x=30; y=60; v=1}; {x=107; y=80; v=0}; {x=113; y=15; v=1}; {x=33; y=63; v=0}; {x=82; y=42; v=0}; {x=25; y=74; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*10*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (62, 19) 29 1;
  draw_circ img0 (65, 54) 30 1;
  draw_circ img0 (48, 22) 34 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=24; y=73; v=0}; {x=97; y=82; v=1}; {x=8; y=3; v=1}; {x=55; y=62; v=1}; {x=19; y=44; v=0}; {x=19; y=26; v=1}; {x=16; y=57; v=1}; {x=8; y=42; v=0}; {x=30; y=60; v=1}; {x=106; y=81; v=0}; {x=114; y=16; v=1}; {x=34; y=62; v=0}; {x=83; y=41; v=0}; {x=25; y=75; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
(*11*)
open Imlb
let () =
  let p3 = create_p3 120 90 in

  (*lay*)
  let img0 = create_img 120 90 in
  draw_circ img0 (62, 19) 30 1;
  draw_circ img0 (64, 53) 29 1;
  draw_circ img0 (49, 23) 34 1;

  if p3_p1_eq_size p3 img0
  then p3_of_p1 p3 img0;

  (*lay*)
  let img1 = create_img 120 90 in
  let plots = [| {x=23; y=72; v=0}; {x=97; y=82; v=1}; {x=7; y=4; v=1}; {x=56; y=62; v=1}; {x=18; y=45; v=0}; {x=20; y=27; v=1}; {x=17; y=58; v=1}; {x=7; y=41; v=0}; {x=30; y=60; v=1}; {x=106; y=81; v=0}; {x=115; y=15; v=1}; {x=33; y=63; v=0}; {x=84; y=41; v=0}; {x=24; y=76; v=0} |] in
  draw_mana img1 plots;

  if p3_p1_eq_size p3 img1
  then p3_lay_p1 p3 img1 TRANSP_COLOR (0, 255, 0);

  print_p3 p3;
  free_img img0;
  free_img img1;
  free_p3 p3;
;;
