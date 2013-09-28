#ifndef CHIPMUNK_PERL_HELPER_H
#define CHIPMUNK_PERL_HELPER_H

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <chipmunk.h>
#include "func_wrappers.h"

SV *cpPli_object_to_sv(SV *arg, void *obj, const char *classname)
{
    if (obj) {
        sv_setref_pv(arg, classname, (void *)obj);
    } else {
        sv_setsv(arg, &PL_sv_undef);
    }

    return arg;
}

void *cpPli_sv_to_object(SV *arg)
{
    if (sv_isobject(arg) && (SvTYPE(SvRV(arg)) == SVt_PVMG)) {
        return INT2PTR(void *, SvIV((SV *)SvRV(arg)));
    }

    return NULL;
}

cpVect cpPli_sv_to_vect(SV *arg)
{
    AV *input;
    int length;
    cpFloat x, y;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input);

        if (length != 1) {
            croak("Expected 2 elements, found %d", length + 1);
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
    int length, i;
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

SV *cpPli_vect_array_to_sv(int size, cpVect *var)
{
    int i;
    AV *output = newAV();

    for (i = 0; i < size; i++) {
        AV *vect = newAV();
        av_push(vect, newSVnv(var[i].x));
        av_push(vect, newSVnv(var[i].y));
        av_push(output, newRV_inc((SV *)vect));
    }

    return newRV_inc((SV *)output);
}

#define CPPLI_SV_TO_OBJ(name, type)                                          \
type *cpPli_sv_to_##name(SV *arg)                                            \
{                                                                            \
    if (!SvOK(arg)) { return NULL; }                                         \
                                                                             \
    if (sv_isobject(arg) && (SvTYPE(SvRV(arg)) == SVt_PVMG)) {               \
        return (type *)SvIV((SV *)SvRV(arg));                                \
    }                                                                        \
                                                                             \
    return NULL;                                                             \
}                                                                            \

#define CPPLI_OBJ_TO_SV(name, type)                                          \
SV *cpPli_##name##_to_sv(SV *arg, type *obj, const char *classname)          \
{                                                                            \
    if (!obj) {                                                              \
        sv_setsv(arg, &PL_sv_undef);                                         \
        return arg;                                                          \
    }                                                                        \
                                                                             \
    SV *var = (SV *)type##GetUserData(obj);                                  \
                                                                             \
    if (!var) {                                                              \
        var = newSV(0);                                                      \
        sv_setref_pv(var, classname, (void *)obj);                           \
        type##SetUserData(obj, (cpDataPointer)var);                    \
        SvSetSV_nosteal(arg, var);                                               \
    } else {                                                                       \
        SvSetSV_nosteal(arg, var);                                               \
    }                                                                        \
                                                                             \
    return arg;                                                              \
}                                                                            \

#define CPPLI_OBJ_REFCNT_INC(name, type)                                     \
void cpPli_##name##_refcnt_inc(type *obj)                                    \
{                                                                            \
    if (!obj) { return; }                                                    \
    SV *arg = (SV *)type##GetUserData(obj);                                  \
    SvREFCNT_inc(arg);                                                       \
    warn("# " #type " ref count: %u (inc)\n", SvREFCNT(arg));                \
}                                                                            \

#define CPPLI_OBJ_REFCNT_DEC(name, type)                                     \
void cpPli_##name##_refcnt_dec(type *obj)                                    \
{                                                                            \
    if (!obj) { return; }                                                    \
    SV *arg = (SV *)type##GetUserData(obj);                                  \
    SvREFCNT_dec(arg);                                                       \
    warn("# " #type " ref count: %u (dec)\n", SvREFCNT(arg));                \
}                                                                            \

#define CPPLI_OBJ_FREE(name, type)                                           \
void cpPli_##name##_free(type *obj)                                          \
{                                                                            \
    if (!obj) { return; }                                                    \
                                                                             \
    SV *arg = (SV *)type##GetUserData(obj);                                  \
                                                                             \
    if (!arg) { return; }                                                    \
                                                                             \
    if (SvREFCNT(arg) == 1) {                                                \
        type##SetUserData(obj, NULL);                                        \
    }                                                                        \
                                                                             \
    warn("# " #type " ref count: %u (free)\n", SvREFCNT(arg));               \
                                                                             \
    SvREFCNT_dec(arg);                                                       \
                                                                             \
    warn("# " #type " ref count: %u (free)\n", SvREFCNT(arg));               \
                                                                             \
    if (SvREFCNT(arg) == 0) {                                                \
        warn("# Freeing " #type "\n");                                       \
        type##Free(obj);                                                     \
    }                                                                        \
}                                                                            \

#define CPPLI_OBJ_FUNCS(name, type)                                          \
CPPLI_SV_TO_OBJ(name, type)                                                  \
CPPLI_OBJ_TO_SV(name, type)                                                  \
CPPLI_OBJ_REFCNT_INC(name, type)                                             \
CPPLI_OBJ_REFCNT_DEC(name, type)                                             \
CPPLI_OBJ_FREE(name, type)                                                   \

CPPLI_OBJ_FUNCS(body, cpBody)
CPPLI_OBJ_FUNCS(constraint, cpConstraint)
CPPLI_OBJ_FUNCS(shape, cpShape)
CPPLI_OBJ_FUNCS(space, cpSpace)

#endif

