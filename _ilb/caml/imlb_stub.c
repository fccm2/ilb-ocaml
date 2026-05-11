/* A caml interface to the small p1 image-lib */
/* Author: Florent Monnier */
/* Date: Jan, 2026 */

#define CAML_NAME_SPACE
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/bigarray.h>
#include <caml/memory.h>

#include <stdlib.h>

#include "imglib.h"

static value Val_img(struct _img *img)
{
  value val = caml_alloc(1, Abstract_tag);
  *((struct _img **) Data_abstract_val(val)) = img;
  return val;
}

#define Img_val(img) \
  *((struct _img **) Data_abstract_val(img))

static value Val_p3(struct _p3 *p3)
{
  value val = caml_alloc(1, Abstract_tag);
  *((struct _p3 **) Data_abstract_val(val)) = p3;
  return val;
}

#define P3_val(p3) \
  *((struct _p3 **) Data_abstract_val(p3))

static value Val_ndx(struct _ndx *ndx)
{
  value val = caml_alloc(1, Abstract_tag);
  *((struct _ndx **) Data_abstract_val(val)) = ndx;
  return val;
}

#define Ndx_val(ndx) \
  *((struct _ndx **) Data_abstract_val(ndx))

static value Val_pnt(struct _pnt *pnt)
{
  value val = caml_alloc(1, Abstract_tag);
  *((struct _pnt **) Data_abstract_val(val)) = pnt;
  return val;
}

#define Pnt_val(pnt) \
  *((struct _pnt **) Data_abstract_val(pnt))

#if OCAML_VERSION < 41200

#define Val_none Val_int(0)
#else

#endif

CAMLprim value
caml_create_img(value _w, value _h)
{
  struct _img *img;
  unsigned int w;
  unsigned int h;
  w = Int_val(_w);
  h = Int_val(_h);
  img = create_img(w, h);
  return Val_img(img);
}

CAMLprim value
caml_read_p1(value _s)
{
  struct _img *img;
  const char *s;
  s = String_val(_s);
  img = read_p1(s);
  if (img == NULL) {
    caml_failwith("Error: read P1");
  }
  return Val_img(img);
}

CAMLprim value
caml_free_img(value caml_img)
{
  struct _img *img;
  img = Img_val(caml_img);
  free_img(img);
  return Val_unit;
}

CAMLprim value
caml_strk_rect(value caml_img, value caml_rect, value px)
{
  struct _img *img;
  struct _rect rect;
  unsigned char v;
  int _x;
  int _y;
  unsigned int _w;
  unsigned int _h;

  img = Img_val(caml_img);
  v = Int_val(px);

  _x = Int_val(Field(caml_rect, 0));
  _y = Int_val(Field(caml_rect, 1));
  _w = Int_val(Field(caml_rect, 2));
  _h = Int_val(Field(caml_rect, 3));

  rect.x = _x;
  rect.y = _y;
  rect.w = _w;
  rect.h = _h;

  strk_rect(img, &rect, v);

  return Val_unit;
}

CAMLprim value
caml_draw_rect(value caml_img, value caml_rect, value px)
{
  struct _img *img;
  struct _rect rect;
  unsigned char v;
  int _x;
  int _y;
  unsigned int _w;
  unsigned int _h;

  img = Img_val(caml_img);
  v = Int_val(px);

  _x = Int_val(Field(caml_rect, 0));
  _y = Int_val(Field(caml_rect, 1));
  _w = Int_val(Field(caml_rect, 2));
  _h = Int_val(Field(caml_rect, 3));

  rect.x = _x;
  rect.y = _y;
  rect.w = _w;
  rect.h = _h;

  draw_rect(img, &rect, v);
  return Val_unit;
}

CAMLprim value
caml_draw_circ(value caml_img, value caml_c, value caml_r, value px)
{
  struct _img *img;
  struct _pnt c;
  unsigned int r;
  unsigned char v;
  img = Img_val(caml_img);
  c.x = Int_val(Field(caml_c, 0));
  c.y = Int_val(Field(caml_c, 1));
  r = Int_val(caml_r);
  v = Int_val(px);
  draw_circ(img, &c, r, v);
  return Val_unit;
}

