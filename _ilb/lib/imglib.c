/* A small p1 image-lib */
/* Author: Florent Monnier */
/* Date: Jan, 2026 */

#include "imglib.h"
#include "letters.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct _img *
create_img(unsigned int w, unsigned int h)
{
  struct _img *usr_img;

  usr_img = malloc(sizeof(struct _img));

  usr_img->ds = malloc((w * h * 1) * sizeof(unsigned char));
  memset(usr_img->ds, 0, (w * h * 1) * sizeof(unsigned char));

  usr_img->w = w;
  usr_img->h = h;

  return usr_img;
}

struct _p3 *
create_p3(unsigned int w, unsigned int h)
{
  struct _p3 *p3;

  p3 = malloc(sizeof(struct _p3));

  p3->ds = malloc((w * h * 3) * sizeof(unsigned char));
  memset(p3->ds, 0, (w * h * 3) * sizeof(unsigned char));

  p3->w = w;
  p3->h = h;

  return p3;
}

void
free_p3(struct _p3 *p3)
{
  free(p3->ds);
  free(p3);
}

#define MAX_NDX 356

int
ndx_max_num(void)
{
  int num;
  num = MAX_NDX;
  return num;
}

void
print_ndx(struct _ndx *ndx)
{
  unsigned char d0;
  unsigned char d1;
  unsigned char d2;
  unsigned int x;
  unsigned int y;
  unsigned int w2;
  unsigned int h2;
  unsigned long n0;
  unsigned char d;
  unsigned long n;
  w2 = ndx->w;
  h2 = ndx->h;
  printf("P3\n");
  printf("%d %d\n", w2, h2);
  printf("255\n");
  for (y = 0; y < h2; y++) {
    for (x = 0; x < w2; x++) {
      n0 = (y * w2 * 3) + (x * 3);
      n = (y * w2) + x;
      d = ndx->ds[n];
      d0 = ndx->c[d].r;
      d1 = ndx->c[d].g;
      d2 = ndx->c[d].b;
      if (x == 0) {
        printf("%d %d %d", d0, d1, d2);
      } else {
        printf(" %d %d %d", d0, d1, d2);
      }
    }
    printf("\n");
  }
}

void
p3_of_ndx(struct _p3 *p3, struct _ndx *ndx)
{
  unsigned int x;
  unsigned int y;
  unsigned int w1;
  unsigned int h1;
  unsigned int w2;
  unsigned int h2;
  unsigned long n0;
  unsigned char d;
  unsigned long n;
  w1 = p3->w;
  h1 = p3->h;
  w2 = ndx->w;
  h2 = ndx->h;
  if (w1 != w2) return ;
  if (h1 != h2) return ;
  for (y = 0; y < h1; y++) {
    for (x = 0; x < w1; x++) {
      n0 = (y * w1 * 3) + (x * 3);
      n = (y * w1) + x;
      d = ndx->ds[n];
      p3->ds[n0]   = ndx->c[d].r;
      p3->ds[n0+1] = ndx->c[d].g;
      p3->ds[n0+2] = ndx->c[d].b;
    }
  }
}

void
default_ndx_rgb(struct _ndx *ndx, struct _color *col)
{
  unsigned int n;
  unsigned char prev;

  n = ndx->n;
  ndx->n++;

  if (n < MAX_NDX) {
    ndx->c[n].r = col->r;
    ndx->c[n].g = col->g;
    ndx->c[n].b = col->b;
  }
}

void
put_ndx_rgb(struct _ndx *ndx, int x, int y, struct _color *col)
{
  unsigned int r;
  unsigned int d;
  unsigned int n;
  unsigned long n0;
  unsigned char prev;

  n = ndx->n;
  r = 0;

  for (d = 0; d < (n+1); d++) {
    if (
      ndx->c[d].r == col->r &&
      ndx->c[d].g == col->g &&
      ndx->c[d].b == col->b )
    {
      r = 1;
      n = d;
      break;
    }
  }

  if (r == 0) {
    if (n < MAX_NDX) {
      ndx->n++;
      ndx->c[n].r = col->r;
      ndx->c[n].g = col->g;
      ndx->c[n].b = col->b;
    } else {
      ndx->n = MAX_NDX;
      n = MAX_NDX;
    }
  }

  if (x >= 0 && x < ndx->w) {
    if (y >= 0 && y < ndx->h) {
      n0 = (y * ndx->w) + x;
      ndx->ds[n0] = n;
    }
  }
}

