#!/bin/bash

lib='libpulse'
apt="${lib}-dev"
dsc='PulseAudio Client Interface'
lic='LGPL-2.1'
vrs='15.0'
src='https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git'
cfg='meson'
dep='glib2 libtool' # fftwf samplerate soxr speex sndfile
pkg='libpulse'
eta='120'
API=28 # required pthread_mutexattr_setprotocol

lst_inc='pulse/*.h'
lst_lib='libpulse libpulse-simple libpulse-mainloop-glib pulseaudio/libpulsedsp pulseaudio/libpulsecommon-15.0'
lst_bin='pacat pactl pa-info padsp'
lst_lic='LICENSE GPL LGPL'
lst_pc='libpulse.pc libpulse-simple.pc libpulse-mainloop-glib.pc'

. xbuilder.sh

meson_cfg="-Ddaemon=false -Ddoxygen=false -Dman=false -Dtests=false -Ddatabase=simple -Dalsa=disabled -Dglib=enabled \
    -D stream-restore-clear-old-devices=true \
    -D zshcompletiondir=no \
    -D asyncns=disabled \
    -D avahi=disabled \
    -D bluez5=disabled \
    -D bluez5-gstreamer=disabled \
    -D bluez5-native-headset=false \
    -D bluez5-ofono-headset=false \
    -D fftw=disabled \
    -D elogind=disabled \
    -D gsettings=disabled \
    -D gstreamer=disabled \
    -D gtk=disabled \
    -D ipv6=false \
    -D jack=disabled \
    -D lirc=disabled \
    -D openssl=disabled \
    -D orc=disabled \
    -D samplerate=disabled \
    -D soxr=disabled \
    -D tcpwrap=disabled \
    -D valgrind=disabled \
    -D x11=disabled \
    -D adrian-aec=false \
    -D webrtc-aec=disabled"

$host_arm && CFG+=" -Datomic-arm-linux-helpers=true"
$host_ndk && CFLAGS='-D__ANDROID__'

on_editpack(){
    rm -rf share/locale
}

start

# patch 01 src/utils/padsp.c to resolve android stat64 issue
<<'XB64_PATCH'
LS0tIHNyYy91dGlscy9wYWRzcC5fCTIwMjItMDEtMzAgMTc6Mzc6MDguMzM5MDAwMDAwICswMDAw
CisrKyBzcmMvdXRpbHMvcGFkc3AuYwkyMDIyLTAxLTMwIDE3OjQyOjA4Ljk5NDA1ODUwMCArMDAw
MApAQCAtMjUzNiw3ICsyNTM2LDcgQEAKIH0KICNpZmRlZiBIQVZFX09QRU42NAogI3VuZGVmIHN0
YXQ2NAotI2lmZGVmIF9fR0xJQkNfXworI2lmIGRlZmluZWQgX19HTElCQ19fIHx8IGRlZmluZWQg
X19BTkRST0lEX18KIGludCBzdGF0NjQoY29uc3QgY2hhciAqcGF0aG5hbWUsIHN0cnVjdCBzdGF0
NjQgKmJ1ZikgewogI2Vsc2UKIGludCBzdGF0NjQoY29uc3QgY2hhciAqcGF0aG5hbWUsIHN0cnVj
dCBzdGF0ICpidWYpIHsK
XB64_PATCH

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
