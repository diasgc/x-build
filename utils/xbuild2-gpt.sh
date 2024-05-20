#!/bin/bash

# usage: wget_pkg_termux <lib-name> <aarch64|arm|i686|x86_64> <dst-dir>
wget_pkg_termux(){
  [ -z "$1" ] || [ -z "$2" ] || [ ! -d "$3" ] && return 1
  echo -ne "searching for ${1}"
  local rname=$(wget -qO- http://termux.net/dists/stable/main/binary-${2}/ | grep -o ${1}_.*\.${2}\.deb\" | tail -n1)
  [ -z "${rname}" ] && echo -e " not found: aborting" && return 1
  rname=${rname:0:-1}
  echo -ne ":found $rname"
  local od=$(pwd); cd ${3}
  [ -d "tmp" ] && rm -rf tmp
  mkdir -p tmp && cd tmp
  local url="http://termux.net/dists/stable/main/binary-${2}/${rname}"
  echo -ne " >download"
  wget -q $url
  [ ! -f "$rname" ] && echo -e ":fail to download $url\n" && return 1
  echo -ne " >extract"
  ar -x $rname && tar -x -f data.tar.xz
  echo -ne " >fix paths"
  sed -i "s;/data/data/com.termux/files/usr;${3};g" data/data/com.termux/files/usr/lib/pkgconfig/*.pc 2>/dev/null
  cp -rf data/data/com.termux/files/usr/* ..
  cd .. && rm -rf tmp
  echo -e " :done"
  cd $od
  return 0
}

loadToolchain(){
  CMAKE_EXECUTABLE=cmake
  YASM=yasm
  PKG_CONFIG=pkg-config

  CPPFLAGS+=" -I${dir_install_include}"
  LDFLAGS="-L${dir_install_lib}"
  cmake_system_processor="${target_trip[0]}${target_trip[1]}"

  if $host_cross; then
    case $PLATFORM in
      Android) toolchain_android;;
      Windows) toolchain_llvm_mingw;;
      Linux)   toolchain_linux;;
    esac
  else
    TOOLCHAIN=/usr/bin
    SYSROOT=/usr
    if $use_clang; then
      CROSS_PREFIX=llvm-
      CC=clang CXX=clang++ AS=${CC} LD=ld.lld
      $host_native && CPPFLAGS="-mtune=native ${CPPFLAGS}"
    else
      CROSS_PREFIX=
      CC=gcc CXX=g++ AS=as LD=ld
      $host_native && CPPFLAGS="-march=native ${CPPFLAGS}"
    fi
  fi

  AR=${CROSS_PREFIX}ar
  NM=${CROSS_PREFIX}nm
  ADDR2LINE=${CROSS_PREFIX}addr2line
  OBJCOPY=${CROSS_PREFIX}objcopy
  OBJDUMP=${CROSS_PREFIX}objdump
  RANLIB=${CROSS_PREFIX}ranlib
  READELF=${CROSS_PREFIX}readelf
  SIZE=${CROSS_PREFIX}size
  STRINGS=${CROSS_PREFIX}strings
  STRIP=${CROSS_PREFIX}strip
  WINDRES=${CROSS_PREFIX}windres
  [ -z ${GCOV+x} ] && GCOV=${CROSS_PREFIX}gcov

  export CMAKE_EXECUTABLE YASM PKG_CONFIG API \
    PLATFORM TOOLCHAIN SYSROOT CC CXX LD AS \
    ADDR2LINE AR NM OBJCOPY OBJDUMP RANLIB \
    READELF SIZE STRINGS STRIP WINDRES \
    CROSS_PREFIX LT_SYS_LIBRARY_PATH CPPFLAGS LDFLAGS
}

wget_tarxx(){
  local tag="get"
  local args=
  echo -ne "${tag}"
  echo "$(date): $@" >> "${log_file}"

  if [ -z "${sty}" ]; then
    case $src in
      *.tar.lz) args='--lzip -xv';;
      *.tar.gz|*.tgz) args="-xvz";;
      *.tar.xz) args="-xvJ";;
      *.tar.bz2) args="-xvj";;
    esac
  else
    case $sty in
      tgz) args="-xvz";;
      txz) args="-xvJ";;
      tbz|tbz2) args="-xvj";;
      tlz) args="--lzip -xv";;
    esac
  fi

  test -z "$args" && doErr "unknown compressed file format for $(basename ${src})"

  [ -d "tmp" ] && rm -rf tmp
  mkdir tmp
  wget -qO- $1 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' $args -C tmp >/dev/null 2>&1 || err
  cd tmp
  local nf=(*)
  if [ ${#nf[@]} -gt 2 ]; then
    [ -d "../${2}" ] && rm -rf "../${2}"
    mkdir ../${2}
    mv * ../${2}
  else
    mv * $2 && mv $2 ..
  fi
  cd ..
  rm -rf tmp
  logok $tag
}

wget_targz(){
  pushd $(dirname $2)
  wget -qO- $1 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz -C $2 >/dev/null 2>&1 || err
  popd
}

main(){
  if [ -z "${lib}" ]; then
    echo -e "\n\n  Toolchain is loaded.\n  Now exiting...\n\n"
    return 0
  fi

  inc_tab

  if [ -z "${lic}" ] || [ -z "${dsc}" ]; then
    gitjson=$(git_api_tojson $src)
    if [ -n "${gitjson}" ]; then
      : "${lic:=$(echo "$gitjson" | jq .licence)}"
      : "${dsc:=$(echo "$gitjson" | jq .description)}"
    fi
  fi

  export log_file="${dir_install}/${lib}.log"

  if [ -z "$(check_install pc)" ]; then
    package_showinfo
  elif $update || $retry; then
    package_showinfo
  else
    end_script    
  fi
}

main
