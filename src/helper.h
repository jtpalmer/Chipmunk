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

    return cpMat2x2New(0.0, 0.0, 0.0, 0.0);
}

SV *cpPli_mat2x2_to_sv(cpMat2x2 var)
{
    AV *output = newAV();
    av_push(output, newSVnv(var.a));
    av_push(output, newSVnv(var.b));
    av_push(output, newSVnv(var.c));
    av_push(output, newSVnv(var.d));
    return newRV_inc((SV *)output);
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

    return cpBBNew(0.0, 0.0, 0.0, 0.0);
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
    load_module((U32)0, newSVpv("Chipmunk::BB", 0), NULL, NULL);
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

#endif /* CHIPMUNK_PERL_HELPER_H */
