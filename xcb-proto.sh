#!/bin/bash

lib='xcb-proto'
dsc='XML-XCB protocol descriptions'
lic='Other'
src='https://gitlab.com/freedesktop/xcb-proto.git'
url='https://xcb.freedesktop.org/'

cfg='ag'

dev_bra='master'
dev_vrs='1.16.0'
pkg_deb='xcb-proto'
eta='32'

on_config(){
    vrs='1.16.0'
    src="https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-${vrs}.tar.gz"
    tar_stripcomponents=true
    am_config="--with-python_prefix=${dir_install}"
    export PYTHON_PREFIX=${dir_install}
}

on_editpack(){
    ln -s ${dir_install}/share/pkgconfig/${pkg}.pc ${dir_install_pc}/${pkg}.pc
}

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuild && start

# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# lib/pkgconfig/xcb-proto.pc
# lib/python2.7/site-packages/xcbgen/matcher.pyc
# lib/python2.7/site-packages/xcbgen/state.py
# lib/python2.7/site-packages/xcbgen/align.pyo
# lib/python2.7/site-packages/xcbgen/state.pyo
# lib/python2.7/site-packages/xcbgen/__init__.pyc
# lib/python2.7/site-packages/xcbgen/expr.pyc
# lib/python2.7/site-packages/xcbgen/xtypes.py
# lib/python2.7/site-packages/xcbgen/xtypes.pyo
# lib/python2.7/site-packages/xcbgen/error.py
# lib/python2.7/site-packages/xcbgen/expr.py
# lib/python2.7/site-packages/xcbgen/align.py
# lib/python2.7/site-packages/xcbgen/xtypes.pyc
# lib/python2.7/site-packages/xcbgen/error.pyo
# lib/python2.7/site-packages/xcbgen/matcher.pyo
# lib/python2.7/site-packages/xcbgen/state.pyc
# lib/python2.7/site-packages/xcbgen/expr.pyo
# lib/python2.7/site-packages/xcbgen/__init__.py
# lib/python2.7/site-packages/xcbgen/align.pyc
# lib/python2.7/site-packages/xcbgen/matcher.py
# lib/python2.7/site-packages/xcbgen/error.pyc
# lib/python2.7/site-packages/xcbgen/__init__.pyo
# share/xcb/damage.xml
# share/xcb/sync.xml
# share/xcb/present.xml
# share/xcb/dri3.xml
# share/xcb/dri2.xml
# share/xcb/randr.xml
# share/xcb/xselinux.xml
# share/xcb/composite.xml
# share/xcb/xf86vidmode.xml
# share/xcb/shm.xml
# share/xcb/xf86dri.xml
# share/xcb/xvmc.xml
# share/xcb/xv.xml
# share/xcb/dpms.xml
# share/xcb/res.xml
# share/xcb/ge.xml
# share/xcb/xproto.xml
# share/xcb/glx.xml
# share/xcb/xcb.xsd
# share/xcb/xtest.xml
# share/xcb/record.xml
# share/xcb/xinput.xml
# share/xcb/xc_misc.xml
# share/xcb/bigreq.xml
# share/xcb/screensaver.xml
# share/xcb/xevie.xml
# share/xcb/render.xml
# share/xcb/xkb.xml
# share/xcb/xfixes.xml
# share/xcb/xprint.xml
# share/xcb/shape.xml
# share/xcb/xinerama.xml
