#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::Vect	PACKAGE = Chipmunk::Vect	PREFIX = cpvect_
PROTOTYPES: ENABLE

cpVect
cpvect_cpvslerp(v1, v2, t)
		cpVect v1
		cpVect v2
		cpFloat t
	CODE:
		RETVAL = cpvslerp(v1, v2, t);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvlerp(v1, v2, t)
		cpVect v1
		cpVect v2
		cpFloat t
	CODE:
		RETVAL = cpvlerp(v1, v2, t);
	OUTPUT:
		RETVAL

