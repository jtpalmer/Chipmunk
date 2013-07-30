#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::GearJoint	PACKAGE = Chipmunk::GearJoint	PREFIX = cpgearjoint_
PROTOTYPES: ENABLE

cpConstraint*
cpgearjoint_new(CLASS, a, b, phase, ratio)
		char *CLASS
		cpBody *a
		cpBody *b
		cpFloat phase
		cpFloat ratio
	CODE:
		RETVAL = cpGearJointNew(a, b, phase, ratio);
	OUTPUT:
		RETVAL

