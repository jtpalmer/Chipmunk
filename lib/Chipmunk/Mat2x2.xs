#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::Mat2x2 PACKAGE = Chipmunk::Mat2x2          PREFIX = cpmat2x2_
PROTOTYPES: ENABLE

cpMat2x2
cpmat2x2_new(CLASS, a, b, c, d)
        char *CLASS
        cpFloat a
        cpFloat b
        cpFloat c
        cpFloat d
    CODE:
        RETVAL = cpMat2x2New(a, b, c, d);
    OUTPUT:
        RETVAL

cpVect
cpmat2x2_transform(m, v)
        cpMat2x2 m
        cpVect v
    CODE:
        RETVAL = cpMat2x2Transform(m, v);
    OUTPUT:
        RETVAL

