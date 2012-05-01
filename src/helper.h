#ifndef CHIPMUNK_PERL_HELPER_H
#define CHIPMUNK_PERL_HELPER_H

#include <chipmunk.h>

cpVect *sv_to_vect(SV *arg)
{
	if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
		AV *input = (AV *)SvRV(arg);
		int length = av_len(input);
		if (length != 1) {
			croak("Expected 2 elements, found %d", length + 1);
		}
		cpFloat x, y;
		x = (cpFloat)SvNV(*av_fetch(input, 0, 0));
		y = (cpFloat)SvNV(*av_fetch(input, 1, 0));
		cpVect *vect;
		Newx(vect, 1, cpVect);
		*vect = cpv(x, y);
		return vect;
	} else {
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
	cpVect *verts;
	if (SvTYPE(SvRV(arg)) == SVt_PVAV) {
		AV *input = (AV *)SvRV(arg);
		int length = av_len(input);
		Newx(verts, length + 1, cpVect);
		int i;
		for (i = 0; i < length; i++) {
			SV *vert = *av_fetch(input, i, 0);
			cpVect *v = sv_to_vect(vert);
			Copy(v, &verts[i], 1, cpVect);
		}
		return verts;
	} else {
		croak("Expected array reference");
	}
}

#endif

