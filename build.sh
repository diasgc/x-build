#!/bin/bash

[ "${1}" == "--debug" ] && shift && set -x

archs=
sh=$1 && shift
args=
while test ${#} -gt 0; do
    case $1 in
        android-all) archs="aarch64-linux-android arm-linux-androideabi i686-linux-android x86_64-linux-android";;
        linux-all) archs="aarch64-linux-gnu arm-linux-gnuhfeabi i686-linux-gnu x86_64-linux-gnu";;
        windows-all) archs="aarch64-w64-mingw32 armv7-w64-mingw32 i686-w64-mingw32 x86_64-w64-mingw32";;
        all) archs="aarch64-linux-android arm-linux-androideabi i686-linux-android x86_64-linux-android i686-linux-gnu x86_64-linux-gnu aarch64-w64-mingw32 armv7-w64-mingw32 i686-w64-mingw32 x86_64-w64-mingw32";;
        *-android*|*-linux-gnu*|*-mingw32) archs="$archs $1";;
        --*) args="$args $1";;
    esac
    shift
done

unset opts
for arch in $archs; do
    ./${sh}.sh ${arch} ${args} ${opts}
    opts="--nobanner"
done
echo -e "\n${CG0}  ::Done${C0}\n\n"