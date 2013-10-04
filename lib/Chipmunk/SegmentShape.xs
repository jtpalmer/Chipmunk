#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::SegmentShape    PACKAGE = Chipmunk::SegmentShape    PREFIX = cpsegment_
PROTOTYPES: ENABLE

cpShape *
cpsegment_new(CLASS, body, a, b, radius)
        char *CLASS
        cpBody *body
        cpVect a
        cpVect b
        cpFloat radius
    CODE:
        RETVAL = cpSegmentShapeNew(body, a, b, radius);
        cpPli_body_refcnt_inc(body);
    OUTPUT:
        RETVAL

# TODO: Check if this is part of the public interface.
void
cpsegment_set_neighbors(shape, prev, next)
        cpShape *shape
        cpVect prev
        cpVect next
    CODE:
        cpSegmentShapeSetNeighbors(shape, prev, next);

cpVect
cpsegment_get_a(shape)
        cpShape *shape
    CODE:
        RETVAL = cpSegmentShapeGetA(shape);
    OUTPUT:
        RETVAL

cpVect
cpsegment_get_b(shape)
        cpShape *shape
    CODE:
        RETVAL = cpSegmentShapeGetB(shape);
    OUTPUT:
        RETVAL

cpVect
cpsegment_get_normal(shape)
        cpShape *shape
    CODE:
        RETVAL = cpSegmentShapeGetNormal(shape);
    OUTPUT:
        RETVAL

cpFloat
cpsegment_get_radius(shape)
        cpShape *shape
    CODE:
        RETVAL = cpSegmentShapeGetRadius(shape);
    OUTPUT:
        RETVAL

