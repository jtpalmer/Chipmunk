#ifndef CHIPMUNK_PERL_FUNC_WRAPPERS_H
#define CHIPMUNK_PERL_FUNC_WRAPPERS_H

/**
 * Provides functions that can be used to wrap Perl subroutines in
 * Chipmunk callbacks.
 */

typedef struct cp_func_data {
    SV *func;
    SV *data;
} cp_func_data;

cp_func_data *new_func_data(SV *func, SV *data)
{
    cp_func_data *combined;

    Newx(combined, 1, cp_func_data);

    combined->func = newSVsv(func);
    combined->data = newSVsv(data);

    return combined;
}

void free_func_data(cp_func_data *combined)
{
    SvREFCNT_dec(combined->func);
    SvREFCNT_dec(combined->data);
    Safefree(combined);
}

/* typedef void(*cpPostStepFunc)(cpSpace *space, void *key, void *data) */
void cp_post_step_func(cpSpace *space, SV *key, cp_func_data *combined)
{
    dSP;
    SV *func;
    SV *data;
    SV *space_sv;

    space_sv = sv_newmortal();
    sv_setref_pv(space_sv, "Chipmunk::Space", (void *)space);

    func = combined->func;
    data = combined->data;

    ENTER;
    SAVETMPS;

    PUSHMARK(SP);
    XPUSHs(space_sv);
    XPUSHs(key);
    XPUSHs(data);
    PUTBACK;

    call_sv(func, G_VOID | G_DISCARD);

    FREETMPS;
    LEAVE;

    free_func_data(combined);
}

/* typedef void(*cpSpacePointQueryFunc)(cpShape *shape, void *data) */

/* typedef void(*cpSpaceNearestPointQueryFunc)(cpShape *shape, cpFloat distance, cpVect point, void *data) */

/* typedef void(*cpSpaceSegmentQueryFunc)(cpShape *shape, cpFloat t, cpVect n, void *data) */

/* typedef void(*cpSpaceBBQueryFunc)(cpShape *shape, void *data) */

/* typedef void(*cpSpaceShapeQueryFunc)(cpShape *shape, cpContactPointSet *points, void *data) */

/* typedef void(*cpSpaceBodyIteratorFunc)(cpBody *body, void *data) */

/* typedef void(*cpSpaceShapeIteratorFunc)(cpShape *shape, void *data) */

/* typedef void(*cpSpaceConstraintIteratorFunc)(cpConstraint *constraint, void *data) */

#endif

