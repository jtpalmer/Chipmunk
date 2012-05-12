#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::CircleShape	PACKAGE = Chipmunk::CircleShape	PREFIX = cpcircle_
PROTOTYPES: ENABLE

cpShape*
cpcircle_new(CLASS, body, radius, offset)
		char *CLASS
		cpBody *body
		cpFloat radius
		cpVect offset
	CODE:
		RETVAL = cpCircleShapeNew(body, radius, offset);
	OUTPUT:
		RETVAL

