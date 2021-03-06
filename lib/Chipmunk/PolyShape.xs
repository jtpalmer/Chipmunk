#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::PolyShape    PACKAGE = Chipmunk::PolyShape    PREFIX = cppoly_
PROTOTYPES: ENABLE

cpShape *
cppoly_new(CLASS, body, verts, ...)
        char *CLASS
        cpBody *body
        SV *verts
    INIT:
        cpVect offset;
        cpVect *_verts;
        int num_verts;
    CODE:
        if (items == 4) {
            offset = cpPli_sv_to_vect(ST(3));
        }
        else if (items == 3) {
            offset = cpv((cpFloat)0.0, (cpFloat)0.0);
        }
        else {
            croak("Wrong number of arguments");
        }

        _verts = cpPli_sv_to_vect_array(verts);
        num_verts = av_len((AV *)SvRV(verts)) + 1;

        if (!cpPolyValidate(_verts, num_verts)) {
            croak("Vertices not clockwise and convex");
        }

        RETVAL = cpPolyShapeNew(body, num_verts, _verts, offset);
        cpPli_body_refcnt_inc(body);
    OUTPUT:
        RETVAL
    CLEANUP:
        Safefree(_verts);

int
cppoly_get_num_verts(shape)
        cpShape *shape
    CODE:
        RETVAL = cpPolyShapeGetNumVerts(shape);
    OUTPUT:
        RETVAL

cpVect
cppoly_get_vert(shape, idx)
        cpShape *shape
        int idx
    CODE:
        if (idx >= cpPolyShapeGetNumVerts(shape)) {
            croak("Vert index too large");
        }

        RETVAL = cpPolyShapeGetVert(shape, idx);
    OUTPUT:
        RETVAL