struct _ndx *
create_ndx(unsigned int w, unsigned int h)
{
  struct _ndx *ndx;

  ndx = malloc(sizeof(struct _ndx));

  ndx->ds = malloc((w * h * 1) * sizeof(unsigned char));
  memset(ndx->ds, 0, (w * h * 1) * sizeof(unsigned char));

  ndx->w = w;
  ndx->h = h;
  ndx->n = 0;

  ndx->c = malloc((MAX_NDX + 1) * sizeof(struct _color));

  ndx->c[MAX_NDX].r = 0;
  ndx->c[MAX_NDX].g = 0;
  ndx->c[MAX_NDX].b = 0;

  return ndx;
}

void
free_ndx(struct _ndx *ndx)
{
  free(ndx->ds);
  free(ndx->c);
  free(ndx);
}

void
free_img(struct _img *img)
{
  free(img->ds);
  free(img);
}

void
put_px(struct _img *img, int x, int y, unsigned char value)
{
  unsigned long n;
  unsigned char prev;

  if (x >= 0 && x < img->w) {
    if (y >= 0 && y < img->h) {
      n = (y * img->w) + x;
      switch (value) {
        case 0:
        case 1:
          img->ds[n] = value;
          break;
        case 3:
          prev = img->ds[n];
          switch (prev) {
            case 0:
              img->ds[n] = 1;
              break;
            case 1:
              img->ds[n] = 0;
              break;
          }
          break;
      }
    }
  }
}

void
put_p3_color(struct _p3 *p3, int x, int y, unsigned char v1, unsigned char v2, unsigned char v3)
{
  unsigned long n0;
  unsigned char prev;

  if (x >= 0 && x < p3->w) {
    if (y >= 0 && y < p3->h) {
      n0 = (y * p3->w * 3) + (x * 3);
      p3->ds[n0]   = v1;
      p3->ds[n0+1] = v2;
      p3->ds[n0+2] = v3;
    }
  }
}

void
put_p3_rgb(struct _p3 *p3, int x, int y, struct _color *col)
{
  unsigned long n0;
  unsigned char prev;

  if (x >= 0 && x < p3->w) {
    if (y >= 0 && y < p3->h) {
      n0 = (y * p3->w * 3) + (x * 3);
      p3->ds[n0]   = col->r;
      p3->ds[n0+1] = col->g;
      p3->ds[n0+2] = col->b;
    }
  }
}

int
get_p3_rgb(struct _p3 *p3, int x, int y, struct _color *col)
{
  unsigned long n0;
  unsigned char prev;

  if (x >= 0 && x < p3->w) {
    if (y >= 0 && y < p3->h) {
      n0 = (y * p3->w * 3) + (x * 3);
      col->r = p3->ds[n0]  ;
      col->g = p3->ds[n0+1];
      col->b = p3->ds[n0+2];
      return 1;
    }
  }
  return 0;
}

unsigned char
get_px(struct _img *img, int x, int y)
{
  unsigned long n;
  unsigned char v;

  v = 0;

  if (x >= 0 && x < img->w) {
    if (y >= 0 && y < img->h) {
      n = (y * img->w) + x;
      v = img->ds[n];
    }
  }

  return (v);
}

void
strk_rect(struct _img *img, struct _rect *rect, unsigned char value)
{
  int _x = rect->x;
  int _y = rect->y;
  unsigned int _w = rect->w;
  unsigned int _h = rect->h;

  int x;
  int y;

  for (x = _x; x < (_x + _w); x++) {
    put_px(img, x, _y, value);
    put_px(img, x, _y + _h, value);
  }

  //for (y = _y; y < (_y + _h); y++) {
  for (y = _y+1; y < (_y + _h - 1); y++) {
    put_px(img, _x, y, value);
    put_px(img, _x + _w, y, value);
  }
}

void
draw_rect(struct _img *img, struct _rect *rect, unsigned char value)
{
  int _x = rect->x;
  int _y = rect->y;
  unsigned int _w = rect->w;
  unsigned int _h = rect->h;

  int x;
  int y;
  unsigned long n;

  for (y = _y; y < (_y + _h); y++) {
    for (x = _x; x < (_x + _w); x++) {
      put_px(img, x, y, value);
    }
  }
}

