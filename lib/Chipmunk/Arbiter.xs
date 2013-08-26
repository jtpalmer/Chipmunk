#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Arbiter    PACKAGE = Chipmunk::Arbiter    PREFIX = cparbiter_
PROTOTYPES: ENABLE

cpFloat
cparbiter_get_elasticity(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterGetElasticity(arb);
    OUTPUT:
        RETVAL

void
cparbiter_set_elasticity(arb, value)
        cpArbiter *arb
        cpFloat value
    CODE:
        cpArbiterSetElasticity(arb, value);

cpFloat
cparbiter_get_friction(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterGetFriction(arb);
    OUTPUT:
        RETVAL

void
cparbiter_set_friction(arb, value)
        cpArbiter *arb
        cpFloat value
    CODE:
        cpArbiterSetFriction(arb, value);

cpVect
cparbiter_get_surface_velocity(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterGetSurfaceVelocity(arb);
    OUTPUT:
        RETVAL

void
cparbiter_set_surface_velocity(arb, vr)
        cpArbiter *arb
        cpVect vr
    CODE:
        cpArbiterSetSurfaceVelocity(arb, vr);

# TODO

#cpDataPointer cpArbiterGetUserData(const cpArbiter *arb)

#void cpArbiterSetUserData(cpArbiter *arb, cpDataPointer value)

#cpVect cpArbiterTotalImpulse(const cpArbiter *arb)

#cpVect cpArbiterTotalImpulseWithFriction(const cpArbiter *arb)

#cpFloat cpArbiterTotalKE(const cpArbiter *arb)

#void cpArbiterIgnore(cpArbiter *arb)

#void cpArbiterGetShapes(const cpArbiter *arb, cpShape **a, cpShape **b)

#void cpArbiterGetBodies(const cpArbiter *arb, cpBody **a, cpBody **b)

#cpContactPointSet cpArbiterGetContactPointSet(const cpArbiter *arb)

#void cpArbiterSetContactPointSet(cpArbiter *arb, cpContactPointSet *set)

#cpBool cpArbiterIsFirstContact(const cpArbiter *arb)

#int cpArbiterGetCount(const cpArbiter *arb)

#cpVect cpArbiterGetNormal(const cpArbiter *arb, int i)

#cpVect cpArbiterGetPoint(const cpArbiter *arb, int i)

#cpFloat cpArbiterGetDepth(const cpArbiter *arb, int i)

