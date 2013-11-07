#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

MODULE = Chipmunk    PACKAGE = Chipmunk    PREFIX = cp_

void
cp_enable_segment_to_segment_collisions()
    CODE:
        cpEnableSegmentToSegmentCollisions();

void
cp_reset_shape_id_counter()
    CODE:
        cpResetShapeIdCounter();