CAMLprim value
caml_strk_circ(value caml_img, value caml_c, value caml_r, value px)
{
  struct _img *img;
  struct _pnt c;
  unsigned int r;
  unsigned char v;
  img = Img_val(caml_img);
  c.x = Int_val(Field(caml_c, 0));
  c.y = Int_val(Field(caml_c, 1));
  r = Int_val(caml_r);
  v = Int_val(px);
  strk_circ(img, &c, r, v);
  return Val_unit;
}

CAMLprim value
caml_draw_losng(value caml_img, value caml_p, value caml_d, value px)
{
  struct _img *img;
  struct _pnt p;
  unsigned int d;
  unsigned char v;
  img = Img_val(caml_img);
  p.x = Int_val(Field(caml_p, 0));
  p.y = Int_val(Field(caml_p, 1));
  d = Int_val(caml_d);
  v = Int_val(px);
  draw_losng(img, &p, d, v);
  return Val_unit;
}

CAMLprim value
caml_put_px(value caml_img, value caml_p, value px)
{
  struct _img *img;
  int x;
  int y;
  unsigned char v;
  img = Img_val(caml_img);
  x = Int_val(Field(caml_p, 0));
  y = Int_val(Field(caml_p, 1));
  v = Int_val(px);
  put_px(img, x, y, v);
  return Val_unit;
}

CAMLprim value
caml_draw_line(value caml_img, value caml_p1, value caml_p2, value px)
{
  struct _img *img;
  struct _pnt p1;
  struct _pnt p2;
  unsigned char v;
  img = Img_val(caml_img);
  p1.x = Int_val(Field(caml_p1, 0));
  p1.y = Int_val(Field(caml_p1, 1));
  p2.x = Int_val(Field(caml_p2, 0));
  p2.y = Int_val(Field(caml_p2, 1));
  v = Int_val(px);
  draw_line(img, &p1, &p2, v);
  return Val_unit;
}

CAMLprim value
caml_quad_bcurve(value caml_img, value caml_p1, value caml_p2, value caml_p3, value px)
{
  struct _img *img;
  struct _pnt p1;
  struct _pnt p2;
  struct _pnt p3;
  unsigned char v;
  img = Img_val(caml_img);
  p1.x = Int_val(Field(caml_p1, 0));
  p1.y = Int_val(Field(caml_p1, 1));
  p2.x = Int_val(Field(caml_p2, 0));
  p2.y = Int_val(Field(caml_p2, 1));
  p3.x = Int_val(Field(caml_p3, 0));
  p3.y = Int_val(Field(caml_p3, 1));
  v = Int_val(px);
  quad_bcurve(img, &p1, &p2, &p3, v);
  return Val_unit;
}

CAMLprim value
caml_mana_dist(value caml_p1, value caml_p2)
{
  struct _pnt p1;
  struct _pnt p2;
  unsigned int d;
  p1.x = Int_val(Field(caml_p1, 0));
  p1.y = Int_val(Field(caml_p1, 1));
  p2.x = Int_val(Field(caml_p2, 0));
  p2.y = Int_val(Field(caml_p2, 1));
  d = mana_dist(&p1, &p2);
  return Val_long(d);
}

CAMLprim value
caml_get_px(value caml_img, value caml_p)
{
  struct _img *img;
  struct _pnt p;
  unsigned char v;
  p.x = Int_val(Field(caml_p, 0));
  p.y = Int_val(Field(caml_p, 1));
  img = Img_val(caml_img);
  v = get_px(img, p.x, p.y);
  return Val_long(v);
}

CAMLprim value
caml_get_ba(value caml_img)
{
  struct _img *img;
  unsigned char v;
  long dims[2];
  value ba;
  int kind;
  int layout;
  int numdims;
  int flags;
  img = Img_val(caml_img);
  dims[0] = img->h;
  dims[1] = img->w;
  numdims = 2;
  kind = CAML_BA_UINT8;
  layout = CAML_BA_C_LAYOUT;
  flags = kind | layout;
  ba = caml_ba_alloc(flags, numdims, (void *)img->ds, dims);
  return ba;
}

CAMLprim value
caml_draw_letter(value caml_img, value caml_p, value caml_c, value px)
{
  struct _img *img;
  struct _pnt p;
  unsigned char v;
  unsigned char c;
  img = Img_val(caml_img);
  p.x = Int_val(Field(caml_p, 0));
  p.y = Int_val(Field(caml_p, 1));
  v = Int_val(px);
  c = Int_val(caml_c);
  draw_letter(img, p.x, p.y, c, v);
  return Val_long(v);
}

