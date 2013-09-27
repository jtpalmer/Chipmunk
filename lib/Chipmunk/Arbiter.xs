#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

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

SV *
cparbiter_get_user_data(arb)
        cpArbiter *arb
    CODE:
        RETVAL = (SV *)cpArbiterGetUserData(arb);
    OUTPUT:
        RETVAL

void
cparbiter_set_user_data(arb, data)
        cpArbiter *arb
        SV *data
    CODE:
        cpArbiterSetUserData(arb, (cpDataPointer)data);

cpVect
cparbiter_total_impulse(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterTotalImpulse(arb);
    OUTPUT:
        RETVAL

cpVect
cparbiter_total_impulse_with_friction(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterTotalImpulseWithFriction(arb);
    OUTPUT:
        RETVAL

cpFloat
cparbiter_total_ke(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterTotalKE(arb);
    OUTPUT:
        RETVAL

void
cparbiter_ignore(arb)
        cpArbiter *arb
    CODE:
        cpArbiterIgnore(arb);

# TODO: Does this actually work?

AV *
cparbiter_get_shapes(arb)
        cpArbiter *arb
    INIT:
        cpShape **a;
        cpShape **b;
        SV *shape_a;
        SV *shape_b;
    CODE:
        cpArbiterGetShapes(arb, a, b);
        load_module((U32)0, newSVpv("Chipmunk::Shape", 0), NULL, NULL);
        sv_setref_pv(shape_a, "Chipmunk::Shape", (void *)*a);
        sv_setref_pv(shape_b, "Chipmunk::Shape", (void *)*b);
        RETVAL = newAV();
        av_push(RETVAL, newRV_inc(shape_a));
        av_push(RETVAL, newRV_inc(shape_b));
    OUTPUT:
        RETVAL

#void cpArbiterGetBodies(const cpArbiter *arb, cpBody **a, cpBody **b)

#cpContactPointSet cpArbiterGetContactPointSet(const cpArbiter *arb)

#void cpArbiterSetContactPointSet(cpArbiter *arb, cpContactPointSet *set)

cpBool
cparbiter_is_first_contact(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterIsFirstContact(arb);
    OUTPUT:
        RETVAL

int
cparbiter_get_count(arb)
        cpArbiter *arb
    CODE:
        RETVAL = cpArbiterGetCount(arb);
    OUTPUT:
        RETVAL

cpVect
cparbiter_get_normal(arb, i)
        cpArbiter *arb
        int i
    CODE:
        RETVAL = cpArbiterGetNormal(arb, i);
    OUTPUT:
        RETVAL

cpVect
cparbiter_get_point(arb, i)
        cpArbiter *arb
        int i
    CODE:
        cpArbiterGetPoint(arb, i);
    OUTPUT:
        RETVAL

cpFloat
cparbiter_get_depth(arb, i)
        cpArbiter *arb
        int i
    CODE:
        RETVAL = cpArbiterGetDepth(arb, i);
    OUTPUT:
        RETVAL

