#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::PinJoint	PACKAGE = Chipmunk::PinJoint	PREFIX = cppinjoint_
PROTOTYPES: ENABLE

cpConstraint *
cppinjoint_new(a, b, anchr1, anchr2)
		cpBody *a
		cpBody *b
		cpVect anchr1
		cpVect anchr2
	CODE:
		RETVAL = cpPinJointNew(a, b, anchr1, anchr2);
	OUTPUT:
		RETVAL

# TODO

#cpVect cpPinJointGetAnchr1(const cpConstraint *constraint)

#void cpPinJointSetAnchr1(cpConstraint *constraint, cpVect value)

#cpVect cpPinJointGetAnchr2(const cpConstraint *constraint)

#void cpPinJointSetAnchr2(cpConstraint *constraint, cpVect value)

#cpFloat cpPinJointGetDist(const cpConstraint *constraint)

#void cpPinJointSetDist(cpConstraint *constraint, cpFloat value)

