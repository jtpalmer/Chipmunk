#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::PinJoint    PACKAGE = Chipmunk::PinJoint    PREFIX = cppinjoint_
PROTOTYPES: ENABLE

cpConstraint *
cppinjoint_new(CLASS, a, b, anchr1, anchr2)
        char *CLASS
        cpBody *a
        cpBody *b
        cpVect anchr1
        cpVect anchr2
    CODE:
        RETVAL = cpPinJointNew(a, b, anchr1, anchr2);
    OUTPUT:
        RETVAL

cpVect
cppinjoint_get_anchr1(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpPinJointGetAnchr1(constraint);
    OUTPUT:
        RETVAL

void
cppinjoint_set_anchr1(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpPinJointSetAnchr1(constraint, value);

cpVect
cppinjoint_get_anchr2(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpPinJointGetAnchr2(constraint);
    OUTPUT:
        RETVAL

void
cppinjoint_set_anchr2(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpPinJointSetAnchr2(constraint, value);

cpFloat
cppinjoint_get_dist(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpPinJointGetDist(constraint);
    OUTPUT:
        RETVAL

void
cppinjoint_set_dist(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpPinJointSetDist(constraint, value);

