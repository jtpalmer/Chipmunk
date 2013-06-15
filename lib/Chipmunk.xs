#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"
#include <chipmunk.h>

MODULE = Chipmunk	PACKAGE = Chipmunk	PREFIX = cp_

cpFloat
cp_moment_for_circle(m, r1, r2, offset)
		cpFloat m
		cpFloat r1
		cpFloat r2
		cpVect offset
	CODE:
		RETVAL = cpMomentForCircle(m, r1, r2, offset);
	OUTPUT:
		RETVAL

cpFloat
cp_area_for_circle(r1, r2)
		cpFloat r1
		cpFloat r2
	CODE:
		RETVAL = cpAreaForCircle(r1, r2);
	OUTPUT:
		RETVAL

cpFloat
cp_moment_for_segment(m, a, b)
		cpFloat m
		cpVect a
		cpVect b
	CODE:
		RETVAL = cpMomentForSegment(m, a, b);
	OUTPUT:
		RETVAL

cpFloat
cp_area_for_segment(a, b, r)
		cpVect a
		cpVect b
		cpFloat r
	CODE:
		RETVAL = cpAreaForSegment(a, b, r);
	OUTPUT:
		RETVAL

cpFloat
cp_moment_for_poly(m, verts, ...)
		cpFloat m
		SV *verts
	INIT:
		cpVect *offset;
		cpVect *_verts;
		int num_verts;
	CODE:
		if (items == 2) {
			offset = sv_to_vect(ST(2));
		} else if (items == 1) {
			Newx(offset, 1, cpVect);
			*offset = cpv((cpFloat)0.0, (cpFloat)0.0);
		} else {
			croak("Wrong number of arguments");
		}

		_verts = sv_to_vect_array(verts);
		num_verts = av_len((AV *)SvRV(verts)) + 1;

		RETVAL = cpMomentForPoly(m, num_verts, _verts, *offset);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);
		Safefree(offset);

