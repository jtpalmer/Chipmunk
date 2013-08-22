#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Arbiter    PACKAGE = Chipmunk::Arbiter    PREFIX = cparbiter_
PROTOTYPES: ENABLE

# TODO

#cpFloat cpArbiterGetElasticity(const cpArbiter *arb)

#void cpArbiterSetElasticity(cpArbiter *arb, cpFloat value)

#cpFloat cpArbiterGetFriction(const cpArbiter *arb)

#void cpArbiterSetFriction(cpArbiter *arb, cpFloat value)

#cpVect cpArbiterGetSurfaceVelocity(cpArbiter *arb)

#void cpArbiterSetSurfaceVelocity(cpArbiter *arb, cpVect vr)

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

