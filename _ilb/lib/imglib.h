/* A small p1 image-lib */
/* Author: Florent Monnier */
/* Date: Jan, 2026 */

#ifndef _IMGLIB_H_
#define _IMGLIB_H_

enum _append_mode {
  MINUS_APPEND,
  TRANSP_COLOR,
  TWO_COLOR,
  ZERO_TRANSL
};

struct _color {
  unsigned int r;
  unsigned int g;
  unsigned int b;
};

struct _layer {
  enum _append_mode append_mode;
  struct _color *color;
  struct _img *img;
};

struct _p3 {
  unsigned int w;
  unsigned int h;
  unsigned char *ds;
};

struct _img {
  unsigned int w;
  unsigned int h;
  unsigned char *ds;
};

struct _ndx {
  unsigned int w;
  unsigned int h;
  unsigned int n;
  unsigned char *ds;
  struct _color *c;
};

struct _rect {
  int x;
  int y;
  unsigned int w;
  unsigned int h;
};

struct _pnt {
  int x;
  int y;
};

struct _line {
  int x1;
  int y1;
  int x2;
  int y2;
};

struct _plot {
  int x;
  int y;
  int v;
};

struct _img *
create_img(unsigned int w, unsigned int h);

void
free_img(struct _img *img);

void
strk_rect(struct _img *img, struct _rect *rect, unsigned char _value);

void
draw_rect(struct _img *img, struct _rect *rect, unsigned char _value);

unsigned int
dist(struct _pnt *p1, struct _pnt *p2);

void
draw_circ(struct _img *img, struct _pnt *c, unsigned int r, unsigned char _value);

void
strk_circ(struct _img *img, struct _pnt *c, unsigned int r, unsigned char _value);

void
draw_losng(struct _img *img, struct _pnt *p, unsigned int d, unsigned char _value);

void
put_px(struct _img *img, int x, int y, unsigned char _value);

void
draw_line(struct _img *img, struct _pnt *p1, struct _pnt *p2, unsigned char _value);

void
quad_bcurve(struct _img *img, struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, unsigned char _value);

unsigned int
mana_dist(struct _pnt *p1, struct _pnt *p2);

unsigned char
get_px(struct _img *img, int x, int y);

void
draw_letter(struct _img *img, int _x, int _y, unsigned char ltr, unsigned char _value);

int
p_seg(struct _pnt *a, struct _pnt *b, struct _pnt *p);

void
draw_tri(struct _img *img, struct _pnt *a, struct _pnt *b, struct _pnt *c, unsigned char _value);

void
draw_cnvx(struct _img *img, struct _pnt *ps, int num, unsigned char _value);

void
draw_mana(struct _img *img, struct _plot *plots, unsigned int num_plots);

void
print_img_magic(struct _img *img);

void
print_img_dims(struct _img *img);

void
print_img_data(struct _img *img);

void
print_img(struct _img *img);

struct _img *
read_p1(const char *s);

void
free_p3(struct _p3 *p3);

void
put_p3_color(struct _p3 *p3, int x, int y, unsigned char v1, unsigned char v2, unsigned char v3);

void
put_p3_rgb(struct _p3 *p3, int x, int y, struct _color *col);

int
get_p3_rgb(struct _p3 *p3, int x, int y, struct _color *col);

void
print_p3(struct _p3 *p3);

struct _p3 *
create_p3(unsigned int w, unsigned int h);

void
p3_of_p1(struct _p3 *p3, struct _img *img);

int
p3_p1_eq_size(struct _p3 *p3, struct _img *img);

void
p3_lay_ndx(struct _p3 *p3, struct _ndx *ndx, enum _append_mode append_mode, struct _color *col);

void
p3_lay_p1(struct _p3 *p3, struct _img *img, enum _append_mode append_mode, struct _color *col);

void
default_ndx_rgb(struct _ndx *ndx, struct _color *col);

void
put_ndx_rgb(struct _ndx *ndx, int x, int y, struct _color *col);

struct _ndx *
create_ndx(unsigned int w, unsigned int h);

void
free_ndx(struct _ndx *ndx);

void
p3_of_ndx(struct _p3 *p3, struct _ndx *ndx);

void
print_ndx(struct _ndx *ndx);

int
ndx_max_num(void);

void
stdio_flush();

void
print_p3_magic(struct _p3 *p3);

void
print_p3_dims(struct _p3 *p3);

void
print_p3_data(struct _p3 *p3);

void
quad_bcurve_pnt(struct _pnt *r, struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, int t);

struct _pnt *
strk_rect_r(struct _rect *rect, unsigned int *n);

struct _pnt *
quad_bcurve_r(struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, unsigned int *n);

struct _pnt *
draw_circ_r(struct _pnt *c, unsigned int r, unsigned int *n);

struct _pnt *
strk_circ_r(struct _pnt *c, unsigned int r, unsigned int *n);

struct _pnt *
draw_rect_r(struct _rect *rect, unsigned int *n);

struct _pnt *
draw_line_r(struct _pnt *p1, struct _pnt *p2, unsigned int *n);

struct _pnt *
pnt_r(struct _pnt *pnt, unsigned int d);

void
free_r(struct _pnt *pnt);

struct _pnt *
draw_tri_r(struct _pnt *a, struct _pnt *b, struct _pnt *c, unsigned int *n);

#endif /* _IMGLIB_H_ */