void
draw_letter(struct _img *img, int _x, int _y, unsigned char ltr, unsigned char value)
{
  unsigned long p;
  unsigned long d;
  unsigned long c;
  unsigned long n;
  unsigned int x;
  unsigned int y;
  unsigned char ch;

  d = sizeof(_letters) / sizeof(struct _letter);
  c = 0;

  for (n = 0; n < d; n++) {
    ch = _letters[n]._letter;
    if (ch == ltr) { c = n; break; }
  }

  for (y = 0; y < 5; y++) {
    for (x = 0; x < 5; x++) {
      p = (y * 5) + x;
      ch = _letters[c]._letter_5x5[p];
      switch (ch) {
        case '1':
          put_px(img, _x + x, _y + y, value);
          break;
      }
    }
  }
}

void
draw_losng(struct _img *img, struct _pnt *p, unsigned int d, unsigned char value)
{
  int _x;
  int _y;

  unsigned int _d;

  _x = p->x;
  _y = p->y;

  for (_d = 0; _d < d; _d++) {
    _x += 1;
    _y += 1;
    put_px(img, _x, _y, value);
  }

  for (_d = 0; _d < d; _d++) {
    _x += 1;
    _y -= 1;
    put_px(img, _x, _y, value);
  }

  for (_d = 0; _d < d; _d++) {
    _x -= 1;
    _y -= 1;
    put_px(img, _x, _y, value);
  }

  for (_d = 0; _d < d; _d++) {
    _x -= 1;
    _y += 1;
    put_px(img, _x, _y, value);
  }
}

unsigned int
sq_dist(struct _pnt *p1, struct _pnt *p2)
{
  int x1;
  int y1;
  int x2;
  int y2;
  int dx;
  int dy;

  unsigned int sq_dist;

  x1 = p1->x;
  y1 = p1->y;

  x2 = p2->x;
  y2 = p2->y;

  dx = x2 - x1;
  dy = y2 - y1;

  sq_dist = (dx * dx) + (dy * dy);

  return (sq_dist);
}

void
draw_circ(struct _img *img, struct _pnt *c, unsigned int r, unsigned char value)
{
  unsigned int w;
  unsigned int h;

  int cx;
  int cy;

  int _x1;
  int _y1;
  int _x2;
  int _y2;

  int x;
  int y;

  unsigned int d;
  unsigned long n;

  w = img->w;
  h = img->h;

  cx = c->x;
  cy = c->y;

  _x1 = cx - r;
  _y1 = cy - r;
  _x2 = cx + r;
  _y2 = cy + r;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if (d < (r * r)) {
        put_px(img, x, y, value);
      }
    }
  }
}

void
strk_circ(struct _img *img, struct _pnt *c, unsigned int r, unsigned char value)
{
  unsigned int w;
  unsigned int h;

  int cx;
  int cy;

  int _x1;
  int _y1;
  int _x2;
  int _y2;

  int x;
  int y;

  unsigned int d;
  unsigned long n;

  unsigned int r2;

  w = img->w;
  h = img->h;

  cx = c->x;
  cy = c->y;

  _x1 = cx - r;
  _y1 = cy - r;
  _x2 = cx + r;
  _y2 = cy + r;

  r2 = r * r;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if ((r2 - d) < (r*2)) {
        put_px(img, x, y, value);
      }
    }
  }
}

int
interv_map(int a, int b, int c, int d, int x)
{
  return ( ( (x - a) * (d - c) ) / (b - a) + c );
}

struct _pnt *
draw_rect_r(struct _rect *rect, unsigned int *n)
{
  struct _pnt *pnt;
  unsigned int _n;

  int _x = rect->x;
  int _y = rect->y;
  unsigned int _w = rect->w;
  unsigned int _h = rect->h;

  int x;
  int y;

  pnt = malloc((_w * _h) * sizeof(struct _pnt));
  *n = (_w * _h);
  _n = 0;

  for (y = _y; y < (_y + _h); y++) {
    for (x = _x; x < (_x + _w); x++) {
      pnt[_n].x = x;
      pnt[_n].y = y;
      _n++;
    }
  }
  return pnt;
}

struct _pnt *
strk_rect_r(struct _rect *rect, unsigned int *n)
{
  struct _pnt *pnt;
  unsigned int _n;

  int _x = rect->x;
  int _y = rect->y;
  unsigned int _w = rect->w;
  unsigned int _h = rect->h;

  int x;
  int y;

  for (x = _x; x < (_x + _w); x++) {
    _n++;
    _n++;
  }

  for (y = _y+1; y < (_y + _h - 1); y++) {
    _n++;
    _n++;
  }

  pnt = malloc((_n) * sizeof(struct _pnt));
  *n = _n;
  _n = 0;

  for (x = _x; x < (_x + _w); x++) {
    pnt[_n].x = x;
    pnt[_n].y = _y;
    _n++;

    pnt[_n].x = x;
    pnt[_n].y = _y + _h;
    _n++;
  }

  for (y = _y+1; y < (_y + _h - 1); y++) {
    pnt[_n].x = _x;
    pnt[_n].y = y;
    _n++;

    pnt[_n].x = _x + _w;
    pnt[_n].y = y;
    _n++;
  }

  return pnt;
}

struct _pnt *
draw_circ_r(struct _pnt *c, unsigned int r, unsigned int *n)
{
  struct _pnt *pnt;
  unsigned int _n;

  int cx;
  int cy;

  int _x1;
  int _y1;
  int _x2;
  int _y2;

  int x;
  int y;

  unsigned int d;

  cx = c->x;
  cy = c->y;

  _x1 = cx - r;
  _y1 = cy - r;
  _x2 = cx + r;
  _y2 = cy + r;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if (d < (r * r)) {
        _n++;
      }
    }
  }

  pnt = malloc(_n * sizeof(struct _pnt));
  *n = _n;
  _n = 0;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if (d < (r * r)) {
        pnt[_n].x = x;
        pnt[_n].y = y;
        _n++;
      }
    }
  }
  return pnt;
}

struct _pnt *
strk_circ_r(struct _pnt *c, unsigned int r, unsigned int *n)
{
  unsigned int _n;
  struct _pnt *pnt;

  int cx;
  int cy;

  int _x1;
  int _y1;
  int _x2;
  int _y2;

  int x;
  int y;

  unsigned int d;

  unsigned int r2;

  cx = c->x;
  cy = c->y;

  _x1 = cx - r;
  _y1 = cy - r;
  _x2 = cx + r;
  _y2 = cy + r;

  r2 = r * r;

  _n = 0;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if ((r2 - d) < (r*2)) {
        _n++;
      }
    }
  }

  pnt = malloc(_n * sizeof(struct _pnt));
  *n = _n;
  _n = 0;

  for (y = _y1; y < _y2; y++) {
    for (x = _x1; x < _x2; x++) {
      struct _pnt p;
      p.x = x;
      p.y = y;
      d = sq_dist(c, &p);
      if ((r2 - d) < (r*2)) {
        pnt[_n].x = x;
        pnt[_n].y = y;
        _n++;
      }
    }
  }
  return pnt;
}

struct _pnt *
draw_line_r(struct _pnt *p1, struct _pnt *p2, unsigned int *n)
{
  unsigned int _n;
  struct _pnt *pnt;

  int x1;
  int y1;

  int x2;
  int y2;

  int dx;
  int dy;

  int x;
  int y;

  int sx;
  int ex;

  int sy;
  int ey;

  x1 = p1->x;
  y1 = p1->y;

  x2 = p2->x;
  y2 = p2->y;

  _n = 0;

  if (x2 > x1) {
    dx = x2 - x1;
    sx = x1; ex = x2;
  } else {
    dx = x1 - x2;
    sx = x2; ex = x1;
  }

  if (y2 > y1) {
    dy = y2 - y1;
    sy = y1; ey = y2;
  } else {
    dy = y1 - y2;
    sy = y2; ey = y1;
  }

  if (dx > dy) {
    for (x = sx; x <= ex; x++) {
      _n++;
    }
  } else {
    for (y = sy; y <= ey; y++) {
      _n++;
    }
  }

  pnt = malloc(_n * sizeof(struct _pnt));
  *n = _n;
  _n = 0;

  if (dx > dy) {
    for (x = sx; x <= ex; x++) {
      y = interv_map(x1, x2, y1, y2, x);
      pnt[_n].x = x;
      pnt[_n].y = y;
      _n++;
    }
  } else {
    for (y = sy; y <= ey; y++) {
      x = interv_map(y1, y2, x1, x2, y);
      pnt[_n].x = x;
      pnt[_n].y = y;
      _n++;
    }
  }
  return pnt;
}

struct _pnt *
pnt_r(struct _pnt *pnt, unsigned int d)
{
  return &pnt[d];
}

void
free_r(struct _pnt *pnt)
{
  free(pnt);
}

struct _pnt *
quad_bcurve_r(struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, unsigned int *n)
{
  struct _pnt *pnt;
  unsigned int _n;
  unsigned int t;
  unsigned int t_;
  struct _pnt p;

  pnt = malloc(100 * sizeof(struct _pnt));
  *n = 100;
  _n = 0;

  for (t = 0; t <= 100; t++) {
    t_ = t * 10;
    quad_bcurve_pnt(&p, p1, p2, p3, t_);
    pnt[_n].x = p.x;
    pnt[_n].y = p.y;
    _n++;
  }
  return pnt;
}

struct _pnt *
draw_tri_r(struct _pnt *a, struct _pnt *b, struct _pnt *c, unsigned int *n)
{
  struct _pnt *pnt1;
  struct _pnt *pnt2;
  struct _pnt *pnt3;
  struct _pnt *pnt;
  unsigned int n1;
  unsigned int n2;
  unsigned int n3;
  unsigned int n0;
  unsigned int d;
  pnt1 = draw_line_r(a, b, &n1);
  pnt2 = draw_line_r(b, c, &n2);
  pnt3 = draw_line_r(c, a, &n3);
  n0 = n1+ n2+ n3;
  pnt = malloc(n0 * sizeof(struct _pnt));
  for (d = 0; d < n1; d++) {
    pnt[d].x = pnt1[d].x;
    pnt[d].y = pnt1[d].y;
  }
  for (d = 0; d < n2; d++) {
    pnt[d+n1].x = pnt2[d].x;
    pnt[d+n1].y = pnt2[d].y;
  }
  for (d = 0; d < n3; d++) {
    pnt[d+n1+n2].x = pnt3[d].x;
    pnt[d+n1+n2].y = pnt3[d].y;
  }
  *n = (n1+n2+n3);
  free_r(pnt1);
  free_r(pnt2);
  free_r(pnt3);
  return pnt;
}

void
draw_line(struct _img *img, struct _pnt *p1, struct _pnt *p2, unsigned char value)
{
  int x1;
  int y1;

  int x2;
  int y2;

  int dx;
  int dy;

  int x;
  int y;

  int sx;
  int ex;

  int sy;
  int ey;

  x1 = p1->x;
  y1 = p1->y;

  x2 = p2->x;
  y2 = p2->y;

  if (x2 > x1) {
    dx = x2 - x1;
    sx = x1; ex = x2;
  } else {
    dx = x1 - x2;
    sx = x2; ex = x1;
  }

  if (y2 > y1) {
    dy = y2 - y1;
    sy = y1; ey = y2;
  } else {
    dy = y1 - y2;
    sy = y2; ey = y1;
  }

  if (dx > dy) {
    for (x = sx; x <= ex; x++) {
      y = interv_map(x1, x2, y1, y2, x);
      put_px(img, x, y, value);
    }
  } else {
    for (y = sy; y <= ey; y++) {
      x = interv_map(y1, y2, x1, x2, y);
      put_px(img, x, y, value);
    }
  }
}

void
pnt_add(struct _pnt *r, struct _pnt *p1, struct _pnt *p2)
{
  r->x = p1->x + p2->x;
  r->y = p1->y + p2->y;
}

void
pnt_add3(struct _pnt *r, struct _pnt *p1, struct _pnt *p2, struct _pnt *p3)
{
  r->x = p1->x + p2->x + p3->x;
  r->y = p1->y + p2->y + p3->y;
}

void
pnt_mult(struct _pnt *r, struct _pnt *p, int m)
{
  r->x = m * p->x;
  r->y = m * p->y;
}

void
pnt_div(struct _pnt *r, struct _pnt *p, int d)
{
  r->x = p->x / d;
  r->y = p->y / d;
}

void
quad_bcurve_pnt(struct _pnt *r, struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, int t)
{
  int ti;

  struct _pnt pa;
  struct _pnt pb;
  struct _pnt pc;

  struct _pnt p;

  ti = 1000 - t;

  pnt_mult(&pa, p1, ((ti * ti) / 1000));
  pnt_mult(&pb, p2, ((2 * ti * t) / 1000));
  pnt_mult(&pc, p3, ((t * t) / 1000));

  pnt_add3(&p, &pa, &pb, &pc);

  pnt_div(r, &p, 1000);

  /*
    ti = 1000 - t
    ( ( p1 * ((ti * ti) / 1000)      +
        p2 * ((2 * ti * t) / 1000)   +
        p3 * ((t * t) / 1000)
      ) / 1000
    )
  */
}

void
quad_bcurve(struct _img *img, struct _pnt *p1, struct _pnt *p2, struct _pnt *p3, unsigned char value)
{
  unsigned int t;
  unsigned int t_;
  struct _pnt p;

  for (t = 0; t <= 100; t++) {
    t_ = t * 10;
    quad_bcurve_pnt(&p, p1, p2, p3, t_);
    put_px(img, p.x, p.y, value);
  }
}

unsigned int
mana_dist(struct _pnt *p1, struct _pnt *p2)
{
  int x1;
  int y1;

  int x2;
  int y2;

  int dx;
  int dy;

  x1 = p1->x;
  y1 = p1->y;

  x2 = p2->x;
  y2 = p2->y;

  if (x2 > x1) {
    dx = x2 - x1;
  } else {
    dx = x1 - x2;
  }

  if (y2 > y1) {
    dy = y2 - y1;
  } else {
    dy = y1 - y2;
  }

  return ((unsigned int) (dx + dy));
}

int
p_seg(struct _pnt *a, struct _pnt *b, struct _pnt *p)
{
  return ( (b->x - a->x) * (p->y - a->y) - (b->y - a->y) * (p->x - a->x) );
}

void
draw_tri(struct _img *img, struct _pnt *a, struct _pnt *b, struct _pnt *c, unsigned char value)
{
  int x1;
  int y1;

  int x2;
  int y2;

  int x;
  int y;

  int s0;

  if (a->x < b->x) {
    x1 = a->x;
  } else {
    x1 = b->x;
  }
  if (c->x < x1) {
    x1 = c->x;
  }

  if (a->y < b->y) {
    y1 = a->y;
  } else {
    y1 = b->y;
  }
  if (c->y < y1) {
    y1 = c->y;
  }

  if (a->x > b->x) {
    x2 = a->x;
  } else {
    x2 = b->x;
  }
  if (c->x > x2) {
    x2 = c->x;
  }

  if (a->y > b->y) {
    y2 = a->y;
  } else {
    y2 = b->y;
  }
  if (c->y > y2) {
    y2 = c->y;
  }

  s0 = p_seg(a, b, c);

  for (y = y1; y <= y2; y++) {
    for (x = x1; x <= x2; x++) {
      struct _pnt p;
      int s1;
      int s2;
      int s3;
      p.x = x;
      p.y = y;
      if (s0 < 0) {
        s1 = p_seg(a, b, &p);
        s2 = p_seg(b, c, &p);
        s3 = p_seg(c, a, &p);
      } else {
        s1 = p_seg(a, c, &p);
        s2 = p_seg(c, b, &p);
        s3 = p_seg(b, a, &p);
      }
      if (s1 < 0) {
        if (s2 < 0) {
          if (s3 < 0) {
            put_px(img, x, y, value);
          }
        }
      }
    }
  }
}

void
draw_cnvx(struct _img *img, struct _pnt *ps, int num, unsigned char value)
{
  struct _pnt p0;
  int _p;
  p0.x = ps[0].x;
  p0.y = ps[0].y;
  for (_p = 1; _p < (num-1); _p++) {
    struct _pnt p1;
    struct _pnt p2;
    int _s;
    p1.x = ps[_p].x;
    p1.y = ps[_p].y;
    p2.x = ps[_p+1].x;
    p2.y = ps[_p+1].y;
    draw_tri(img, &p0, &p1, &p2, value);
  }
}

int
mana_dist_2(int x1, int y1, int x2, int y2)
{
  int dx;
  int dy;

  dx = x2 - x1;
  dy = y2 - y1;

  if (dx < 0) dx = -dx;
  if (dy < 0) dy = -dy;

  return (dx + dy);
}

void
draw_mana(struct _img *img, struct _plot *plots, unsigned int num_plots)
{
  for (int y = 0; y < img->h; y++) {
    for (int x = 0; x < img->w; x++) {
      struct _plot *plt0 = &plots[0];
      struct _plot *plt = &plots[0];
      int d1 = mana_dist_2(x, y, plt0->x, plt0->y);
      for (int d = 1; d < num_plots; d++) {
        struct _plot *pltn = &plots[d];
        int d2 = mana_dist_2(x, y, pltn->x, pltn->y);
        if (d2 < d1) {
          plt = &plots[d];
          d1 = d2;
        }
      }
      put_px(img, x, y, plt->v);
    }
  }
}

