#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Mat2x2 PACKAGE = Chipmunk::Mat2x2        PREFIX = cpmat2x2_
PROTOTYPES: ENABLE

cpVect
cpmat2x2_transform(m, v)
      cpMat2x2 m
      cpVect v
   CODE:
      RETVAL = cpMat2x2Transform(m, v);
   OUTPUT:
      RETVAL

