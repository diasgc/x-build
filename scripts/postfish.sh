#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  F   .   .   .   F   .   .   .   .   .   .  static
#  .   .   .   .   .   .   .   .   .   .   .  shared
#  .   .   .   .   .   .   .   .   .   .   .  bin

lib='postfish'
dsc='A digital audio post-processing, restoration, filtering and mixdown tool.'
lic='GPL-2'
src='https://gitlab.xiph.org/xiph/postfish.git'
cfg='mk'
dep='libao fftw'
pkg='postfish'
eta='60'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING'
lst_pc=''

. xbuilder.sh

_source_patch(){
  sed -i 's|gtk+-2.0 ao|gtk+-2.0 ao fftw|' Makefile
}

<<'XB_CREATE_CMAKELISTS'
cmake_minimum_required(VERSION 3.0)
project(postfish)

find_package(PkgConfig)
pkg_check_modules(_GKT QUIET gtk)

find_library(GTK_LIB NAMES gtk)

find_library(AO_LIB NAMES )
add_definitions("-DUGLY_IEEE754_FLOAT32_HACK=1")
set(src main.c mainpanel.c multibar.c readout.c input.c output.c clippanel.c
	declip.c reconstruct.c multicompand.c windowbutton.c subpanel.c
	feedback.c freq.c eq.c eqpanel.c compandpanel.c subband.c lpc.c
	bessel.c deverbpanel.c deverb.c singlecomp.c singlepanel.c
	limit.c limitpanel.c mute.c mixpanel.c mix.c freeverb.c reverbpanel.c
	outpanel.c config.c window.c follower.c linkage.c)

add_executalbe(postfish ${src})
install(TARGET postfish bin)
XB_CREATE_CMAKELISTS
start