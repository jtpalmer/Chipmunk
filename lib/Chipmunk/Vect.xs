#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Vect   PACKAGE = Chipmunk::Vect   PREFIX = cpvect_
PROTOTYPES: ENABLE

cpVect
cpvect_cpvslerp(v1, v2, t)
      cpVect v1
      cpVect v2
      cpFloat t
   CODE:
      RETVAL = cpvslerp(v1, v2, t);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvslerpconst(v1, v2, a)
      cpVect v1
      cpVect v2
      cpFloat a
   CODE:
      RETVAL = cpvslerpconst(v1, v2, a);
   OUTPUT:
      RETVAL

char *
cpvect_cpvstr(v)
      cpVect v
   CODE:
      RETVAL = cpvstr(v);
   OUTPUT:
      RETVAL

cpBool
cpvect_cpveql(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpveql(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvadd(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvadd(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvsub(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvsub(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvneg(v)
      cpVect v
   CODE:
      RETVAL = cpvneg(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvmult(v, s)
      cpVect v
      cpFloat s
   CODE:
      RETVAL = cpvmult(v, s);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvdot(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvdot(v1, v2);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvcross(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvcross(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvperp(v)
      cpVect v
   CODE:
      RETVAL = cpvperp(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvrperp(v)
      cpVect v
   CODE:
      RETVAL = cpvrperp(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvproject(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvproject(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvforangle(a)
      cpFloat a
   CODE:
      RETVAL = cpvforangle(a);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvtoangle(v)
      cpVect v
   CODE:
      RETVAL = cpvtoangle(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvrotate(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvrotate(v1, v2);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvunrotate(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvunrotate(v1, v2);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvlengthsq(v)
      cpVect v
   CODE:
      RETVAL = cpvlengthsq(v);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvlength(v)
      cpVect v
   CODE:
      RETVAL = cpvlength(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvlerp(v1, v2, t)
      cpVect v1
      cpVect v2
      cpFloat t
   CODE:
      RETVAL = cpvlerp(v1, v2, t);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvnormalize(v)
      cpVect v
   CODE:
      RETVAL = cpvnormalize(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvnormalize_safe(v)
      cpVect v
   CODE:
      RETVAL = cpvnormalize_safe(v);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvclamp(v, len)
      cpVect v
      cpFloat len
   CODE:
      RETVAL = cpvclamp(v, len);
   OUTPUT:
      RETVAL

cpVect
cpvect_cpvlerpconst(v1, v2, d)
      cpVect v1
      cpVect v2
      cpFloat d
   CODE:
      RETVAL = cpvlerpconst(v1, v2, d);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvdist(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvdist(v1, v2);
   OUTPUT:
      RETVAL

cpFloat
cpvect_cpvdistsq(v1, v2)
      cpVect v1
      cpVect v2
   CODE:
      RETVAL = cpvdistsq(v1, v2);
   OUTPUT:
      RETVAL

cpBool
cpvect_cpvnear(v1, v2, dist)
      cpVect v1
      cpVect v2
      cpFloat dist
   CODE:
      RETVAL = cpvnear(v1, v2, dist);
   OUTPUT:
      RETVAL

