#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='xorgproto'
dsc='X Window System unified protocol definitions   '
lic='GLP-2.0'
src='https://gitlab.freedesktop.org/xorg/proto/xorgproto.git'
cfg='ag'
eta='0'
pkg='xproto'

dev_bra='master'
dev_vrs='2021.5'
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING* AUTHORS'
lst_pc=''

. xbuild

on_editpack(){
    ln -s share/pkgconfig/${pkg}.pc lib/pkgconfig/${pkg}.pc
    ln -s ${dir_install}/share/pkgconfig/${pkg}.pc ${dir_install}/lib/pkgconfig/${pkg}.pc
}

start


# Filelist
# --------
# include/GL/glxmd.h
# include/GL/internal/glcore.h
# include/GL/glxtokens.h
# include/GL/glxint.h
# include/GL/glxproto.h
# include/X11/HPkeysym.h
# include/X11/Xwindows.h
# include/X11/Xatom.h
# include/X11/extensions/panoramiXproto.h
# include/X11/extensions/damagewire.h
# include/X11/extensions/damageproto.h
# include/X11/extensions/applewmconst.h
# include/X11/extensions/dpmsproto.h
# include/X11/extensions/recordstr.h
# include/X11/extensions/multibufproto.h
# include/X11/extensions/shapeconst.h
# include/X11/extensions/XIproto.h
# include/X11/extensions/shmproto.h
# include/X11/extensions/presentproto.h
# include/X11/extensions/lbx.h
# include/X11/extensions/XvMC.h
# include/X11/extensions/ge.h
# include/X11/extensions/bigreqsproto.h
# include/X11/extensions/XKBsrv.h
# include/X11/extensions/Xv.h
# include/X11/extensions/syncstr.h
# include/X11/extensions/XI2.h
# include/X11/extensions/xf86bigfont.h
# include/X11/extensions/xf86dgaconst.h
# include/X11/extensions/XKBstr.h
# include/X11/extensions/dri2proto.h
# include/X11/extensions/xfixesproto.h
# include/X11/extensions/dmxproto.h
# include/X11/extensions/xtestext1const.h
# include/X11/extensions/shm.h
# include/X11/extensions/cup.h
# include/X11/extensions/recordconst.h
# include/X11/extensions/agproto.h
# include/X11/extensions/XI2proto.h
# include/X11/extensions/xf86vm.h
# include/X11/extensions/dri2tokens.h
# include/X11/extensions/xtestext1proto.h
# include/X11/extensions/compositeproto.h
# include/X11/extensions/mitmiscproto.h
# include/X11/extensions/renderproto.h
# include/X11/extensions/xf86bigfproto.h
# include/X11/extensions/randrproto.h
# include/X11/extensions/dbeproto.h
# include/X11/extensions/render.h
# include/X11/extensions/dpmsconst.h
# include/X11/extensions/xf86dga.h
# include/X11/extensions/shapeproto.h
# include/X11/extensions/xcmiscstr.h
# include/X11/extensions/ag.h
# include/X11/extensions/randr.h
# include/X11/extensions/cupproto.h
# include/X11/extensions/syncproto.h
# include/X11/extensions/saverproto.h
# include/X11/extensions/xtestconst.h
# include/X11/extensions/XKBproto.h
# include/X11/extensions/xtestproto.h
# include/X11/extensions/xf86vmstr.h
# include/X11/extensions/EVI.h
# include/X11/extensions/dbe.h
# include/X11/extensions/lbxproto.h
# include/X11/extensions/xf86dga1const.h
# include/X11/extensions/shmstr.h
# include/X11/extensions/securproto.h
# include/X11/extensions/xcmiscproto.h
# include/X11/extensions/secur.h
# include/X11/extensions/multibufconst.h
# include/X11/extensions/EVIproto.h
# include/X11/extensions/xf86dgastr.h
# include/X11/extensions/XKB.h
# include/X11/extensions/presenttokens.h
# include/X11/extensions/applewmproto.h
# include/X11/extensions/recordproto.h
# include/X11/extensions/dmx.h
# include/X11/extensions/composite.h
# include/X11/extensions/XI.h
# include/X11/extensions/xfixeswire.h
# include/X11/extensions/xf86vmproto.h
# include/X11/extensions/xf86dga1proto.h
# include/X11/extensions/XResproto.h
# include/X11/extensions/geproto.h
# include/X11/extensions/xf86dga1str.h
# include/X11/extensions/Xvproto.h
# include/X11/extensions/dri3proto.h
# include/X11/extensions/saver.h
# include/X11/extensions/xf86dgaproto.h
# include/X11/extensions/shapestr.h
# include/X11/extensions/bigreqstr.h
# include/X11/extensions/syncconst.h
# include/X11/extensions/xf86bigfstr.h
# include/X11/extensions/XvMCproto.h
# include/X11/extensions/mitmiscconst.h
# include/X11/Xalloca.h
# include/X11/keysymdef.h
# include/X11/Xarch.h
# include/X11/Xwinsock.h
# include/X11/Xosdefs.h
# include/X11/Xos_r.h
# include/X11/Xfuncs.h
# include/X11/Xthreads.h
# include/X11/Xproto.h
# include/X11/Xfuncproto.h
# include/X11/Sunkeysym.h
# include/X11/dri/xf86dri.h
# include/X11/dri/xf86dristr.h
# include/X11/dri/xf86driproto.h
# include/X11/ap_keysym.h
# include/X11/XWDFile.h
# include/X11/Xpoll.h
# include/X11/fonts/fontstruct.h
# include/X11/fonts/FS.h
# include/X11/fonts/fontproto.h
# include/X11/fonts/font.h
# include/X11/fonts/FSproto.h
# include/X11/fonts/fsmasks.h
# include/X11/Xmd.h
# include/X11/XF86keysym.h
# include/X11/Xdefs.h
# include/X11/X.h
# include/X11/keysym.h
# include/X11/Xw32defs.h
# include/X11/Xprotostr.h
# include/X11/Xos.h
# include/X11/DECkeysym.h
# share/pkgconfig/fontsproto.pc
# share/pkgconfig/xextproto.pc
# share/pkgconfig/recordproto.pc
# share/pkgconfig/scrnsaverproto.pc
# share/pkgconfig/dri2proto.pc
# share/pkgconfig/presentproto.pc
# share/pkgconfig/inputproto.pc
# share/pkgconfig/xcmiscproto.pc
# share/pkgconfig/xf86driproto.pc
# share/pkgconfig/xproto.pc
# share/pkgconfig/dpmsproto.pc
# share/pkgconfig/applewmproto.pc
# share/pkgconfig/resourceproto.pc
# share/pkgconfig/renderproto.pc
# share/pkgconfig/videoproto.pc
# share/pkgconfig/kbproto.pc
# share/pkgconfig/xf86vidmodeproto.pc
# share/pkgconfig/xf86bigfontproto.pc
# share/pkgconfig/compositeproto.pc
# share/pkgconfig/fixesproto.pc
# share/pkgconfig/bigreqsproto.pc
# share/pkgconfig/glproto.pc
# share/pkgconfig/damageproto.pc
# share/pkgconfig/dmxproto.pc
# share/pkgconfig/xineramaproto.pc
# share/pkgconfig/xf86dgaproto.pc
# share/pkgconfig/randrproto.pc
# share/pkgconfig/dri3proto.pc
# share/doc/kbproto/XKBproto-10.svg
# share/doc/kbproto/ch08.xml
# share/doc/kbproto/XKBproto-5.svg
# share/doc/kbproto/ch12.xml
# share/doc/kbproto/acknowledgements.xml
# share/doc/kbproto/appA.xml
# share/doc/kbproto/ch02.xml
# share/doc/kbproto/XKBproto-3.svg
# share/doc/kbproto/XKBproto-9.svg
# share/doc/kbproto/ch01.xml
# share/doc/kbproto/ch09.xml
# share/doc/kbproto/ch10.xml
# share/doc/kbproto/XKBproto-6.svg
# share/doc/kbproto/ch14.xml
# share/doc/kbproto/ch05.xml
# share/doc/kbproto/ch04.xml
# share/doc/kbproto/ch13.xml
# share/doc/kbproto/XKBproto-7.svg
# share/doc/kbproto/XKBproto-4.svg
# share/doc/kbproto/appC.xml
# share/doc/kbproto/XKBproto-2.svg
# share/doc/kbproto/ch06.xml
# share/doc/kbproto/appD.xml
# share/doc/kbproto/ch07.xml
# share/doc/kbproto/ch16.xml
# share/doc/kbproto/xkbproto.xml
# share/doc/kbproto/appB.xml
# share/doc/kbproto/ch11.xml
# share/doc/kbproto/XKBproto-8.svg
# share/doc/kbproto/ch15.xml
# share/doc/kbproto/XKBproto-11.svg
# share/doc/kbproto/XKBproto-1.svg
# share/doc/kbproto/ch03.xml
# share/doc/xproto/glossary.xml
# share/doc/xproto/x11protocol.xml
# share/doc/xproto/sect1-9.xml
# share/doc/xproto/encoding.xml
# share/doc/xproto/keysyms.xml
# share/doc/xorgproto/COPYING-inputproto
# share/doc/xorgproto/COPYING-xcmiscproto
# share/doc/xorgproto/COPYING-evieproto
# share/doc/xorgproto/COPYING-compositeproto
# share/doc/xorgproto/COPYING-xextproto
# share/doc/xorgproto/damageproto.txt
# share/doc/xorgproto/COPYING-glproto
# share/doc/xorgproto/xv-protocol-v2.txt
# share/doc/xorgproto/COPYING-applewmproto
# share/doc/xorgproto/AUTHORS
# share/doc/xorgproto/COPYING-windowswmproto
# share/doc/xorgproto/COPYING-x11proto
# share/doc/xorgproto/COPYING-dri2proto
# share/doc/xorgproto/randrproto.txt
# share/doc/xorgproto/COPYING-renderproto
# share/doc/xorgproto/COPYING-xineramaproto
# share/doc/xorgproto/COPYING-xf86bigfontproto
# share/doc/xorgproto/COPYING-lg3dproto
# share/doc/xorgproto/COPYING-xf86vidmodeproto
# share/doc/xorgproto/COPYING-fontsproto
# share/doc/xorgproto/COPYING-randrproto
# share/doc/xorgproto/COPYING-presentproto
# share/doc/xorgproto/COPYING-xf86dgaproto
# share/doc/xorgproto/COPYING-xf86rushproto
# share/doc/xorgproto/COPYING-damageproto
# share/doc/xorgproto/presentproto.txt
# share/doc/xorgproto/COPYING-dmxproto
# share/doc/xorgproto/COPYING-dri3proto
# share/doc/xorgproto/COPYING-kbproto
# share/doc/xorgproto/COPYING-xf86miscproto
# share/doc/xorgproto/COPYING-bigreqsproto
# share/doc/xorgproto/dri2proto.txt
# share/doc/xorgproto/compositeproto.txt
# share/doc/xorgproto/COPYING-trapproto
# share/doc/xorgproto/dri3proto.txt
# share/doc/xorgproto/resproto.txt
# share/doc/xorgproto/COPYING-videoproto
# share/doc/xorgproto/COPYING-printproto
# share/doc/xorgproto/COPYING-fontcacheproto
# share/doc/xorgproto/PM_spec
# share/doc/xorgproto/COPYING-scrnsaverproto
# share/doc/xorgproto/COPYING-xf86driproto
# share/doc/xorgproto/COPYING-pmproto
# share/doc/xorgproto/COPYING-fixesproto
# share/doc/xorgproto/COPYING-resourceproto
# share/doc/xorgproto/COPYING-recordproto
# share/doc/xorgproto/renderproto.txt
# share/doc/xorgproto/fixesproto.txt
# share/doc/scrnsaverproto/saver.xml
# share/doc/xcmiscproto/xc-misc.xml
# share/doc/fontsproto/fsproto.xml
# share/doc/bigreqsproto/bigreq.xml
# share/doc/xextproto/lbx.xml
# share/doc/xextproto/sync.xml
# share/doc/xextproto/appgrp.xml
# share/doc/xextproto/multibuf.xml
# share/doc/xextproto/dbe.xml
# share/doc/xextproto/evi.xml
# share/doc/xextproto/shm.xml
# share/doc/xextproto/dpms.xml
# share/doc/xextproto/xtest.xml
# share/doc/xextproto/tog-cup.xml
# share/doc/xextproto/geproto.xml
# share/doc/xextproto/security.xml
# share/doc/xextproto/shape.xml
# share/doc/xextproto/appendix.xml
# share/doc/recordproto/record.xml
