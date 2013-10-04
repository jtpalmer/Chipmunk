#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::CircleShape    PACKAGE = Chipmunk::CircleShape    PREFIX = cpcircle_
PROTOTYPES: ENABLE

cpShape *
cpcircle_new(CLASS, body, radius, offset)
        char *CLASS
        cpBody *body
        cpFloat radius
        cpVect offset
    CODE:
        RETVAL = cpCircleShapeNew(body, radius, offset);
        cpPli_body_refcnt_inc(body);
    OUTPUT:
        RETVAL

cpVect
cpcircle_get_offset(shape)
        cpShape *shape
    CODE:
        RETVAL = cpCircleShapeGetOffset(shape);
    OUTPUT:
        RETVAL

cpFloat
cpcircle_get_radius(shape);
        cpShape *shape
    CODE:
        RETVAL = cpCircleShapeGetRadius(shape);
    OUTPUT:
        RETVAL