CAMLprim value
caml_draw_tri(value caml_img, value caml_a, value caml_b, value caml_c, value px)
{
  struct _img *img;
  struct _pnt a;
  struct _pnt b;
  struct _pnt c;
  unsigned char v;
  img = Img_val(caml_img);
  a.x = Int_val(Field(caml_a, 0));
  a.y = Int_val(Field(caml_a, 1));
  b.x = Int_val(Field(caml_b, 0));
  b.y = Int_val(Field(caml_b, 1));
  c.x = Int_val(Field(caml_c, 0));
  c.y = Int_val(Field(caml_c, 1));
  v = Int_val(px);
  draw_tri(img, &a, &b, &c, v);
  return Val_unit;
}

CAMLprim value
caml_draw_cnvx(value caml_img, value caml_plgn, value px)
{
  struct _img *img;
  unsigned char v;
  struct _pnt *ps;
  int d, num;
  value caml_pnt;
  img = Img_val(caml_img);
  num = Wosize_val(caml_plgn);
  ps = malloc(num * sizeof(struct _pnt));
  for (d = 0; d < num; d++) {
    caml_pnt = Field(caml_plgn, d);
    ps[d].x = Int_val(Field(caml_pnt, 0));
    ps[d].y = Int_val(Field(caml_pnt, 1));
  }
  draw_cnvx(img, ps, num, v);
  free(ps);
  return Val_unit;
}

CAMLprim value
caml_draw_mana(value caml_img, value caml_plots)
{
  struct _plot *plots;
  unsigned int num_plots, d;
  struct _img *img;
  value caml_plot;
  img = Img_val(caml_img);
  num_plots = Wosize_val(caml_plots);
  plots = malloc(num_plots * sizeof(struct _plot));
  for (d = 0; d < num_plots; d++) {
    caml_plot = Field(caml_plots, d);
    plots[d].x = Int_val(Field(caml_plot, 0));
    plots[d].y = Int_val(Field(caml_plot, 1));
    plots[d].v = Int_val(Field(caml_plot, 2));
  }
  draw_mana(img, plots, num_plots);
  free(plots);
  return Val_unit;
}

CAMLprim value
caml_print_img(value caml_img)
{
  struct _img *img;
  img = Img_val(caml_img);
  print_img(img);
  return Val_unit;
}

CAMLprim value
caml_print_img_magic(value caml_img)
{
  struct _img *img;
  img = Img_val(caml_img);
  print_img_magic(img);
  return Val_unit;
}

CAMLprim value
caml_print_img_dims(value caml_img)
{
  struct _img *img;
  img = Img_val(caml_img);
  print_img_dims(img);
  return Val_unit;
}

CAMLprim value
caml_print_img_data(value caml_img)
{
  struct _img *img;
  img = Img_val(caml_img);
  print_img_data(img);
  return Val_unit;
}

CAMLprim value
caml_stdio_flush(value caml_u)
{
  stdio_flush();
  return Val_unit;
}

CAMLprim value
caml_print_p3_dims(value caml_p3)
{
  struct _p3 *p3;
  p3 = P3_val(caml_p3);
  print_p3_dims(p3);
  return Val_unit;
}

CAMLprim value
caml_print_p3_data(value caml_p3)
{
  struct _p3 *p3;
  p3 = P3_val(caml_p3);
  print_p3_data(p3);
  return Val_unit;
}

CAMLprim value
caml_print_p3_magic(value caml_p3)
{
  struct _p3 *p3;
  p3 = P3_val(caml_p3);
  print_p3_magic(p3);
  return Val_unit;
}

CAMLprim value
caml_put_p3_color(value caml_p3, value caml_x, value caml_y, value caml_r, value caml_g, value caml_b)
{
  struct _p3 *p3;
  int x;
  int y;
  unsigned char v1;
  unsigned char v2;
  unsigned char v3;
  v1 = Int_val(caml_r);
  v2 = Int_val(caml_g);
  v3 = Int_val(caml_b);
  p3 = P3_val(caml_p3);
  x = Long_val(caml_x);
  y = Long_val(caml_y);
  put_p3_color(p3, x, y, v1, v2, v3);
  return Val_unit;
}

CAMLprim value
caml_put_p3_color_bytecode(value *argv, int argn)
{
  return caml_put_p3_color(argv[0], argv[1], argv[2],
                           argv[3], argv[4], argv[5]);
}

