#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::DampedSpring    PACKAGE = Chipmunk::DampedSpring    PREFIX = cpdampedspring_
PROTOTYPES: ENABLE

cpConstraint *
cpdampedspring_new(CLASS, a, b, anchr1, anchr2, restLength, stiffness, damping)
        char *CLASS
        cpBody *a
        cpBody *b
        cpVect anchr1
        cpVect anchr2
        cpFloat restLength
        cpFloat stiffness
        cpFloat damping
    CODE:
        RETVAL = cpDampedSpringNew(a, b, anchr1, anchr2, restLength, stiffness, damping);
        cpPli_body_refcnt_inc(a);
        cpPli_body_refcnt_inc(b);
    OUTPUT:
        RETVAL

