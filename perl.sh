#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='perl'
dsc='Perl'
lic=''
cfg='ac'

cross_vrs='1.1.3'

dev_bra='master'
dev_vrs=''
pkg_deb=''
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

patch_source(){
    vrs_cross="$(tar_version 'https://github.com/arsv/perl-cross/releases' 'perl-cross-')"
    src_cross="https://github.com/arsv/perl-cross/archive/refs/tags/${vrs_cross}.tar.gz"
    pushdir ${dir_sources}
    curl_tar_simple "${src_cross}"
    popdir
}

on_config(){
    tar_stripcomponents=true
    vrs="$(tar_version 'https://www.cpan.org/src/5.0/' 'perl-')"
    src="http://www.cpan.org/src/5.0/perl-${vrs}.tar.gz"
    if ${host_cross}; then
        cfg='ac'
        ac_config="--target=${arch} -Duseshrplib"
    fi
}

. xbuild && start