#include "imglib.h"
#include <stdio.h>

int
main0()
{
  unsigned int w;
  unsigned int h;
  struct _p3 *p3;

  struct _color c1;
  struct _color c2;
  int d;

  c1.r = 255;
  c1.g = 0;
  c1.b = 0;

  c2.r = 0;
  c2.g = 0;
  c2.b = 255;

  w = 120;
  h = 80;

  p3 = create_p3(w, h);

  put_p3_color(p3, 0, 0, 255, 255, 255);
  put_p3_rgb(p3, 1, 0, &c1);
  for (d = 0; d < 80; d++) {
    put_p3_rgb(p3, 20+d, 8, &c2);
    //printf("# %d\n", d);
  }
  print_p3(p3);
  free_p3(p3);

  return 0;
}

int
main1()
{
  unsigned int w;
  unsigned int h;
  struct _img *img;
  struct _rect my_rect;

  my_rect.x = 20;
  my_rect.y = 20;
  my_rect.w = 80;
  my_rect.h = 30;

  w = 120;
  h = 80;

  img = create_img(w, h);
  draw_rect(img, &my_rect, 1);
  print_img(img);
  free_img(img);
  return 0;
}

int
main2()
{
  unsigned int w;
  unsigned int h;
  struct _img *img;
  struct _rect my_rect;
  struct _pnt c1;
  unsigned int r1;

  w = 100;
  h = 100;

  r1 = 30;

  c1.x = 40;
  c1.y = 40;

  img = create_img(w, h);
  draw_circ(img, &c1, r1, 1);
  print_img(img);
  free_img(img);
  return 0;
}

int
main()
{
  //return main1();
  //return main2();
  return main0();
}

