#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::RotaryLimitJoint    PACKAGE = Chipmunk::RotaryLimitJoint    PREFIX = cprotarylimitjoint_
PROTOTYPES: ENABLE

cpConstraint *
cprotarylimithoint_new(CLASS, a, b, min, max)
        char *CLASS
        cpBody *a
        cpBody *b
        cpFloat min
        cpFloat max
    CODE:
        RETVAL = cpRotaryLimitJointNew(a, b, min, max);
    OUTPUT:
        RETVAL

cpFloat
cprotarylimitjoint_get_min(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpRotaryLimitJointGetMin(constraint);
    OUTPUT:
        RETVAL

void
cprotarylimitjoint_set_min(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpRotaryLimitJointSetMin(constraint, value);

cpFloat
cprotarylimitjoint_get_max(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpRotaryLimitJointGetMax(constraint);
    OUTPUT:
        RETVAL

void
cprotarylimitjoint_set_max(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpRotaryLimitJointSetMax(constraint, value);

