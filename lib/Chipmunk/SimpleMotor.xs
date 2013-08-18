#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::SimpleMotor    PACKAGE = Chipmunk::SimpleMotor    PREFIX = cpsimplemotor_
PROTOTYPES: ENABLE

cpConstraint *
cpsimplemotor_new(CLASS, a, b, rate)
        char *CLASS
        cpBody *a
        cpBody *b
        cpFloat rate
    CODE:
        RETVAL = cpSimpleMotorNew(a, b, rate);
    OUTPUT:
        RETVAL

cpFloat
cpsimplemotor_get_rate(constraint)
        cpConstraint *constraint
    CODE:
        RETVAL = cpSimpleMotorGetRate(constraint);
    OUTPUT:
        RETVAL

void
cpsimplemotor_set_rate(constraint, value)
        cpConstraint *constraint
        cpFloat value
    CODE:
        cpSimpleMotorSetRate(constraint, value);

