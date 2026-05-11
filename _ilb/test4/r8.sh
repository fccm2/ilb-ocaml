convert r8000.pbm r8000.png
convert r8001.pbm r8001.png
convert r8002.pbm r8002.png
convert r8003.pbm r8003.png
convert r8004.pbm r8004.png
convert -delay 60 -loop 0 r8*.png r8.gif
rm -f r8000.pbm r8000.png
rm -f r8001.pbm r8001.png
rm -f r8002.pbm r8002.png
rm -f r8003.pbm r8003.png
rm -f r8004.pbm r8004.png
