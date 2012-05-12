#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Body	PACKAGE = Chipmunk::Body	PREFIX = cpbody_
PROTOTYPES: ENABLE

cpBody *
cpbody_new(CLASS, mass, inertia)
		char *CLASS
		cpFloat mass
		cpFloat inertia
	CODE:
		RETVAL = cpBodyNew(mass, inertia);
	OUTPUT:
		RETVAL

void
cpbody_destroy(body)
		cpBody *body
	CODE:
		cpBodyFree(body);

