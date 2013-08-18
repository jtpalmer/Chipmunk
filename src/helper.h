#ifndef CHIPMUNK_PERL_HELPER_H
#define CHIPMUNK_PERL_HELPER_H

#include <chipmunk.h>
#include "func_wrappers.h"

cpVect *sv_to_vect(SV *arg)
{
    AV *input;
    int length;
    cpFloat x, y;
    cpVect *vect;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input);

        if (length != 1) {
            croak("Expected 2 elements, found %d", length + 1);
        }

        x = (cpFloat)SvNV(*av_fetch(input, 0, 0));
        y = (cpFloat)SvNV(*av_fetch(input, 1, 0));

        Newx(vect, 1, cpVect);

        *vect = cpv(x, y);

        return vect;
    }
    else {
        croak("Expected array reference");
    }
}

SV *vect_to_sv(cpVect var)
{
    AV *output = newAV();
    av_push(output, newSVnv(var.x));
    av_push(output, newSVnv(var.y));
    return newRV_inc((SV *)output);
}

cpVect *sv_to_vect_array(SV *arg)
{
    AV *input;
    int length, i;
    SV *vert;
    cpVect *v;
    cpVect *verts;

    if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
        input = (AV *)SvRV(arg);
        length = av_len(input) + 1;
        Newx(verts, length, cpVect);

        for (i = 0; i < length; i++) {
            vert = *av_fetch(input, i, 0);
            v = sv_to_vect(vert);
            Copy(v, &verts[i], 1, cpVect);
            Safefree(v);
        }

        return verts;
    }
    else {
        croak("Expected array reference");
    }
}

SV *vect_array_to_sv(int size, cpVect *var)
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

#endif

