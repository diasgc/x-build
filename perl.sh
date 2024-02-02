#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='perl'
dsc='Perl'
lic=''
vrs=''
src="http://www.cpan.org/src/5.0/perl-5.24.1.tar.gz"
cfg='ac'
eta='0'
cross_vrs='1.1.3'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

. xbuild

patch_source(){
    curl -L -O https://github.com/arsv/perl-cross/releases/download/${cross_vrs}/perl-cross-${cross_vrs}.tar.gz
    tar --strip-components=1 -zxf perl-cross-${cross_vrs}.tar.gz && rm -f perl-cross-${cross_vrs}.tar.gz
}

if [ ${host_cross} ]; then
    cfg='ac'
    ac_config="--target=${arch} -Duseshrplib"
fi

start