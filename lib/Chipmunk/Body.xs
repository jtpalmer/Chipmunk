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
cpbody_free(body)
		cpBody *body
	CODE:
		cpBodyFree(body);

void
cpbody_set_pos(body, pos)
		cpBody *body
		cpVect pos
	CODE:
		cpBodySetPos(body, pos);

cpVect
cpbody_get_pos(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetPos(body);
	OUTPUT:
		RETVAL

void
cpbody_set_vel(body, vel)
		cpBody *body
		cpVect vel
	CODE:
		cpBodySetVel(body, vel);

cpVect
cpbody_get_vel(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetVel(body);
	OUTPUT:
		RETVAL

void
cpbody_set_angle(body, angle)
		cpBody *body
		cpFloat angle
	CODE:
		cpBodySetAngle(body, angle);

cpFloat
cpbody_get_angle(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetAngle(body);
	OUTPUT:
		RETVAL

