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

cpBody *
cpbody_new_static(CLASS)
		char *CLASS
	CODE:
		RETVAL = cpBodyNewStatic();
	OUTPUT:
		RETVAL

void
cpbody_free(body)
		cpBody *body
	CODE:
		cpBodyFree(body);

void
cpbody_activate(body)
		cpBody *body
	CODE:
		cpBodyActivate(body);

void
cpbody_sleep(body)
		cpBody *body
	CODE:
		cpBodySleep(body);

cpBool
cpbody_is_sleeping(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyIsSleeping(body);
	OUTPUT:
		RETVAL

cpBool
cpbody_is_static(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyIsStatic(body);
	OUTPUT:
		RETVAL

cpBool
cpbody_is_rogue(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyIsRogue(body);
	OUTPUT:
		RETVAL

cpSpace *
cpbody_get_space(body)
		cpBody *body
	PREINIT:
		char *CLASS = "Chipmunk::Space";
	CODE:
		RETVAL = cpBodyGetSpace(body);
	OUTPUT:
		RETVAL

cpFloat
cpbody_get_mass(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetMass(body);
	OUTPUT:
		RETVAL

void
cpbody_set_mass(body, m)
		cpBody *body
		cpFloat m
	CODE:
		cpBodySetMass(body, m);

cpFloat
cpbody_get_moment(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetMoment(body);
	OUTPUT:
		RETVAL

void
cpbody_set_moment(body, i)
		cpBody *body
		cpFloat i
	CODE:
		cpBodySetMoment(body, i);

cpVect
cpbody_get_pos(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetPos(body);
	OUTPUT:
		RETVAL

void
cpbody_set_pos(body, pos)
		cpBody *body
		cpVect pos
	CODE:
		cpBodySetPos(body, pos);

cpVect
cpbody_get_vel(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetVel(body);
	OUTPUT:
		RETVAL

void
cpbody_set_vel(body, vel)
		cpBody *body
		cpVect vel
	CODE:
		cpBodySetVel(body, vel);

cpVect
cpbody_get_force(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetForce(body);
	OUTPUT:
		RETVAL

void
cpbody_set_force(body, force)
		cpBody *body
		cpVect force
	CODE:
		cpBodySetForce(body, force);

cpFloat
cpbody_get_angle(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetAngle(body);
	OUTPUT:
		RETVAL

void
cpbody_set_angle(body, angle)
		cpBody *body
		cpFloat angle
	CODE:
		cpBodySetAngle(body, angle);

cpFloat
cpbody_get_ang_vel(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetAngVel(body);
	OUTPUT:
		RETVAL

void
cpbody_set_ang_vel(body, vel)
		cpBody *body
		cpFloat vel
	CODE:
		cpBodySetAngVel(body, vel);

cpFloat
cpbody_get_torque(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetTorque(body);
	OUTPUT:
		RETVAL

void
cpbody_set_torque(body, torque)
		cpBody *body
		cpFloat torque
	CODE:
		cpBodySetTorque(body, torque);

cpVect
cpbody_get_rot(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetRot(body);
	OUTPUT:
		RETVAL

cpFloat
cpbody_get_vel_limit(body)
		cpBody *body
	CODE:
		RETVAL = cpBodyGetVelLimit(body);
	OUTPUT:
		RETVAL

void
cpbody_set_vel_limit(body, vel_limit)
		cpBody *body
		cpFloat vel_limit
	CODE:
		cpBodySetVelLimit(body, vel_limit);

