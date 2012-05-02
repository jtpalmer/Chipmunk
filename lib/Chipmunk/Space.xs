#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Space	PACKAGE = Chipmunk::Space	PREFIX = cpspace_
PROTOTYPES: ENABLE

cpSpace *
cpspace_new(CLASS)
		char *CLASS
	CODE:
		RETVAL = cpSpaceNew();
	OUTPUT:
		RETVAL

void
cpspace_set_gravity(space, gravity)
		cpSpace *space
		cpVect gravity
	CODE:
		cpSpaceSetGravity(space, gravity);

cpVect
cpspace_get_gravity(space)
		cpSpace *space
	CODE:
		RETVAL = cpSpaceGetGravity(space);
	OUTPUT:
		RETVAL

void
cpspace_DESTROY(space)
		cpSpace *space
	CODE:
		cpSpaceFree(space);

