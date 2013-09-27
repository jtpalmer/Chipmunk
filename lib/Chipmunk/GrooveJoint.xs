#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::GrooveJoint    PACKAGE = Chipmunk::GrooveJoint    PREFIX = cpgroovejoint_
PROTOTYPES: ENABLE

cpConstraint *
cpgroovejoint_new(CLASS, a, b, groove_a, groove_b, anchr2)
        char *CLASS
        cpBody *a
        cpBody *b
        cpVect groove_a
        cpVect groove_b
        cpVect anchr2
    CODE:
        RETVAL = cpGrooveJointNew(a, b, groove_a, groove_b, anchr2);
    OUTPUT:
        RETVAL

cpVect
cpgroovejoint_get_groove_a(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpGrooveJointGetGrooveA(constraint);
    OUTPUT:
        RETVAL

void
cpgroovejoint_set_groove_a(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpGrooveJointSetGrooveA(constraint, value);

cpVect
cpgroovejoint_get_groove_b(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpGrooveJointGetGrooveB(constraint);
    OUTPUT:
        RETVAL

void
cpgroovejoint_set_groove_b(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpGrooveJointSetGrooveB(constraint, value);

cpVect
cpgroovejoint_get_anchr2(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpGrooveJointGetAnchr2(constraint);
    OUTPUT:
        RETVAL

void
cpgroovejoint_set_anchr2(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpGrooveJointSetAnchr2(constraint, value);

