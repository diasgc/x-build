#!/bin/bash
# ................................................
# unpack util 1.0 2021-diasgc
# ................................................

# def colors
C0="\e[0m" CW="\e[97m" CD="\e[90m"
CR0="\e[31m" CR1="\e[91m"
CG0="\e[32m" CG1="\e[92m"
CY0="\e[33m" CY1="\e[93m"
CB0="\e[34m" CB1="\e[94m"
CM0="\e[35m" CM1="\e[95m"
CC0="\e[36m" CC1="\e[96m"

vsh="1.0"
#b="\u25ba"
b="\u2605"
c="\u2714"
p="  "

xc_unpack_subdir=false

# Banner
echo -ne "\n\n${p}${CW}X-Unpack Utility${vsh} for Linux${C0}\n${p}"
[ -n $(which lsb_release) ] && echo -ne "$(lsb_release -sd) "
if [ -n "$(uname -r | grep 'microsoft')" ];then
  echo -ne "WSL2 "
elif [ -n "$(uname -r | grep 'Microsoft')" ];then
  echo -ne "WSL "
fi
echo -e "$(uname -o) $(uname -m) ${C0} $(uname -r)"

if [ -z "$1" ];then
  echo -e "\n\n${CC1}${p}usage: ./xunpack.sh <arch> <libs...>${C0}\n\n"
  exit 1
fi


case $1 in
    aa64|aa8|a*64-*android|android )
      arch=aarch64-linux-android
      LIBSDIR=$(pwd)/builds/android/arm64-v8a
      ;;
    aa7|arm-*android*eabi|arm-android)
      arch=arm-linux-androideabi
      LIBSDIR=$(pwd)/builds/android/armeabi-v7a
      ;;
    a86|*86-*android)
      arch=i686-linux-android
      LIBSDIR=$(pwd)/builds/android/x86
      ;;
    a64|*64-*android)
      arch=x86_64-linux-android
      LIBSDIR=$(pwd)/builds/android/x86_64
      ;;
    la8|la64|a*64-linux|a*64-linux-gnu|rpi*64|rpi3b*)
      arch=aarch64-linux-gnu
      LIBSDIR=$(pwd)/builds/arm/aarch64
      ;;
    la7|lahf|arm*hf|arm-linux*|rpi*32|rpi2*)
      arch=arm-linux-gnueabihf
      LIBSDIR=$(pwd)/builds/arm/armeabihf
      ;;
    l86|*86-linux*|linux*32 )
      arch=i686-linux-gnu
      LIBSDIR=$(pwd)/builds/linux/i686
      ;;
    l64|*64-linux*|linux*64|linux )
      arch=x86_64-linux-gnu
      LIBSDIR=$(pwd)/builds/linux/x86_64
      ;;
    w64|*64-win*|*64-*mingw*|windows|win|w*64)
      arch=x86_64-w64-mingw32
      LIBSDIR=$(pwd)/builds/windows/x86_64
      ;;
    w86|*86-win*|*86-*mingw*|w*32)
      arch=i686-w64-mingw32
      LIBSDIR=$(pwd)/builds/windows/i686
      ;;
esac
shift

mkdir -p $LIBSDIR
xc_pkg_dir=$(pwd)/packages
pushd $LIBSDIR  >/dev/null
p="    "
echo
while [ -n "$1" ];do
    printf "${p}${CC0}%-10s" ${1}
    if $xc_unpack_subdir; then
        mkdir ${1}
        pushd ${1} >/dev/null
    fi
    count=$(gzip -cd ${xc_pkg_dir}/${1}*${arch}.tar.gz | tar -tvv | grep -c ^-)
    tar -xf ${xc_pkg_dir}/${1}*${arch}.tar.gz >/dev/null 2>&1
    echo -e " ${CC0}${c}${C0} ${count} files"
    $xc_unpack_subdir && popd >/dev/null
shift
done
popd >/dev/null
p="  "
echo -e "\n${p}::Done\n"
