#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++  .   .  clang
# GNU +++  .   .   .  gcc
# WIN +++  .   .   .  clang/gcc
# warning: Warning static builds of getopt violate the Lesser GNU Public License

lib='flif'
dsc='Free Lossless Image Format'
lic='BSD-2c Apache-2.0 GPL-2.0 LGPL-2.1'
src='https://github.com/FLIF-hub/FLIF.git'
cfg='cmake'
dep='libpng'
eta='60'
pc_llibs='-lflif -lflif_dec'
config_dir='src'
cmake_definitions+=('-Wno-sign-compare' '-Wno-type-limits' '-Wno-unused-but-set-variable')

dev_vrs='v0.4'

lst_inc='flif_dec.h flif_enc.h flif.h flif_common.h'
lst_lib='libflif libflif_dec'
lst_bin='flif apng2flif gif2flif dflif'
lst_lic='share/licenses/FLIF/LICENSE_Apache2
    share/licenses/FLIF/LICENSE
    share/licenses/FLIF/LICENSE_GPL
    share/licenses/FLIF/LICENSE_LGPL
    share/licenses/FLIF/FLIF-CLA-template.txt'

. xbuild && start

# Filelist
# --------
# include/flif_dec.h
# include/flif_enc.h
# include/flif.h
# include/flif_common.h
# lib/pkgconfig/flif_dec.pc
# lib/pkgconfig/flif.pc
# lib/libflif.so.0
# lib/libflif.a
# lib/libflif_dec.a
# lib/libflif_dec.so.0
# share/FLIF/flif.magic
# share/man/man1/flif.1
# share/mime/packages/flif-mime.xml
# share/licenses/FLIF/LICENSE_Apache2
# share/licenses/FLIF/LICENSE
# share/licenses/FLIF/LICENSE_GPL
# share/licenses/FLIF/LICENSE_LGPL
# share/licenses/FLIF/FLIF-CLA-template.txt
# bin/flif
# bin/apng2flif
# bin/gif2flif
# bin/dflif
