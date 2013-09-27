#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::GearJoint    PACKAGE = Chipmunk::GearJoint    PREFIX = cpgearjoint_
PROTOTYPES: ENABLE

cpConstraint *
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

cpFloat
cpgearjoint_get_phase(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpGearJointGetPhase(constraint);
    OUTPUT:
        RETVAL

void
cpgearjoint_set_phase(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpGearJointSetPhase(constraint, value);

cpFloat
cpgearjoint_get_ratio(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpGearJointGetRatio(constraint);
    OUTPUT:
        RETVAL

void
cpgearjoint_set_ratio(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpGearJointSetRatio(constraint, value);

