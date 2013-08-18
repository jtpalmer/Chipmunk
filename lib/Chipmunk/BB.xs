#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::BB   PACKAGE = Chipmunk::BB   PREFIX = cpbb_
PROTOTYPES: ENABLE

cpBB
cpbb_new(CLASS, l, b, r, t)
      char *CLASS
      cpFloat l
      cpFloat b
      cpFloat r
      cpFloat t
   CODE:
      RETVAL = cpBBNew(l, b, r, t);
   OUTPUT:
      RETVAL

cpBB
cpbb_new_for_circle(CLASS, p, r)
      char *CLASS
      cpVect p
      cpFloat r
   CODE:
      RETVAL = cpBBNewForCircle(p, r);
   OUTPUT:
      RETVAL


cpBool
cpbb_intersects(a, b)
      cpBB a
      cpBB b
   CODE:
      RETVAL = cpBBIntersects(a, b);
   OUTPUT:
      RETVAL

cpBool
cpbb_contains_bb(bb, other)
      cpBB bb
      cpBB other
   CODE:
      RETVAL = cpBBContainsBB(bb, other);
   OUTPUT:
      RETVAL

cpBool
cpbb_contains_vect(bb, v)
      cpBB bb
      cpVect v
   CODE:
      RETVAL = cpBBContainsVect(bb, v);
   OUTPUT:
      RETVAL

cpBB
cpbb_merge(a, b)
      cpBB a
      cpBB b
   PREINIT:
      char *CLASS = "Chipmunk::BB";
   CODE:
      RETVAL = cpBBMerge(a, b);
   OUTPUT:
      RETVAL

cpBB
cpbb_expand(bb, v)
      cpBB bb
      cpVect v
   PREINIT:
      char *CLASS = "Chipmunk::BB";
   CODE:
      RETVAL = cpBBExpand(bb, v);
   OUTPUT:
      RETVAL

cpFloat
cpbb_area(bb)
      cpBB bb
   CODE:
      RETVAL = cpBBArea(bb);
   OUTPUT:
      RETVAL

cpFloat
cpbb_merged_area(a, b)
      cpBB a
      cpBB b
   CODE:
      RETVAL = cpBBMergedArea(a, b);
   OUTPUT:
      RETVAL

cpFloat
cpbb_segment_query(bb, a, b)
      cpBB bb
      cpVect a
      cpVect b
   CODE:
      RETVAL = cpBBSegmentQuery(bb, a, b);
   OUTPUT:
      RETVAL

cpBool
cpbb_intersects_segment(bb, a, b)
      cpBB bb
      cpVect a
      cpVect b
   CODE:
      RETVAL = cpBBIntersectsSegment(bb, a, b);
   OUTPUT:
      RETVAL

cpVect
cpbb_clamp_vect(bb, v)
      cpBB bb
      cpVect v
   CODE:
      RETVAL = cpBBClampVect(bb, v);
   OUTPUT:
      RETVAL

cpVect
cpbb_wrap_vect(bb, v)
      cpBB bb
      cpVect v
   CODE:
      RETVAL = cpBBWrapVect(bb, v);
   OUTPUT:
      RETVAL

