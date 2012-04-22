#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chipmunk.h>

MODULE = Chipmunk::Space	PACKAGE = Chipmunk::Space	PREFIX = cps_
PROTOTYPES: ENABLE

cpSpace *
cps_new(CLASS)
		char *CLASS
	CODE:
		RETVAL = cpSpaceNew();
	OUTPUT:
		RETVAL

void
cps_set_gravity(space, gravity)
		cpSpace *space
		cpVect gravity
	CODE:
		cpSpaceSetGravity(space, gravity);

cpVect
cps_get_gravity(space)
		cpSpace *space
	CODE:
		RETVAL = cpSpaceGetGravity(space);
	OUTPUT:
		RETVAL

