#!/bin/bash

lib='librubberband'
pkg='rubberband'
dsc='An audio time-stretching and pitch-shifting library and utility program.'
lic='GPL-2.0'
src='https://github.com/breakfastquay/rubberband.git'
dep='sndfile samplerate fftw'

cfg='meson'
meson_config='-Dtests=disabled -Dlv2=disabled -Dladspa=disabled -Dvamp=disabled'
meson_bin='cmdline'

dev_bra='default'
dev_vrs='3.3.0'
pkg_deb='librubberband-dev'
eta='49'

lst_inc='rubberband/*.h'
lst_lib='librubberband librubberband-jni'
lst_bin='rubberband'
lst_lic='COPYING'
lst_pc='rubberband.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/rubberband/RubberBandStretcher.h
# include/rubberband/rubberband-c.h
# lib/pkgconfig/rubberband.pc
# lib/librubberband.so
# lib/librubberband.a
# lib/librubberband-jni.so
# share/doc/librubberband/COPYING
# bin/rubberband
