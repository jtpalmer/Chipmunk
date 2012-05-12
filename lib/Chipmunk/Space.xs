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
cpspace_DESTROY(space)
		cpSpace *space
	CODE:
		cpSpaceFree(space);

cpBool
cpspace_is_locked(space)
		cpSpace *space
	CODE:
		RETVAL = cpSpaceIsLocked(space);
	OUTPUT:
		RETVAL

cpShape *
cpspace_add_shape(space, shape)
		cpSpace *space
		cpShape *shape
	PREINIT:
		char *CLASS = "Chipmunk::Shape";
	CODE:
		RETVAL = cpSpaceAddShape(space, shape);
	OUTPUT:
		RETVAL

cpShape *
cpspace_add_static_shape(space, shape)
		cpSpace *space
		cpShape *shape
	PREINIT:
		char *CLASS = "Chipmunk::Shape";
	CODE:
		RETVAL = cpSpaceAddStaticShape(space, shape);
	OUTPUT:
		RETVAL

cpBody *
cpspace_add_body(space, body)
		cpSpace *space
		cpBody *body
	PREINIT:
		char *CLASS = "Chipmunk::Body";
	CODE:
		RETVAL = cpSpaceAddBody(space, body);
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

cpBody *
cpspace_static_body(space)
		cpSpace *space
	PREINIT:
		char *CLASS = "Chipmunk::Body";
	CODE:
		RETVAL = space->staticBody;
	OUTPUT:
		RETVAL

void
cpspace_step(space, dt)
		cpSpace *space
		cpFloat dt
	CODE:
		cpSpaceStep(space, dt);

