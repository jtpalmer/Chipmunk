#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::Constraint    PACKAGE = Chipmunk::Constraint    PREFIX = cpconstraint_
PROTOTYPES: ENABLE

void
cpconstraint_DESTROY(constraint)
        cpConstraint *constraint
    CODE:
        cpPli_body_refcnt_dec(cpConstraintGetA(constraint));
        cpPli_body_refcnt_dec(cpConstraintGetB(constraint));
        cpPli_constraint_free(constraint);

void
cpconstraint_activate_bodies(constraint)
        cpConstraint *constraint
    CODE:
        cpConstraintActivateBodies(constraint);

cpSpace *
cpconstraint_get_space(constraint)
        cpConstraint *constraint
    PREINIT:
        char *CLASS = "Chipmunk::Space";
    CODE:
        RETVAL = cpConstraintGetSpace(constraint);
    OUTPUT:
        RETVAL

cpBody *
cpconstraint_get_a(constraint)
        cpConstraint *constraint
    PREINIT:
        char *CLASS = "Chipmunk::Body";
    CODE:
        RETVAL = cpConstraintGetA(constraint);
    OUTPUT:
        RETVAL

cpBody *
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
cpconstraint_set_max_force(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpConstraintSetMaxForce(constraint, value);

cpFloat
cpconstraint_get_error_bias(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpConstraintGetErrorBias(constraint);
    OUTPUT:
        RETVAL

void
cpconstraint_set_error_bias(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpConstraintSetErrorBias(constraint, value);

cpFloat
cpconstraint_get_max_bias(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpConstraintGetMaxBias(constraint);
    OUTPUT:
        RETVAL

void
cpconstraint_set_max_bias(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpConstraintSetMaxBias(constraint, value);

# TODO: Callbacks.

#cpConstraintPreSolveFunc cpConstraintGetPreSolveFunc(const cpConstraint *constraint)

#void cpConstraintSetPreSolveFunc(cpConstraint *constraint, cpConstraintPreSolveFunc value)

#cpConstraintPostSolveFunc cpConstraintGetPostSolveFunc(const cpConstraint *constraint)

#void cpConstraintSetPostSolveFunc(cpConstraint *constraint, cpConstraintPostSolveFunc value)

# TODO
#SV *
#cpconstraint_get_user_data(constraint)
#        cpConstraint *constraint
#    CODE:
#        RETVAL = (SV *)cpConstraintGetUserData(constraint);
#    OUTPUT:
#        RETVAL
#
#void
#cpconstraint_set_user_data(constraint, data)
#        cpConstraint *constraint
#        SV *data
#    CODE:
#        cpConstraintSetUserData(constraint, (cpDataPointer)data);

cpFloat
cpconstraint_get_impulse(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpConstraintGetImpulse(constraint);
    OUTPUT:
        RETVAL

