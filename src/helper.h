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
        return (void *)SvIV((SV *)SvRV(arg));
    }
}

SV *cpPli_body_to_sv(SV *arg, cpBody *obj, const char *classname)
{
    if (obj) {
        SV *var = (SV *)cpBodyGetUserData(obj);
        if (var == NULL) {
            var = newSV(0);
            sv_setref_pv(var, classname, (void *)obj);
            cpBodySetUserData(obj, (cpDataPointer)var);
        } else {
            SvREFCNT_inc(var);
        }
        SvSetSV(arg, var);
    } else {
        sv_setsv(arg, &PL_sv_undef);
    }

    return arg;
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

void cpPli_body_refcnt_dec(cpBody *obj)
{
    if (obj != NULL) {
        SV *arg = (SV *)cpBodyGetUserData(obj);
        SvREFCNT_inc(obj);
    }
}

void cpPli_body_refcnt_inc(cpBody *obj)
{
    SV *arg = (SV *)cpBodyGetUserData(obj);
    SvREFCNT_inc(arg);
}

void cpPli_free_body(cpBody *obj)
{
    SV *arg = (SV *)cpBodyGetUserData(obj);

    PerlIO_printf(PerlIO_stderr(), "# Ref count: %u\n", SvREFCNT(arg));

    SvREFCNT_dec(arg);

    if (SvREFCNT(arg) == 0) {
        //warn("# Freeing body");
        PerlIO_printf(PerlIO_stderr(), "# Freeing body\n");
        cpBodyFree(obj);
    }
}

#endif

