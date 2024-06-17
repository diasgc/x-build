#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   .   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='libjack'
dsc='Jack Audio Connection Kit: a low-latency synchronous callback-based media server'
lic='GPL-2.0'
src='https://github.com/jackaudio/jack2.git'
tls='python'

cfg='waf'

on_config(){
  waf_config="--prefix=${dir_install} --doxygen=no"
}


build_clean(){
  do_log 'clean' ${dir_src}/waf distclean
}

build_config(){
  do_log 'config' ${dir_src}/waf configure ${waf_config}
}

on_make(){
  ${dir_src}/waf build ${waf_config}
}

on_install(){
  $dir_src/waf install --prefix=${dir_install}
}

build_make_package(){
  ${dir_src}/waf install --prefix=${1}
}

dev_bra=''
dev_vrs=''
pkg_deb="libjack-dev"
eta='30'

. xbuild && start