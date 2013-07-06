#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Shape	PACKAGE = Chipmunk::Shape	PREFIX = cpshape_
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

#cpBB cpShapeUpdate(cpShape *shape, cpVect pos, cpVect rot);

#cpBool cpShapePointQuery(cpShape *shape, cpVect p);

#cpFloat cpShapeNearestPointQuery(cpShape *shape, cpVect p, cpNearestPointQueryInfo *out);

#cpBool cpShapeSegmentQuery(cpShape *shape, cpVect a, cpVect b, cpSegmentQueryInfo *info);

#cpVect cpSegmentQueryHitPoint(const cpVect start, const cpVect end, const cpSegmentQueryInfo info)

#cpFloat cpSegmentQueryHitDist(const cpVect start, const cpVect end, const cpSegmentQueryInfo info)

#cpSpace* cpShapeGetSpace(const cpShape *shape)

#cpBody* cpShapeGetBody(const cpShape *shape)

#void cpShapeSetBody(cpShape *shape, cpBody *body);

#cpBB cpShapeGetBB(const cpShape *shape)

#cpBool cpShapeGetSensor(const cpShape *shape)

#cpFloat cpShapeGetElasticity(const cpShape *shape)

#void cpShapeSetElasticity(cpShape *shape, cpFloat value)

void
cpshape_set_friction(shape, friction)
		cpShape *shape
		cpFloat friction
	CODE:
		cpShapeSetFriction(shape, friction);

cpFloat
cpshape_get_friction(shape)
		cpShape *shape
	CODE:
		RETVAL = cpShapeGetFriction(shape);
	OUTPUT:
		RETVAL

