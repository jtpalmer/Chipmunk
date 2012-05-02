#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Shape	PACKAGE = Chipmunk::Shape	PREFIX = cpshape_
PROTOTYPES: ENABLE

void
cpshape_set_friction(shape, friction)
		cpShape *shape
		cpFloat friction
	CODE:
		cpShapeSetFriction(shape, friction);

cpFloat
cpshape_get_friction(shape)
		cpShape *shape
	CODE:
		RETVAL = cpShapeGetFriction(shape);
	OUTPUT:
		RETVAL

