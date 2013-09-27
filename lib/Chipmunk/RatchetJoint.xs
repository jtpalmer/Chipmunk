#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::RatchetJoint    PACKAGE = Chipmunk::RatchetJoint    PREFIX = cpratchetjoint_
PROTOTYPES: ENABLE

cpConstraint *
cpratchetjoint_new(CLASS, a, b, phase, ratchet)
        char *CLASS
        cpBody *a
        cpBody *b
        cpFloat phase
        cpFloat ratchet
    CODE:
        RETVAL = cpRatchetJointNew(a, b, phase, ratchet);
    OUTPUT:
        RETVAL

cpFloat
cpratchetjoint_get_angle(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpRatchetJointGetAngle(constraint);
    OUTPUT:
        RETVAL

void
cpratchetjoint_set_angle(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpRatchetJointSetAngle(constraint, value);

cpFloat
cpratchetjoint_get_phase(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpRatchetJointGetPhase(constraint);
    OUTPUT:
        RETVAL

void
cpratchetjoint_set_phase(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpRatchetJointSetPhase(constraint, value);

cpFloat
cpratchetjoint_get_ratchet(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpRatchetJointGetRatchet(constraint);
    OUTPUT:
        RETVAL

void
cpratchetjoint_set_ratchet(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpRatchetJointSetRatchet(constraint, value);

