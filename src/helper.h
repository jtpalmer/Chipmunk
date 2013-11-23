#ifndef CHIPMUNK_PERL_HELPER_H
#define CHIPMUNK_PERL_HELPER_H

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chipmunk.h>

SV *cpPli_object_to_sv(SV *arg, void *obj, const char *classname)
{
    if (obj) {
        sv_setref_pv(arg, classname, (void *)obj);
    }
    else {
        sv_setsv(arg, &PL_sv_undef);
    }

    return arg;
}

void *cpPli_sv_to_object(SV *arg)
{
    if (sv_isobject(arg) && (SvTYPE(SvRV(arg)) == SVt_PVMG)) {
        return INT2PTR(void *, SvIV(SvRV(arg)));
    }

    return NULL;
}

cpVect cpPli_sv_to_vect(SV *arg)
{
    AV *input;
    I32 length;
    cpFloat x, y;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input) + 1;

        if (length != 2) {
            croak("Expected 2 elements, found %d", length);
        }

        x = (cpFloat)SvNV(*av_fetch(input, 0, 0));
        y = (cpFloat)SvNV(*av_fetch(input, 1, 0));

        return cpv(x, y);
    }
    else {
        croak("Expected array reference");
    }
}

SV *cpPli_vect_to_sv(cpVect var)
{
    AV *output = newAV();
    av_push(output, newSVnv(var.x));
    av_push(output, newSVnv(var.y));
    return newRV_inc((SV *)output);
}

cpVect *cpPli_sv_to_vect_array(SV *arg)
{
    AV *input;
    I32 length, i;
    SV *vert;
    cpVect v;
    cpVect *verts;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input) + 1;

        Newx(verts, length, cpVect);

        for (i = 0; i < length; i++) {
            vert = *av_fetch(input, i, 0);
            v = cpPli_sv_to_vect(vert);
            Copy(&v, &verts[i], 1, cpVect);
        }

        return verts;
    }
    else {
        croak("Expected array reference");
    }
}

SV *cpPli_vect_array_to_sv(I32 size, cpVect *var)
{
    I32 i;
    AV *vect;
    AV *output = newAV();

    for (i = 0; i < size; i++) {
        vect = newAV();
        av_push(vect, newSVnv(var[i].x));
        av_push(vect, newSVnv(var[i].y));
        av_push(output, newRV_inc((SV *)vect));
    }

    return newRV_inc((SV *)output);
}

cpMat2x2 cpPli_sv_to_mat2x2(SV *arg)
{
    AV *input;
    I32 length;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input) + 1;

        if (length != 4) {
            croak("Expected 4 elements, found %d", length);
        }

        return cpMat2x2New(
                   (cpFloat)SvNV(*av_fetch(input, 0, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 1, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 2, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 3, 0))
               );
    }
    else {
        croak("Expected array reference");
    }

    return cpMat2x2New(0.0f, 0.0f, 0.0f, 0.0f);
}

SV *cpPli_mat2x2_to_sv(cpMat2x2 var)
{
    SV *arg;
    AV *output = newAV();

    av_push(output, newSVnv(var.a));
    av_push(output, newSVnv(var.b));
    av_push(output, newSVnv(var.c));
    av_push(output, newSVnv(var.d));

    arg = newRV_inc((SV *)output);
    sv_bless(arg, gv_stashpv("Chipmunk::Mat2x2", (I32)0));

    return arg;
}

cpBB cpPli_sv_to_bb(SV *arg)
{
    AV *input;
    I32 length;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input) + 1;

        if (length != 4) {
            croak("Expected 4 elements, found %d", length);
        }

        return cpBBNew(
                   (cpFloat)SvNV(*av_fetch(input, 0, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 1, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 2, 0)),
                   (cpFloat)SvNV(*av_fetch(input, 3, 0))
               );
    }
    else {
        croak("Expected array reference");
    }

    return cpBBNew(0.0f, 0.0f, 0.0f, 0.0f);
}

SV *cpPli_bb_to_sv(cpBB var)
{
    SV *arg;
    AV *output = newAV();

    av_push(output, newSVnv(var.l));
    av_push(output, newSVnv(var.b));
    av_push(output, newSVnv(var.r));
    av_push(output, newSVnv(var.t));

    arg = newRV_inc((SV *)output);
    sv_bless(arg, gv_stashpv("Chipmunk::BB", (I32)0));

    return arg;
}

#define CPPLI_SV_TO_OBJ(name, type)                                          \
type *cpPli_sv_to_##name(SV *arg)                                            \
{                                                                            \
    if (!SvOK(arg)) { return NULL; }                                         \
                                                                             \
    if (sv_isobject(arg) && (SvTYPE(SvRV(arg)) == SVt_PVMG)) {               \
        return (type *)SvIV(SvRV(arg));                                      \
    }                                                                        \
                                                                             \
    return NULL;                                                             \
}

#define CPPLI_OBJ_TO_SV(name, type)                                          \
SV *cpPli_##name##_to_sv(SV *arg, type *obj, const char *classname)          \
{                                                                            \
    SV *var;                                                                 \
    SV *ref;                                                                 \
                                                                             \
    if (!obj) {                                                              \
        sv_setsv(arg, &PL_sv_undef);                                         \
        return arg;                                                          \
    }                                                                        \
                                                                             \
    var = (SV *)type##GetUserData(obj);                                      \
                                                                             \
    if (!var) {                                                              \
        sv_setref_pv(arg, classname, (void *)obj);                           \
        ref = newRV_noinc(SvRV(arg));                                        \
        type##SetUserData(obj, (cpDataPointer)ref);                          \
    }                                                                        \
    else {                                                                   \
        SvSetSV(arg, newRV_noinc(SvRV(var)));                                \
    }                                                                        \
                                                                             \
    return arg;                                                              \
}

#define CPPLI_OBJ_REFCNT_INC(name, type)                                     \
void cpPli_##name##_refcnt_inc(type *obj)                                    \
{                                                                            \
    SV *data;                                                                \
    if (!obj) { return; }                                                    \
    data = (SV *)type##GetUserData(obj);                                     \
    SvREFCNT_inc(SvRV(data));                                                \
}

#define CPPLI_OBJ_REFCNT_DEC(name, type)                                     \
void cpPli_##name##_refcnt_dec(type *obj)                                    \
{                                                                            \
    SV *data;                                                                \
    if (!obj) { return; }                                                    \
    data = (SV *)type##GetUserData(obj);                                     \
    SvREFCNT_dec(SvRV(data));                                                \
}

#define CPPLI_OBJ_FREE(name, type)                                           \
void cpPli_##name##_free(type *obj)                                          \
{                                                                            \
    SV *data;                                                                \
    if (!obj) { return; }                                                    \
    data = (SV *)type##GetUserData(obj);                                     \
    if (!data) { return; }                                                   \
    type##Free(obj);                                                         \
}

#define CPPLI_OBJ_FUNCS(name, type)                                          \
CPPLI_SV_TO_OBJ(name, type)                                                  \
CPPLI_OBJ_TO_SV(name, type)                                                  \
CPPLI_OBJ_REFCNT_INC(name, type)                                             \
CPPLI_OBJ_REFCNT_DEC(name, type)                                             \
CPPLI_OBJ_FREE(name, type)

CPPLI_OBJ_FUNCS(body, cpBody)
CPPLI_OBJ_FUNCS(constraint, cpConstraint)
CPPLI_OBJ_FUNCS(shape, cpShape)
CPPLI_OBJ_FUNCS(space, cpSpace)

typedef struct cpPli_func_data {
    SV *func;
    SV *data;
} cpPli_func_data;

cpPli_func_data *cpPli_func_data_new(SV *func, SV *data)
{
    cpPli_func_data *combined;

    Newx(combined, 1, cpPli_func_data);

    combined->func = newRV_inc(func);
    combined->data = newRV_inc(data);

    return combined;
}

void cpPli_func_data_free(cpPli_func_data *combined)
{
    SvREFCNT_dec(SvRV(combined->func));
    SvREFCNT_dec(SvRV(combined->data));
    Safefree(combined);
}

/* cpSpace */

/* typedef void (*cpPostStepFunc)(cpSpace *space, void *key, void *data) */
/* void (cpShape *shape, void *key, void *data) */
void cpPli_post_step_func(cpSpace *space, SV *key, cpPli_func_data *combined)
{
    dSP;
    SV *func;
    SV *data;
    SV *space_sv;

    space_sv = sv_newmortal();
    cpPli_space_to_sv(space_sv, space, "Chipmunk::Space");

    func = SvRV(combined->func);
    data = SvRV(combined->data);

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

    cpPli_func_data_free(combined);
}

/* typedef void (*cpSpacePointQueryFunc)(cpShape *shape, void *data) */
/* void (cpShape *shape, void *data) */
void cpPli_point_query_func(cpShape *shape, cpPli_func_data *combined)
{
    dSP;
    SV *func;
    SV *data;
    SV *shape_sv;

    shape_sv = sv_newmortal();
    cpPli_shape_to_sv(shape_sv, shape, "Chipmunk::Shape");

    func = SvRV(combined->func);
    data = SvRV(combined->data);

    ENTER;
    SAVETMPS;

    PUSHMARK(SP);
    XPUSHs(shape_sv);
    XPUSHs(data);
    PUTBACK;

    call_sv(func, G_VOID | G_DISCARD);

    FREETMPS;
    LEAVE;

    cpPli_func_data_free(combined);
}

/* typedef void (*cpSpaceNearestPointQueryFunc)(cpShape *shape, cpFloat distance, cpVect point, void *data) */
/* void (cpShape *shape, cpFloat distance, cpVect point, void *data) */

/* typedef void (*cpSpaceSegmentQueryFunc)(cpShape *shape, cpFloat t, cpVect n, void *data) */
/* void (cpShape *shape, cpFloat t, cpVect n, void *data) */

/* typedef void (*cpSpaceBBQueryFunc)(cpShape *shape, void *data) */
/* void (cpShape *shape, void *data) */

/* typedef void (*cpSpaceShapeQueryFunc)(cpShape *shape, cpContactPointSet *points, void *data) */
/* void (cpShape *shape, cpContactPointSet *points, void *data) */

/* typedef void (*cpSpaceBodyIteratorFunc)(cpBody *body, void *data) */
/* void (cpBody *body, void *data) */

/* typedef void (*cpSpaceShapeIteratorFunc)(cpShape *shape, void *data) */
/* void (cpShape *shape, void *data) */

/* typedef void (*cpSpaceConstraintIteratorFunc)(cpConstraint *constraint, void *data) */
/* void (cpConstraint *constraint, void *data) */

/* cpBody */

/* typedef void (*cpBodyShapeIteratorFunc)(cpBody *body, cpShape *shape, void *data) */
/* void (cpBody *body, cpShape *shape, void *data) */

/* typedef void (*cpBodyConstraintIteratorFunc)(cpBody *body, cpConstraint *constraint, void *data) */
/* void (cpBody *body, cpConstraint *constraint, void *data) */

/* typedef void (*cpBodyArbiterIteratorFunc)(cpBody *body, cpArbiter *arbiter, void *data) */
/* void (cpBody *body, cpArbiter *arbiter, void *data) */

/* cpConstraint */

/* typedef void (*cpConstraintPreSolveFunc)(cpConstraint *constraint, cpSpace *space) */
/* void (cpConstraint *constraint, cpSpace *space) */
/* NOTE: no data. */

/* typedef void (*cpConstraintPostSolveFunc)(cpConstraint *constraint, cpSpace *space) */
/* void (cpConstraint *constraint, cpSpace *space) */
/* NOTE: no data. */

/* cpArbiter */

/* typedef cpBool (*cpCollisionBeginFunc)(cpArbiter *arb, cpSpace *space, void *data) */
/* cpBool (cpArbiter *arb, cpSpace *space, void *data) */
/* NOTE: returns bool. */

/* typedef cpBool (*cpCollisionPreSolveFunc)(cpArbiter *arb, cpSpace *space, void *data) */
/* cpBool (cpArbiter *arb, cpSpace *space, void *data) */
/* NOTE: returns bool. */

/* typedef void (*cpCollisionPostSolveFunc)(cpArbiter *arb, cpSpace *space, void *data) */
/* void (cpArbiter *arb, cpSpace *space, void *data) */

/* typedef void (*cpCollisionSeparateFunc)(cpArbiter *arb, cpSpace *space, void *data) */
/* void (cpArbiter *arb, cpSpace *space, void *data) */

/* cpDampedSpring */

/* typedef cpFloat (*cpDampedSpringForceFunc)(cpConstraint *spring, cpFloat dist) */
/* cpFloat (cpConstraint *spring, cpFloat dist) */
/* NOTE: no data, returns float. */

/* cpDampedSpring */

/* typedef cpFloat (*cpDampedRotarySpringTorqueFunc)(struct cpConstraint *spring, cpFloat relativeAngle) */
/* cpFloat (struct cpConstraint *spring, cpFloat relativeAngle) */
/* NOTE: no data, returns float. */

#endif /* CHIPMUNK_PERL_HELPER_H */