CAMLprim value
caml_put_p3_rgb(value caml_p3, value caml_x, value caml_y, value caml_color)
{
  struct _p3 *p3;
  struct _color col;
  int x;
  int y;
  value r = Field(caml_color, 0);
  value g = Field(caml_color, 1);
  value b = Field(caml_color, 2);
  col.r = Int_val(r);
  col.g = Int_val(g);
  col.b = Int_val(b);
  p3 = P3_val(caml_p3);
  x = Long_val(caml_x);
  y = Long_val(caml_y);
  put_p3_rgb(p3, x, y, &col);
  return Val_unit;
}

CAMLprim value
caml_get_p3_rgb(value caml_p3, value caml_x, value caml_y)
{
  CAMLparam3(caml_p3, caml_x, caml_y);
  CAMLlocal2(caml_col, caml_opt);
  int x;
  int y;
  int _r;
  struct _p3 *p3;
  struct _color col;
  p3 = P3_val(caml_p3);
  x = Long_val(caml_x);
  y = Long_val(caml_y);
  _r = get_p3_rgb(p3, x, y, &col);
  if (_r == 0) {
    caml_opt = Val_none;
  } else {
    caml_col = caml_alloc(3, 0);
    Store_field(caml_col, 0, Val_int(col.r));
    Store_field(caml_col, 1, Val_int(col.g));
    Store_field(caml_col, 2, Val_int(col.b));
    caml_opt = caml_alloc(1, 0);
    Store_field(caml_opt, 0, caml_col);
  }
  CAMLreturn(caml_opt);
}

CAMLprim value
caml_print_p3(value caml_p3)
{
  struct _p3 *p3;
  p3 = P3_val(caml_p3);
  print_p3(p3);
  return Val_unit;
}

CAMLprim value
caml_create_p3(value _w, value _h)
{
  struct _p3 *p3;
  unsigned int w;
  unsigned int h;
  w = Int_val(_w);
  h = Int_val(_h);
  p3 = create_p3(w, h);
  return Val_p3(p3);
}

CAMLprim value
caml_free_p3(value caml_p3)
{
  struct _p3 *p3;
  p3 = P3_val(caml_p3);
  free_p3(p3);
  return Val_unit;
}

CAMLprim value
caml_p3_of_p1(value caml_p3, value caml_img)
{
  struct _p3 *p3;
  struct _img *img;
  img = Img_val(caml_img);
  p3 = P3_val(caml_p3);
  p3_of_p1(p3, img);
  return Val_unit;
}

CAMLprim value
caml_p3_p1_eq_size(value caml_p3, value caml_img)
{
  int b;
  struct _p3 *p3;
  struct _img *img;
  p3 = P3_val(caml_p3);
  img = Img_val(caml_img);
  b = p3_p1_eq_size(p3, img);
  if (b) return Val_true;
  else return Val_false;
}

static const enum _append_mode append_mode_table[] = {
  MINUS_APPEND,
  TRANSP_COLOR,
  TWO_COLOR,
  ZERO_TRANSL
};

CAMLprim value
caml_p3_lay_ndx(value caml_p3, value caml_ndx, value caml_append_mode, value caml_colors)
{
  enum _append_mode append_mode;
  struct _p3 *p3;
  struct _ndx *ndx;
  ndx = Ndx_val(caml_ndx);
  append_mode = append_mode_table[Long_val(caml_append_mode)];
  p3 = P3_val(caml_p3);
  switch (append_mode) {
    case MINUS_APPEND:
    case TRANSP_COLOR:
    case TWO_COLOR:
      caml_failwith("p3_lay_ndx: append_mode");
      break;
    case ZERO_TRANSL: {
      struct _color col;
      col.r = 0;
      col.g = 0;
      col.b = 0;
      p3_lay_ndx(p3, ndx, append_mode, &col);
    } break;
  }
  return Val_unit;
}

CAMLprim value
caml_print_ndx(value caml_ndx)
{
  struct _ndx *ndx;
  ndx = Ndx_val(caml_ndx);
  print_ndx(ndx);
  return Val_unit;
}

