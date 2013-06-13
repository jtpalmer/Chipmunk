#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
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

