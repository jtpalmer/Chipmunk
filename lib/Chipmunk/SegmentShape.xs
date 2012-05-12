#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::SegmentShape	PACKAGE = Chipmunk::SegmentShape	PREFIX = cpsegment_
PROTOTYPES: ENABLE

cpShape*
cpsegment_new(CLASS, body, a, b, radius)
		char *CLASS
		cpBody *body
		cpVect a
		cpVect b
		cpFloat radius
	CODE:
		RETVAL = cpSegmentShapeNew(body, a, b, radius);
	OUTPUT:
		RETVAL

