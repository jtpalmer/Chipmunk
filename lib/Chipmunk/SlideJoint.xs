#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::SlideJoint    PACKAGE = Chipmunk::SlideJoint    PREFIX = cpslidejoint_
PROTOTYPES: ENABLE

cpConstraint *
cpslidejoint_new(CLASS, a, b, anchr1, anchr2, min, max)
        char * CLASS
        cpBody *a
        cpBody *b
        cpVect anchr1
        cpVect anchr2
        cpFloat min
        cpFloat max
    CODE:
        RETVAL = cpSlideJointNew(a, b, anchr1, anchr2, min, max);
        cpPli_body_refcnt_inc(a);
        cpPli_body_refcnt_inc(b);
    OUTPUT:
        RETVAL

cpVect
cpslidejoint_get_anchr1(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpSlideJointGetAnchr1(constraint);
    OUTPUT:
        RETVAL

void
cpslidejoint_set_anchr1(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpSlideJointSetAnchr1(constraint, value);

cpVect
cpslidejoint_get_anchr2(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpSlideJointGetAnchr2(constraint);
    OUTPUT:
        RETVAL

void
cpslidejoint_set_anchr2(constraint, value)
        cpConstraint *constraint
        cpVect value
    CODE:
        cpSlideJointSetAnchr2(constraint, value);

cpFloat
cpslidejoint_get_min(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpSlideJointGetMin(constraint);
    OUTPUT:
        RETVAL

void
cpslidejoint_set_min(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpSlideJointSetMin(constraint, value);

cpFloat
cpslidejoint_get_max(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpSlideJointGetMax(constraint);
    OUTPUT:
        RETVAL

void
cpslidejoint_set_max(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpSlideJointSetMax(constraint, value);

