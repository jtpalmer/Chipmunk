#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include <chipmunk.h>

MODULE = Chipmunk::PivotJoint   PACKAGE = Chipmunk::PivotJoint   PREFIX = cppivotjoint_
PROTOTYPES: ENABLE

# TODO: Combine constructors.

cpConstraint *
cppivotjoint_new(CLASS, a, b, pivot)
      char *CLASS
      cpBody *a
      cpBody *b
      cpVect pivot
   CODE:
      RETVAL = cpPivotJointNew(a, b, pivot);
   OUTPUT:
      RETVAL

cpConstraint *
cppivotjoint_new2(CLASS, a, b, anchr1, anchr2)
      char *CLASS
      cpBody *a
      cpBody *b
      cpVect anchr1
      cpVect anchr2
   CODE:
      RETVAL = cpPivotJointNew2(a, b, anchr1, anchr2);
   OUTPUT:
      RETVAL

cpVect
cppivotjoint_get_anchr1(constraint)
      cpConstraint *constraint
   CODE:
      RETVAL = cpPivotJointGetAnchr1(constraint);
   OUTPUT:
      RETVAL

void
cppivotjoint_set_anchr1(constraint, value)
      cpConstraint *constraint
      cpVect value
   CODE:
      cpPivotJointSetAnchr1(constraint, value);

cpVect
cppivotjoint_get_anchr2(constraint)
      cpConstraint *constraint
   CODE:
      RETVAL = cpPivotJointGetAnchr2(constraint);
   OUTPUT:
      RETVAL

void
cppivotjoint_set_anchr2(constraint, value)
      cpConstraint *constraint
      cpVect value
   CODE:
      cpPivotJointSetAnchr2(constraint, value);

