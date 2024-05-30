#!/bin/bash

lib='libpulse'
apt="${lib}-dev"
dsc='PulseAudio Client Interface'
lic='LGPL-2.1'
src='https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git'
cfg='meson'
patch="libpulse-01"
pkg='libpulse'
eta='120'
#API=28 # required pthread_mutexattr_setprotocol

lst_inc='pulse/*.h'
lst_lib='libpulse libpulse-simple libpulse-mainloop-glib pulseaudio/libpulsedsp pulseaudio/libpulsecommon-15.0'
lst_bin='pacat pactl pa-info padsp'
lst_lic='LICENSE GPL LGPL'
lst_pc='libpulse.pc libpulse-simple.pc libpulse-mainloop-glib.pc'

#meson_cfg="-Ddaemon=false -Ddoxygen=false -Dman=false -Dtests=false -Dglib=enabled -Ddatabase=simple -Dconsolekit=disabled -Dtcpwrap=disabled"
patch="libpulse-01"
meson_cfg="-Ddaemon=false -Dclient=false -Ddoxygen=false -Dgcov=false -Dman=false -Dtests=false -Ddatabase=simple" 
patch="libpulse-01"

on_config(){
    $use_clang && LDFLAGS+=" -Wl,--undefined-version"    
}
on_config_ndk(){
    #meson_cfg+=" -Dalsa=disabled -Dx11=disabled -Dgtk=disabled -Dopenssl=disabled -Dgsettings=disabled"
    #LIBS="-landroid-glob -landroid-execinfo"
    LDFLAGS+=" -landroid-glob -landroid-execinfo"
    CFLAGS+=' -D__ANDROID__'
    #CPPFLAGS+=' -Wl,-Bstatic'
}

LDFLAGS+=" -liconv"

# cannot compile static libs

meson_cfg+=' -Dalsa=disabled
-Dasyncns=disabled
-Davahi=disabled
-Dbluez5=disabled
-Dbluez5-gstreamer=disabled
-Dbluez5-native-headset=false
-Dbluez5-ofono-headset=false
-Dconsolekit=disabled
-Ddbus=disabled
-Delogind=disabled
-Dfftw=disabled
-Dglib=disabled
-Dgsettings=disabled
-Dgstreamer=disabled
-Dgtk=disabled
-Dhal-compat=false
-Dipv6=false
-Djack=disabled
-Dlirc=disabled
-Dopenssl=disabled
-Dorc=disabled
-Doss-output=disabled
-Dsamplerate=disabled
-Dsoxr=disabled
-Dspeex=disabled
-Dsystemd=disabled
-Dtcpwrap=disabled
-Dudev=disabled
-Dvalgrind=disabled
-Dx11=disabled
-Denable-smoother-2=false'

on_config_arm(){
    meson_cfg+=" -Datomic-arm-linux-helpers=true -Datomic-arm-memory-barrier=true" 
}
on_editpack(){
    rm -rf share/locale
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK -++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/pulse/operation.h
# include/pulse/scache.h
# include/pulse/error.h
# include/pulse/subscribe.h
# include/pulse/introspect.h
# include/pulse/cdecl.h
# include/pulse/mainloop-signal.h
# include/pulse/xmalloc.h
# include/pulse/channelmap.h
# include/pulse/glib-mainloop.h
# include/pulse/pulseaudio.h
# include/pulse/direction.h
# include/pulse/mainloop-api.h
# include/pulse/ext-device-manager.h
# include/pulse/sample.h
# include/pulse/format.h
# include/pulse/thread-mainloop.h
# include/pulse/context.h
# include/pulse/gccmacro.h
# include/pulse/timeval.h
# include/pulse/version.h
# include/pulse/ext-stream-restore.h
# include/pulse/stream.h
# include/pulse/mainloop.h
# include/pulse/volume.h
# include/pulse/simple.h
# include/pulse/def.h
# include/pulse/utf8.h
# include/pulse/ext-device-restore.h
# include/pulse/proplist.h
# include/pulse/rtclock.h
# include/pulse/util.h
# etc/pulse/client.conf
# lib/pkgconfig/libpulse-mainloop-glib.pc
# lib/pkgconfig/libpulse-simple.pc
# lib/pkgconfig/libpulse.pc
# lib/pulseaudio/libpulsedsp.so
# lib/pulseaudio/libpulsecommon-15.0.so
# lib/libpulse-simple.so
# lib/cmake/PulseAudio/PulseAudioConfig.cmake
# lib/cmake/PulseAudio/PulseAudioConfigVersion.cmake
# lib/libpulse-mainloop-glib.so
# lib/libpulse.so
# share/vala/vapi/libpulse-simple.vapi
# share/vala/vapi/libpulse-simple.deps
# share/vala/vapi/libpulse.deps
# share/vala/vapi/libpulse-mainloop-glib.vapi
# share/vala/vapi/libpulse-mainloop-glib.deps
# share/vala/vapi/libpulse.vapi
# share/doc/libpulse/LGPL
# share/doc/libpulse/LICENSE
# share/doc/libpulse/GPL
# share/bash-completion/completions/pactl
# bin/pacat
# bin/pactl
# bin/pa-info
# bin/padsp
