#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Constraint	PACKAGE = Chipmunk::Constraint	PREFIX = cpconstraint_
PROTOTYPES: ENABLE

void
cpconstraint_activate_bodies(constraint)
		cpConstraint *constraint
	CODE:
		cpConstraintActivateBodies(constraint);

cpSpace*
cpconstraint_get_space(constraint)
		cpConstraint *constraint
	PREINIT:
		char *CLASS = "Chipmunk::Space";
	CODE:
		RETVAL = cpConstraintGetSpace(constraint);
	OUTPUT:
		RETVAL

cpBody*
cpconstraint_get_a(constraint)
		cpConstraint *constraint
	PREINIT:
		char *CLASS = "Chipmunk::Body";
	CODE:
		RETVAL = cpConstraintGetA(constraint);
	OUTPUT:
		RETVAL

cpBody*
cpconstraint_get_b(constraint)
		cpConstraint *constraint
	PREINIT:
		char *CLASS = "Chipmunk::Body";
	CODE:
		RETVAL = cpConstraintGetB(constraint);
	OUTPUT:
		RETVAL

cpFloat
cpconstraint_get_max_force(constraint)
		cpConstraint *constraint
	CODE:
		RETVAL = cpConstraintGetMaxForce(constraint);
	OUTPUT:
		RETVAL

void
ccConstraint_set_max_force(constraint, value)
		cpConstraint *constraint
		cpFloat value
	CODE:
		cpConstraintSetMaxForce(constraint, value);

#void cpConstraintSetMaxForce(cpConstraint *constraint, cpFloat value)

#cpFloat cpConstraintGetErrorBias(const cpConstraint *constraint)

#void cpConstraintSetErrorBias(cpConstraint *constraint, cpFloat value)

#cpFloat cpConstraintGetMaxBias(const cpConstraint *constraint)

#void cpConstraintSetMaxBias(cpConstraint *constraint, cpFloat value)
# TODO

#cpConstraintPreSolveFunc cpConstraintGetPreSolveFunc(const cpConstraint *constraint)

#void cpConstraintSetPreSolveFunc(cpConstraint *constraint, cpConstraintPreSolveFunc value)

#cpConstraintPostSolveFunc cpConstraintGetPostSolveFunc(const cpConstraint *constraint)

#void cpConstraintSetPostSolveFunc(cpConstraint *constraint, cpConstraintPostSolveFunc value)

#cpDataPointer cpConstraintGetUserData(const cpConstraint *constraint)

#void cpConstraintSetUserData(cpConstraint *constraint, cpDataPointer value)

#cpFloat cpConstraintGetImpulse(cpConstraint *constraint)

