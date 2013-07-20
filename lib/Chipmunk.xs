#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"
#include <chipmunk.h>

MODULE = Chipmunk	PACKAGE = Chipmunk	PREFIX = cp_

# TODO

#cpFloat cpfmax(cpFloat a, cpFloat b)

#cpFloat cpfmin(cpFloat a, cpFloat b)

#cpFloat cpfabs(cpFloat f)

#cpFloat cpfclamp(cpFloat f, cpFloat min, cpFloat max)

#cpFloat cpfclamp01(cpFloat f)

#cpFloat cpflerp(cpFloat f1, cpFloat f2, cpFloat t)

#cpFloat cpflerpconst(cpFloat f1, cpFloat f2, cpFloat d)

void
cp_enable_segment_to_segment_collisions()
	CODE:
		cpEnableSegmentToSegmentCollisions();

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
		if (items == 3) {
			offset = sv_to_vect(ST(2));
		} else if (items == 2) {
			Newx(offset, 1, cpVect);
			*offset = cpv((cpFloat)0.0, (cpFloat)0.0);
		} else {
			croak("Wrong number of arguments");
		}

		_verts = sv_to_vect_array(verts);
		num_verts = av_len((AV *)SvRV(verts)) + 1;

		if (!cpPolyValidate(_verts, num_verts)) {
			croak("Vertices not clockwise and convex");
		}

		RETVAL = cpMomentForPoly(m, num_verts, _verts, *offset);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);
		Safefree(offset);

cpFloat
cp_area_for_poly(verts)
		SV *verts
	INIT:
		cpVect *_verts;
		int num_verts;
	CODE:
		_verts = sv_to_vect_array(verts);
		num_verts = av_len((AV *)SvRV(verts)) + 1;

		if (!cpPolyValidate(_verts, num_verts)) {
			croak("Vertices not clockwise and convex");
		}

		RETVAL = cpAreaForPoly(num_verts, _verts);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);

cpVect
cp_centroid_for_poly(verts)
		SV *verts
	INIT:
		cpVect *_verts;
		int num_verts;
	CODE:
		_verts = sv_to_vect_array(verts);
		num_verts = av_len((AV *)SvRV(verts)) + 1;

		RETVAL = cpCentroidForPoly(num_verts, _verts);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);

SV *
cp_recenter_poly(verts)
		SV *verts
	INIT:
		cpVect *_verts;
		int size;
	CODE:
		_verts = sv_to_vect_array(verts);
		size = av_len((AV *)SvRV(verts)) + 1;

		cpRecenterPoly(size, _verts);

		RETVAL = vect_array_to_sv(size, _verts);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);

cpFloat
cp_moment_for_box(m, width, height)
		cpFloat m
		cpFloat width
		cpFloat height
	CODE:
		RETVAL = cpMomentForBox(m, width, height);
	OUTPUT:
		RETVAL

cpFloat
cp_moment_for_box2(m, box)
		cpFloat m
		cpBB box
	CODE:
		RETVAL = cpMomentForBox2(m, box);
	OUTPUT:
		RETVAL

SV *
cp_convex_hull(verts, ...)
		SV *verts
	INIT:
		int size;
		cpFloat tol;
		cpVect *_verts;
	CODE:
		if (items == 2) {
			tol = SvNV(ST(2));
		} else if (items == 1) {
			tol = 0.0;
		} else {
			croak("Wrong number of arguments");
		}

		_verts = sv_to_vect_array(verts);
		size = av_len((AV *)SvRV(verts)) + 1;

		size = cpConvexHull(size, _verts, NULL, NULL, tol);

		RETVAL = vect_array_to_sv(size, _verts);
	OUTPUT:
		RETVAL
	CLEANUP:
		Safefree(_verts);

