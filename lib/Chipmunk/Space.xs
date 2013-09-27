#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk::Space    PACKAGE = Chipmunk::Space    PREFIX = cpspace_
PROTOTYPES: ENABLE

cpSpace *
cpspace_new(CLASS)
        char *CLASS
    CODE:
        RETVAL = cpSpaceNew();
    OUTPUT:
        RETVAL

void
cpspace_free(space)
        cpSpace *space
    CODE:
        cpSpaceEachBody(space, (cpSpaceBodyIteratorFunc)cpPli_body_free, NULL);
        cpSpaceFree(space);

int
cpspace_get_iterations(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetIterations(space);
    OUTPUT:
        RETVAL

void
cpspace_set_iterations(space, value)
        cpSpace *space
        int value
    CODE:
        cpSpaceSetIterations(space, value);

void
cpspace_set_gravity(space, gravity)
        cpSpace *space
        cpVect gravity
    CODE:
        cpSpaceSetGravity(space, gravity);

cpVect
cpspace_get_gravity(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetGravity(space);
    OUTPUT:
        RETVAL

cpFloat
cpspace_get_damping(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetDamping(space);
    OUTPUT:
        RETVAL

void
cpspace_set_damping(space, value)
        cpSpace *space
        cpFloat value
    CODE:
        cpSpaceSetDamping(space, value);

cpFloat
cpspace_get_idle_speed_threshold(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetIdleSpeedThreshold(space);
    OUTPUT:
        RETVAL

void
cpspace_set_idle_speed_threshold(space, value)
        cpSpace *space
        cpFloat value
    CODE:
        cpSpaceSetIdleSpeedThreshold(space, value);

cpFloat
cpspace_get_sleep_time_threshold(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetSleepTimeThreshold(space);
    OUTPUT:
        RETVAL

void
cpspace_set_sleep_time_threshold(space, value)
        cpSpace *space
        cpFloat value
    CODE:
        cpSpaceSetSleepTimeThreshold(space, value);

cpFloat
cpspace_get_collision_slop(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetCollisionSlop(space);
    OUTPUT:
        RETVAL

void
cpspace_set_collision_slop(space, value)
        cpSpace *space
        cpFloat value
    CODE:
        cpSpaceSetCollisionSlop(space, value);

cpFloat
cpspace_get_collision_bias(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetCollisionBias(space);
    OUTPUT:
        RETVAL

void
cpspace_set_collision_bias(space, value)
        cpSpace *space
        cpFloat value
    CODE:
        cpSpaceSetCollisionBias(space, value);

cpTimestamp
cpspace_get_collision_persistence(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetCollisionPersistence(space);
    OUTPUT:
        RETVAL

void
cpspace_set_collision_persistence(space, value)
        cpSpace *space
        cpTimestamp value
    CODE:
        cpSpaceSetCollisionPersistence(space, value);

cpBool
cpspace_get_enable_contact_graph(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetEnableContactGraph(space);
    OUTPUT:
        RETVAL

void
cpspace_set_enable_contact_graph(space, value)
        cpSpace *space
        cpBool value
    CODE:
        cpSpaceSetEnableContactGraph(space, value);

SV *
cpspace_get_user_data(space)
        cpSpace *space
    CODE:
        RETVAL = (SV *)cpSpaceGetUserData(space);
    OUTPUT:
        RETVAL

void
cpspace_set_user_data(space, data)
        cpSpace *space
        SV *data
    CODE:
        cpSpaceSetUserData(space, (cpDataPointer)data);

cpBody *
cpspace_get_static_body(space)
        cpSpace *space
    PREINIT:
        char *CLASS = "Chipmunk::Body";
    CODE:
        RETVAL = cpSpaceGetStaticBody(space);
    OUTPUT:
        RETVAL

cpFloat
cpspace_get_current_time_step(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceGetCurrentTimeStep(space);
    OUTPUT:
        RETVAL

cpBool
cpspace_is_locked(space)
        cpSpace *space
    CODE:
        RETVAL = cpSpaceIsLocked(space);
    OUTPUT:
        RETVAL

# TODO

#void cpSpaceSetDefaultCollisionHandler(
# cpSpace *space,
# cpCollisionBeginFunc begin,
# cpCollisionPreSolveFunc preSolve,
# cpCollisionPostSolveFunc postSolve,
# cpCollisionSeparateFunc separate,
# void *data
#);

#void cpSpaceAddCollisionHandler(
# cpSpace *space,
# cpCollisionType a, cpCollisionType b,
# cpCollisionBeginFunc begin,
# cpCollisionPreSolveFunc preSolve,
# cpCollisionPostSolveFunc postSolve,
# cpCollisionSeparateFunc separate,
# void *data
#);

#void cpSpaceRemoveCollisionHandler(cpSpace *space, cpCollisionType a, cpCollisionType b);

cpShape *
cpspace_add_shape(space, shape)
        cpSpace *space
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::Shape";
    CODE:
        RETVAL = cpSpaceAddShape(space, shape);
    OUTPUT:
        RETVAL

cpShape *
cpspace_add_static_shape(space, shape)
        cpSpace *space
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::Shape";
    CODE:
        RETVAL = cpSpaceAddStaticShape(space, shape);
    OUTPUT:
        RETVAL

cpBody *
cpspace_add_body(space, body)
        cpSpace *space
        cpBody *body
    PREINIT:
        char *CLASS = "Chipmunk::Body";
    CODE:
        RETVAL = cpSpaceAddBody(space, body);
        cpPli_body_refcnt_inc(body);
    OUTPUT:
        RETVAL

cpConstraint *
cpspace_add_constraint(space, constraint)
        cpSpace *space
        cpConstraint *constraint
    PREINIT:
        char *CLASS = "Chipmunk::Constraint";
    CODE:
        RETVAL = cpSpaceAddConstraint(space, constraint);
    OUTPUT:
        RETVAL

void
cpspace_remove_shape(space, shape)
        cpSpace *space
        cpShape *shape
    CODE:
        cpSpaceRemoveShape(space, shape);

void
cpspace_remove_static_shape(space, shape)
        cpSpace *space
        cpShape *shape
    CODE:
        cpSpaceRemoveStaticShape(space, shape);

void
cpspace_remove_body(space, body)
        cpSpace *space
        cpBody *body
    CODE:
        cpSpaceRemoveBody(space, body);

void
cpspace_remove_constraint(space, constraint)
        cpSpace *space
        cpConstraint *constraint
    CODE:
        cpSpaceRemoveConstraint(space, constraint);

cpBool
cpspace_contains_shape(space, shape)
        cpSpace *space
        cpShape *shape
    CODE:
        RETVAL = cpSpaceContainsShape(space, shape);
    OUTPUT:
        RETVAL

cpBool
cpspace_contains_body(space, body)
        cpSpace *space
        cpBody *body
    CODE:
        RETVAL = cpSpaceContainsBody(space, body);
    OUTPUT:
        RETVAL

cpBool
cpspace_contains_constraint(space, constraint)
        cpSpace *space
        cpConstraint *constraint
    CODE:
        RETVAL = cpSpaceContainsConstraint(space, constraint);
    OUTPUT:
        RETVAL

void
cpspace_convert_body_to_static(space, body)
        cpSpace *space
        cpBody *body
    CODE:
        cpSpaceConvertBodyToStatic(space, body);

void
cpspace_convert_body_to_dynamic(space, body, mass, moment)
        cpSpace *space
        cpBody *body
        cpFloat mass
        cpFloat moment
    CODE:
        cpSpaceConvertBodyToDynamic(space, body, mass, moment);

cpBool
cpspace_add_post_step_callback(space, func, key, data)
        cpSpace *space
        SV *func
        SV *key
        SV *data
    INIT:
        cp_func_data *func_data;
    CODE:
        func_data = new_func_data(func, data);

        RETVAL = cpSpaceAddPostStepCallback(
            space,
            (cpPostStepFunc)cp_post_step_func,
            key,
            func_data
        );

        if (!RETVAL) {
            free_func_data(func_data);
        }
    OUTPUT:
        RETVAL

# TODO

#typedef void (*cpSpacePointQueryFunc)(cpShape *shape, void *data);
#void cpSpacePointQuery(cpSpace *space, cpVect point, cpLayers layers, cpGroup group, cpSpacePointQueryFunc func, void *data);
#cpShape *cpSpacePointQueryFirst(cpSpace *space, cpVect point, cpLayers layers, cpGroup group);

#typedef void (*cpSpaceNearestPointQueryFunc)(cpShape *shape, cpFloat distance, cpVect point, void *data);
#void cpSpaceNearestPointQuery(cpSpace *space, cpVect point, cpFloat maxDistance, cpLayers layers, cpGroup group, cpSpaceNearestPointQueryFunc func, void *data);
#cpShape *cpSpaceNearestPointQueryNearest(cpSpace *space, cpVect point, cpFloat maxDistance, cpLayers layers, cpGroup group, cpNearestPointQueryInfo *out);

#typedef void (*cpSpaceSegmentQueryFunc)(cpShape *shape, cpFloat t, cpVect n, void *data);
#void cpSpaceSegmentQuery(cpSpace *space, cpVect start, cpVect end, cpLayers layers, cpGroup group, cpSpaceSegmentQueryFunc func, void *data);
#cpShape *cpSpaceSegmentQueryFirst(cpSpace *space, cpVect start, cpVect end, cpLayers layers, cpGroup group, cpSegmentQueryInfo *out);

#typedef void (*cpSpaceBBQueryFunc)(cpShape *shape, void *data);
#void cpSpaceBBQuery(cpSpace *space, cpBB bb, cpLayers layers, cpGroup group, cpSpaceBBQueryFunc func, void *data);

#typedef void (*cpSpaceShapeQueryFunc)(cpShape *shape, cpContactPointSet *points, void *data);
#cpBool cpSpaceShapeQuery(cpSpace *space, cpShape *shape, cpSpaceShapeQueryFunc func, void *data);

#void cpSpaceActivateShapesTouchingShape(cpSpace *space, cpShape *shape);

#typedef void (*cpSpaceBodyIteratorFunc)(cpBody *body, void *data);
#void cpSpaceEachBody(cpSpace *space, cpSpaceBodyIteratorFunc func, void *data);

#typedef void (*cpSpaceShapeIteratorFunc)(cpShape *shape, void *data);
#void cpSpaceEachShape(cpSpace *space, cpSpaceShapeIteratorFunc func, void *data);

#typedef void (*cpSpaceConstraintIteratorFunc)(cpConstraint *constraint, void *data);
#void cpSpaceEachConstraint(cpSpace *space, cpSpaceConstraintIteratorFunc func, void *data);

void
cpspace_reindex_static(space)
        cpSpace *space
    CODE:
        cpSpaceReindexStatic(space);

void
cpspace_reindex_shape(space, shape)
        cpSpace *space
        cpShape *shape
    CODE:
        cpSpaceReindexShape(space, shape);

void
cpspace_reindex_shapes_for_body(space, body)
        cpSpace *space
        cpBody *body
    CODE:
        cpSpaceReindexShapesForBody(space, body);

void
cpspace_use_spatial_hash(space, dim, count)
        cpSpace *space
        cpFloat dim
        int count
    CODE:
        cpSpaceUseSpatialHash(space, dim, count);

void
cpspace_step(space, dt)
        cpSpace *space
        cpFloat dt
    CODE:
        cpSpaceStep(space, dt);