void
print_img_magic(struct _img *img)
{
  printf("P1\n");
}

void
print_img_dims(struct _img *img)
{
  unsigned int w;
  unsigned int h;
  w = img->w;
  h = img->h;
  printf("%d %d\n", w, h);
}

void
print_img_data(struct _img *img)
{
  unsigned int x;
  unsigned int y;
  unsigned int w;
  unsigned int h;
  unsigned char d;
  unsigned long n;
  w = img->w;
  h = img->h;
  for (y = 0; y < h; y++) {
    for (x = 0; x < w; x++) {
      n = (y * w) + x;
      d = img->ds[n];
      if (x == 0)
        printf("%d", d);
      else
        printf(" %d", d);
    }
    printf("\n");
  }
}

void
print_img(struct _img *img)
{
  unsigned int x;
  unsigned int y;
  unsigned int w;
  unsigned int h;
  unsigned char d;
  unsigned long n;
  w = img->w;
  h = img->h;
  printf("P1\n");
  printf("%d %d\n", w, h);
  for (y = 0; y < h; y++) {
    for (x = 0; x < w; x++) {
      n = (y * w) + x;
      d = img->ds[n];
      if (x == 0)
        printf("%d", d);
      else
        printf(" %d", d);
    }
    printf("\n");
  }
}

int
p3_p1_eq_size(struct _p3 *p3, struct _img *img)
{
  unsigned int w1;
  unsigned int h1;
  unsigned int w2;
  unsigned int h2;
  w1 = img->w;
  h1 = img->h;
  w2 = p3->w;
  h2 = p3->h;
  if (w1 != w2) return 0;
  if (h1 != h2) return 0;
  return 1;
}

void
p3_lay_ndx(struct _p3 *p3, struct _ndx *ndx, enum _append_mode append_mode, struct _color *col)
{
  unsigned int x;
  unsigned int y;
  unsigned int w1;
  unsigned int h1;
  unsigned int w2;
  unsigned int h2;
  unsigned long n0;
  unsigned char d;
  unsigned long n;
  printf("#A\n");
  w1 = ndx->w;
  h1 = ndx->h;
  w2 = p3->w;
  h2 = p3->h;
  printf("#B\n");
  w1 = ndx->w;
  if (w1 != w2) return ;
  if (h1 != h2) return ;
  printf("#C\n");
  for (y = 0; y < h1; y++) {
    for (x = 0; x < w1; x++) {
      n0 = (y * w2 * 3) + (x * 3);
      n = (y * w1) + x;
      d = ndx->ds[n];
      switch (append_mode) {
        case MINUS_APPEND:
        case TRANSP_COLOR:
        case TWO_COLOR:
          break;
        case ZERO_TRANSL: {
          if (d == 0) { } else
          {
            p3->ds[n0]   = ndx->c[d].r;
            p3->ds[n0+1] = ndx->c[d].g;
            p3->ds[n0+2] = ndx->c[d].b;
          }
        } break;
      }
    }
  }
}

void
p3_lay_p1(struct _p3 *p3, struct _img *img, enum _append_mode append_mode, struct _color *col)
{
  unsigned int x;
  unsigned int y;
  unsigned int w1;
  unsigned int h1;
  unsigned int w2;
  unsigned int h2;
  unsigned long n0;
  unsigned char d;
  unsigned long n;
  w1 = img->w;
  h1 = img->h;
  w2 = p3->w;
  h2 = p3->h;
  if (w1 != w2) return ;
  if (h1 != h2) return ;
  for (y = 0; y < h1; y++) {
    for (x = 0; x < w1; x++) {
      n0 = (y * w1 * 3) + (x * 3);
      n = (y * w1) + x;
      d = img->ds[n];
      switch (append_mode) {
        case TWO_COLOR: {
          if (d) {
            p3->ds[n0]   = col[0].r;
            p3->ds[n0+1] = col[0].g;
            p3->ds[n0+2] = col[0].b;
          } else {
            p3->ds[n0]   = col[1].r;
            p3->ds[n0+1] = col[1].g;
            p3->ds[n0+2] = col[1].b;
          }
        } break;
        case MINUS_APPEND: {
          p3->ds[n0]   = (d ? 0 : 255);
          p3->ds[n0+1] = (d ? 0 : 255);
          p3->ds[n0+2] = (d ? 0 : 255);
        } break;
        case TRANSP_COLOR: {
          if (d) {
            p3->ds[n0]   = col->r;
            p3->ds[n0+1] = col->g;
            p3->ds[n0+2] = col->b;
          } else {
            /*
            p3->ds[n0]   = ;
            p3->ds[n0+1] = ;
            p3->ds[n0+2] = ;
            */
          }
        } break;
      }
    }
  }
}

