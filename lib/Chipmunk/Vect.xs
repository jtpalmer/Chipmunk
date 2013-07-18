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
cpvect_cpvslerpconst(v1, v2, a)
		cpVect v1
		cpVect v2
		cpFloat a
	CODE:
		RETVAL = cpvslerpconst(v1, v2, a);
	OUTPUT:
		RETVAL

char *
cpvect_cpvstr(v)
		cpVect v
	CODE:
		RETVAL = cpvstr(v);
	OUTPUT:
		RETVAL

cpBool
cpvect_cpveql(v1, v2)
		cpVect v1
		cpVect v2
	CODE:
		RETVAL = cpveql(v1, v2);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvadd(v1, v2)
		cpVect v1
		cpVect v2
	CODE:
		RETVAL = cpvadd(v1, v2);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvsub(v1, v2)
		cpVect v1
		cpVect v2
	CODE:
		RETVAL = cpvsub(v1, v2);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvneg(v)
		cpVect v
	CODE:
		RETVAL = cpvneg(v);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvmult(v, s)
		cpVect v
		cpFloat s
	CODE:
		RETVAL = cpvmult(v, s);
	OUTPUT:
		RETVAL

cpFloat
cpvect_cpvdot(v1, v2)
		cpVect v1
		cpVect v2
	CODE:
		RETVAL = cpvdot(v1, v2);
	OUTPUT:
		RETVAL

cpFloat
cpvect_cpvcross(v1, v2)
		cpVect v1
		cpVect v2
	CODE:
		RETVAL = cpvcross(v1, v2);
	OUTPUT:
		RETVAL

cpVect
cpvect_cpvperp(v)
		cpVect v
	CODE:
		RETVAL = cpvperp(v);
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

