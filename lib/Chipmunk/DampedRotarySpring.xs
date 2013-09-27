#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::DampedRotarySpring    PACKAGE = Chipmunk::DampedRotarySpring    PREFIX = cpdampedrotaryspring_
PROTOTYPES: ENABLE

cpConstraint *
cpdampedrotaryspring_new(CLASS, a, b, restAngle, stiffness, damping)
        char *CLASS
        cpBody *a
        cpBody *b
        cpFloat restAngle
        cpFloat stiffness
        cpFloat damping
    CODE:
        RETVAL = cpDampedRotarySpringNew(a, b, restAngle, stiffness, damping);
    OUTPUT:
        RETVAL

