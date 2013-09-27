#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::PivotJoint    PACKAGE = Chipmunk::PivotJoint    PREFIX = cppivotjoint_
PROTOTYPES: ENABLE

cpConstraint *
cppivotjoint_new(CLASS, a, b, ...)
        char *CLASS
        cpBody *a
        cpBody *b
    INIT:
        cpVect pivot;
        cpVect anchr1;
        cpVect anchr2;
    CODE:
        if (items == 4) {
            pivot = sv_to_vect(ST(3));
            RETVAL = cpPivotJointNew(a, b, pivot);
        } else if (items == 5) {
            anchr1 = sv_to_vect(ST(3));
            anchr2 = sv_to_vect(ST(4));
            RETVAL = cpPivotJointNew2(a, b, anchr1, anchr2);
        } else {
            croak("Wrong number of arguments");
        }
    OUTPUT:
        RETVAL

cpVect
cppivotjoint_get_anchr1(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpPivotJointGetAnchr1(constraint);
    OUTPUT:
        RETVAL

void
cppivotjoint_set_anchr1(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpPivotJointSetAnchr1(constraint, value);

cpVect
cppivotjoint_get_anchr2(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpPivotJointGetAnchr2(constraint);
    OUTPUT:
        RETVAL

void
cppivotjoint_set_anchr2(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpPivotJointSetAnchr2(constraint, value);