CAMLprim value
caml_p3_lay_p1(value caml_p3, value caml_img, value caml_append_mode, value caml_colors)
{
  enum _append_mode append_mode;
  struct _p3 *p3;
  struct _img *img;
  append_mode = append_mode_table[Long_val(caml_append_mode)];
  p3 = P3_val(caml_p3);
  img = Img_val(caml_img);
  switch (append_mode) {
    case MINUS_APPEND:
      p3_lay_p1(p3, img, append_mode, NULL);
      break;
    case TRANSP_COLOR: {
      struct _color col;
      value caml_color0 = Field(caml_colors, 0);
      value r = Field(caml_color0, 0);
      value g = Field(caml_color0, 1);
      value b = Field(caml_color0, 2);
      col.r = Int_val(r);
      col.g = Int_val(g);
      col.b = Int_val(b);
      p3_lay_p1(p3, img, append_mode, &col);
    } break;
    case TWO_COLOR: {
      struct _color col2[2];
      value caml_color1 = Field(caml_colors, 0);
      value caml_color2 = Field(caml_colors, 1);
      col2[0].r = Int_val(Field(caml_color1, 0));
      col2[0].g = Int_val(Field(caml_color1, 1));
      col2[0].b = Int_val(Field(caml_color1, 2));
      col2[1].r = Int_val(Field(caml_color2, 0));
      col2[1].g = Int_val(Field(caml_color2, 1));
      col2[1].b = Int_val(Field(caml_color2, 2));
      p3_lay_p1(p3, img, append_mode, col2);
    } break;
  }
  return Val_unit;
}

CAMLprim value
caml_ndx_max_num(value u)
{ return Val_long(ndx_max_num());
}

CAMLprim value
caml_p3_of_ndx(value caml_p3, value caml_ndx)
{
  struct _ndx *ndx;
  struct _p3 *p3;
  ndx = Ndx_val(caml_ndx);
  p3 = P3_val(caml_p3);
  p3_of_ndx(p3, ndx);
  return Val_unit;
}

CAMLprim value
caml_default_ndx_rgb(value caml_ndx, value caml_color)
{
  struct _ndx *ndx;
  struct _color col;
  value r = Field(caml_color, 0);
  value g = Field(caml_color, 1);
  value b = Field(caml_color, 2);
  col.r = Int_val(r);
  col.g = Int_val(g);
  col.b = Int_val(b);
  ndx = Ndx_val(caml_ndx);
  default_ndx_rgb(ndx, &col);
  return Val_unit;
}

CAMLprim value
caml_put_ndx_rgb(value caml_ndx, value caml_x, value caml_y, value caml_color)
{
  struct _ndx *ndx;
  struct _color col;
  int x;
  int y;
  value r = Field(caml_color, 0);
  value g = Field(caml_color, 1);
  value b = Field(caml_color, 2);
  col.r = Int_val(r);
  col.g = Int_val(g);
  col.b = Int_val(b);
  x = Long_val(caml_x);
  y = Long_val(caml_y);
  ndx = Ndx_val(caml_ndx);
  put_ndx_rgb(ndx, x, y, &col);
  return Val_unit;
}

CAMLprim value
caml_create_ndx(value _w, value _h)
{
  struct _ndx *ndx;
  unsigned int w;
  unsigned int h;
  w = Int_val(_w);
  h = Int_val(_h);
  ndx = create_ndx(w, h);
  return Val_ndx(ndx);
}

CAMLprim value
caml_free_ndx(value caml_ndx)
{
  struct _ndx *ndx;
  ndx = Ndx_val(caml_ndx);
  free_ndx(ndx);
  return Val_unit;
}

CAMLprim value
caml_strk_rect_r(value caml_rect)
{
  CAMLparam1(caml_rect);
  CAMLlocal2(caml_pnt, caml_p);
  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _rect rect;
  unsigned char v;
  unsigned int n;
  unsigned int d;
  int _x;
  int _y;
  unsigned int _w;
  unsigned int _h;

  _x = Int_val(Field(caml_rect, 0));
  _y = Int_val(Field(caml_rect, 1));
  _w = Int_val(Field(caml_rect, 2));
  _h = Int_val(Field(caml_rect, 3));

  rect.x = _x;
  rect.y = _y;
  rect.w = _w;
  rect.h = _h;

  pnt = strk_rect_r(&rect, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_quad_bcurve_r(value caml_p1, value caml_p2, value caml_p3)
{
  CAMLparam3(caml_p1, caml_p2, caml_p3);
  CAMLlocal2(caml_pnt, caml_p);
  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _pnt p1;
  struct _pnt p2;
  struct _pnt p3;
  unsigned int n;
  unsigned int d;
  p1.x = Int_val(Field(caml_p1, 0));
  p1.y = Int_val(Field(caml_p1, 1));
  p2.x = Int_val(Field(caml_p2, 0));
  p2.y = Int_val(Field(caml_p2, 1));
  p3.x = Int_val(Field(caml_p3, 0));
  p3.y = Int_val(Field(caml_p3, 1));

  pnt = quad_bcurve_r(&p1, &p2, &p3, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_draw_tri_r(value caml_a, value caml_b, value caml_c)
{
  CAMLparam3(caml_a, caml_b, caml_c);
  CAMLlocal2(caml_pnt, caml_p);

  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _pnt pa;
  struct _pnt pb;
  struct _pnt pc;
  unsigned int n;
  unsigned int d;

  pa.x = Int_val(Field(caml_a, 0));
  pa.y = Int_val(Field(caml_a, 1));

  pb.x = Int_val(Field(caml_b, 0));
  pb.y = Int_val(Field(caml_b, 1));

  pc.x = Int_val(Field(caml_c, 0));
  pc.y = Int_val(Field(caml_c, 1));

  pnt = draw_tri_r(&pa, &pb, &pc, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_draw_rect_r(value caml_rect)
{
  CAMLparam1(caml_rect);
  CAMLlocal2(caml_pnt, caml_p);

  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _rect rect;
  int _x;
  int _y;
  unsigned int _w;
  unsigned int _h;
  unsigned int n;
  unsigned int d;

  _x = Int_val(Field(caml_rect, 0));
  _y = Int_val(Field(caml_rect, 1));
  _w = Int_val(Field(caml_rect, 2));
  _h = Int_val(Field(caml_rect, 3));

  rect.x = _x;
  rect.y = _y;
  rect.w = _w;
  rect.h = _h;

  pnt = draw_rect_r(&rect, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_draw_circ_r(value caml_c, value caml_r)
{
  CAMLparam2(caml_c, caml_r);
  CAMLlocal2(caml_pnt, caml_p);

  struct _pnt c;
  unsigned int r;
  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _pnt p1;
  struct _pnt p2;
  unsigned int n;
  unsigned int d;
  c.x = Int_val(Field(caml_c, 0));
  c.y = Int_val(Field(caml_c, 1));
  r = Int_val(caml_r);
  pnt = draw_circ_r(&c, r, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_strk_circ_r(value caml_c, value caml_r)
{
  CAMLparam2(caml_c, caml_r);
  CAMLlocal2(caml_pnt, caml_p);

  struct _pnt c;
  unsigned int r;
  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _pnt p1;
  struct _pnt p2;
  unsigned int n;
  unsigned int d;
  c.x = Int_val(Field(caml_c, 0));
  c.y = Int_val(Field(caml_c, 1));
  r = Int_val(caml_r);
  pnt = strk_circ_r(&c, r, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_draw_line_r(value caml_p1, value caml_p2)
{
  CAMLparam2(caml_p1, caml_p2);
  CAMLlocal2(caml_pnt, caml_p);

  struct _pnt *pnt0;
  struct _pnt *pnt;
  struct _pnt p1;
  struct _pnt p2;
  unsigned int n;
  unsigned int d;
  p1.x = Int_val(Field(caml_p1, 0));
  p1.y = Int_val(Field(caml_p1, 1));
  p2.x = Int_val(Field(caml_p2, 0));
  p2.y = Int_val(Field(caml_p2, 1));
  pnt = draw_line_r(&p1, &p2, &n);

  caml_pnt = caml_alloc(n, 0);

  for (d = 0; d < n; d++) {
    value caml_p;
    caml_p = caml_alloc(2, 0);
    pnt0 = pnt_r(pnt, d);
    Store_field(caml_p, 0, Val_long(pnt0->x));
    Store_field(caml_p, 1, Val_long(pnt0->y));
    Store_field(caml_pnt, d, caml_p);
  }
  free_r(pnt);

  CAMLreturn(caml_pnt);
}

CAMLprim value
caml_free_r(value caml_pnt)
{
  struct _pnt *pnt;
  pnt = Pnt_val(caml_pnt);
  free_r(pnt);
  return Val_unit;
}

