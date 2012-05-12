#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"
#include <chipmunk.h>

MODULE = Chipmunk::PolyShape	PACKAGE = Chipmunk::PolyShape	PREFIX = cppoly_
PROTOTYPES: ENABLE

cpShape*
cppoly_new(CLASS, body, verts, ...)
		char *CLASS
		cpBody *body
		SV *verts
	CODE:
		cpVect *offset;
		if (items > 3) {
			offset = sv_to_vect(ST(3));
		} else {
			Newx(offset, 1, cpVect);
			*offset = cpv((cpFloat)0.0, (cpFloat)0.0);
		}
		cpVect *_verts = sv_to_vect_array(verts);
		int num_verts = av_len((AV *)SvRV(verts)) + 1;
		if (!cpPolyValidate(_verts, num_verts)) {
			croak("Vertices not clockwise and convex");
		}
		RETVAL = cpPolyShapeNew(body, num_verts, _verts, *offset);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);
		Safefree(offset);

int
cppoly_get_num_verts(shape)
		cpShape *shape
	CODE:
		RETVAL = cpPolyShapeGetNumVerts(shape);
	OUTPUT:
		RETVAL