void
p3_of_p1(struct _p3 *p3, struct _img *img)
{
  unsigned int x;
  unsigned int y;
  unsigned int w1;
  unsigned int h1;
  unsigned int w2;
  unsigned int h2;
  unsigned long n0;
  unsigned char d;
  unsigned long n;
  w1 = img->w;
  h1 = img->h;
  w2 = p3->w;
  h2 = p3->h;
  if (w1 != w2) return ;
  if (h1 != h2) return ;
  for (y = 0; y < h1; y++) {
    for (x = 0; x < w1; x++) {
      n0 = (y * w1 * 3) + (x * 3);
      n = (y * w1) + x;
      d = img->ds[n];
      p3->ds[n0]   = (d ? 0 : 255);
      p3->ds[n0+1] = (d ? 0 : 255);
      p3->ds[n0+2] = (d ? 0 : 255);
    }
  }
}

void
stdio_flush()
{
  (void)fflush(stdout);
}

void
print_p3_magic(struct _p3 *p3)
{
  printf("P3\n");
}

void
print_p3_dims(struct _p3 *p3)
{
  unsigned int w;
  unsigned int h;
  w = p3->w;
  h = p3->h;
  printf("%d %d\n", w, h);
  printf("255\n");
}

void
print_p3_data(struct _p3 *p3)
{
  unsigned int x;
  unsigned int y;
  unsigned int c;
  unsigned int w;
  unsigned int h;
  unsigned char d0;
  unsigned char d1;
  unsigned char d2;
  unsigned long n0;
  w = p3->w;
  h = p3->h;
  for (y = 0; y < h; y++) {
    for (x = 0; x < w; x++) {
      n0 = (y * w * 3) + (x * 3);
      d0 = p3->ds[n0];
      d1 = p3->ds[n0+1];
      d2 = p3->ds[n0+2];
      if (x == 0) {
        printf("%d %d %d", d0, d1, d2);
      } else {
        printf(" %d %d %d", d0, d1, d2);
      }
    }
    printf("\n");
  }
}

void
print_p3(struct _p3 *p3)
{
  unsigned int x;
  unsigned int y;
  unsigned int c;
  unsigned int w;
  unsigned int h;
  unsigned char d0;
  unsigned char d1;
  unsigned char d2;
  unsigned long n0;
  w = p3->w;
  h = p3->h;
  printf("P3\n");
  printf("%d %d\n", w, h);
  printf("255\n");
  for (y = 0; y < h; y++) {
    for (x = 0; x < w; x++) {
      n0 = (y * w * 3) + (x * 3);
      d0 = p3->ds[n0];
      d1 = p3->ds[n0+1];
      d2 = p3->ds[n0+2];
      if (x == 0) {
        printf("%d %d %d", d0, d1, d2);
      } else {
        printf(" %d %d %d", d0, d1, d2);
      }
    }
    printf("\n");
  }
}

struct _img *
read_p1(const char *s)
{
  struct _img *img;
  int d;
  int c;
  int n;
  int r;
  unsigned long v;

  r = sscanf(s, "P1%n", &n);
  if (n != 2) return NULL;
  s += n;

  img = malloc(sizeof(struct _img));

  r = sscanf(s, "%d%n", &d, &n);
  img->w = (unsigned int) d;
  s += n;

  r = sscanf(s, "%d%n", &d, &n);
  img->h = (unsigned int) d;
  s += n;

  img->ds = malloc((img->w * img->h * 1) * sizeof(unsigned char));
  memset(img->ds, 0, (img->w * img->h * 1) * sizeof(unsigned char));

  v = 0;
  c = 1;
  while (c) {
    r = sscanf(s, "%d%n", &d, &n);
    if (r != 1) {
      free(img->ds);
      free(img);
      return NULL;
    }
    img->ds[v] = (unsigned char) d; v++;
    s += n;
    if (s[1] == '\0') {
      c = 0;
    }
  }

  return img;
}

