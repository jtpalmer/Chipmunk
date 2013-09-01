#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>
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
        cpSpaceFree(space);

# TODO

#int cpSpaceGetIterations(const cpSpace *space)
#void cpSpaceSetIterations(cpSpace *space, int value)

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

# TODO

#cpFloat cpSpaceGetDamping(const cpSpace *space)
#void cpSpaceSetDamping(cpSpace *space, cpFloat value)

#cpFloat cpSpaceGetIdleSpeedThreshold(const cpSpace *space)
#void cpSpaceSetIdleSpeedThreshold(cpSpace *space, cpFloat value)

#cpFloat cpSpaceGetSleepTimeThreshold(const cpSpace *space)
#void cpSpaceSetSleepTimeThreshold(cpSpace *space, cpFloat value)

#cpFloat cpSpaceGetCollisionSlop(const cpSpace *space)
#void cpSpaceSetCollisionSlop(cpSpace *space, cpFloat value)

#cpFloat cpSpaceGetCollisionBias(const cpSpace *space)
#void cpSpaceSetCollisionBias(cpSpace *space, cpFloat value)

#cpTimestamp cpSpaceGetCollisionPersistence(const cpSpace *space)
#void cpSpaceSetCollisionPersistence(cpSpace *space, cpTimestamp value)

#cpBool cpSpaceGetEnableContactGraph(const cpSpace *space)
#void cpSpaceSetEnableContactGraph(cpSpace *space, cpBool value)

#cpDataPointer cpSpaceGetUserData(const cpSpace *space)
#void cpSpaceSetUserData(cpSpace *space, cpDataPointer value)

cpBody *
cpspace_get_static_body(space)
        cpSpace *space
    PREINIT:
        char *CLASS = "Chipmunk::Body";
    CODE:
        RETVAL = cpSpaceGetStaticBody(space);
    OUTPUT:
        RETVAL

# TODO

#cpFloat cpSpaceGetCurrentTimeStep(const cpSpace *space)

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
    OUTPUT:
        RETVAL

# TODO

#cpConstraint* cpSpaceAddConstraint(cpSpace *space, cpConstraint *constraint);

#void cpSpaceRemoveShape(cpSpace *space, cpShape *shape);

#void cpSpaceRemoveStaticShape(cpSpace *space, cpShape *shape);

#void cpSpaceRemoveBody(cpSpace *space, cpBody *body);

#void cpSpaceRemoveConstraint(cpSpace *space, cpConstraint *constraint);

#cpBool cpSpaceContainsShape(cpSpace *space, cpShape *shape);

#cpBool cpSpaceContainsBody(cpSpace *space, cpBody *body);

#cpBool cpSpaceContainsConstraint(cpSpace *space, cpConstraint *constraint);

#void cpSpaceConvertBodyToStatic(cpSpace *space, cpBody *body);

#void cpSpaceConvertBodyToDynamic(cpSpace *space, cpBody *body, cpFloat mass, cpFloat moment);

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

#void cpSpaceReindexStatic(cpSpace *space);

#void cpSpaceReindexShape(cpSpace *space, cpShape *shape);

#void cpSpaceReindexShapesForBody(cpSpace *space, cpBody *body);

#void cpSpaceUseSpatialHash(cpSpace *space, cpFloat dim, int count);

void
cpspace_step(space, dt)
        cpSpace *space
        cpFloat dt
    CODE:
        cpSpaceStep(space, dt);

