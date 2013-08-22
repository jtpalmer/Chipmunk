#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Shape    PACKAGE = Chipmunk::Shape    PREFIX = cpshape_
PROTOTYPES: ENABLE

void
cpshape_free(shape)
        cpShape *shape
    CODE:
        cpShapeFree(shape);

cpBB
cpshape_cache_bb(shape)
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::BB";
    CODE:
        RETVAL = cpShapeCacheBB(shape);
    OUTPUT:
        RETVAL

cpBB
cpshape_update(shape, pos, rot)
        cpShape *shape
        cpVect pos
        cpVect rot
    PREINIT:
        char *CLASS = "Chipmunk::BB";
    CODE:
        RETVAL = cpShapeUpdate(shape, pos, rot);
    OUTPUT:
        RETVAL

cpBool
cpshape_point_query(shape, p)
        cpShape *shape
        cpVect p
    CODE:
        RETVAL = cpShapePointQuery(shape, p);
    OUTPUT:
        RETVAL

# TODO: cpshape_nearest_point_query
#cpFloat cpShapeNearestPointQuery(cpShape *shape, cpVect p, cpNearestPointQueryInfo *out);

# TODO: cpshape_segment_query
#cpBool cpShapeSegmentQuery(cpShape *shape, cpVect a, cpVect b, cpSegmentQueryInfo *info);

# TODO: cpsegment_query_hit_point
#cpVect cpSegmentQueryHitPoint(const cpVect start, const cpVect end, const cpSegmentQueryInfo info)

# TODO: cpsegment_query_hit_dist
#cpFloat cpSegmentQueryHitDist(const cpVect start, const cpVect end, const cpSegmentQueryInfo info)

cpSpace *
cpshape_get_space(shape)
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::Space";
    CODE:
        RETVAL = cpShapeGetSpace(shape);
    OUTPUT:
        RETVAL

cpBody *
cpshape_get_body(shape)
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::Body";
    CODE:
        RETVAL = cpShapeGetBody(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_body(shape, body)
        cpShape *shape
        cpBody *body
    CODE:
        cpShapeSetBody(shape, body);

cpBB
cpshape_get_bb(shape)
        cpShape *shape
    PREINIT:
        char *CLASS = "Chipmunk::BB";
    CODE:
        RETVAL = cpShapeGetBB(shape);
    OUTPUT:
        RETVAL

cpBool
cpshape_get_sensor(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetSensor(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_sensor(shape, value)
        cpShape *shape
        cpBool value
    CODE:
        cpShapeSetSensor(shape, value);

cpFloat
cpshape_get_elasticity(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetElasticity(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_elasticity(shape, value)
        cpShape *shape
        cpFloat value
    CODE:
        cpShapeSetElasticity(shape, value);

cpFloat
cpshape_get_friction(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetFriction(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_friction(shape, friction)
        cpShape *shape
        cpFloat friction
    CODE:
        cpShapeSetFriction(shape, friction);

cpVect
cpshape_get_surface_velocity(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetSurfaceVelocity(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_surface_velocity(shape, value)
        cpShape *shape
        cpVect value
    CODE:
        cpShapeSetSurfaceVelocity(shape, value);

SV *
cpshape_get_user_data(shape)
        cpShape *shape
    CODE:
        RETVAL = (SV *)cpShapeGetUserData(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_user_data(shape, data)
        cpShape *shape
        SV *data
    CODE:
        cpShapeSetUserData(shape, (cpDataPointer)data);

cpCollisionType
cpshape_get_collision_type(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetCollisionType(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_collision_type(shape, value)
        cpShape *shape
        cpCollisionType value
    CODE:
        cpShapeSetCollisionType(shape, value);

cpGroup
cpshape_get_group(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetGroup(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_group(shape, value)
        cpShape *shape
        cpGroup value
    CODE:
        cpShapeSetGroup(shape, value);

cpLayers
cpshape_get_layers(shape)
        cpShape *shape
    CODE:
        RETVAL = cpShapeGetLayers(shape);
    OUTPUT:
        RETVAL

void
cpshape_set_layers(shape, value)
        cpShape *shape
        cpLayers value
    CODE:
        cpShapeSetLayers(shape, value);

