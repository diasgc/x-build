cmake_minimum_required(VERSION 3.0)
project(postfish)

find_package(PkgConfig)
pkg_check_modules(_GKT QUIET gtk)

find_library(GTK_LIB NAMES gtk)
find_library(FFTW_LIB NAMES libfftw)
find_library(AO_LIB NAMES libao)
add_definitions("-DUGLY_IEEE754_FLOAT32_HACK=1")
set(src main.c mainpanel.c multibar.c readout.c input.c output.c clippanel.c
	declip.c reconstruct.c multicompand.c windowbutton.c subpanel.c
	feedback.c freq.c eq.c eqpanel.c compandpanel.c subband.c lpc.c
	bessel.c deverbpanel.c deverb.c singlecomp.c singlepanel.c
	limit.c limitpanel.c mute.c mixpanel.c mix.c freeverb.c reverbpanel.c
	outpanel.c config.c window.c follower.c linkage.c)

add_executable(postfish ${src})

if(GTK_LIB_FOUND)
	target_link_executable(postfish PRIVATE GTK_LIB)
endif()
if(FFTW_LIB_FOUND)
	target_link_executable(postfish PRIVATE FFTW_LIB)
endif()
if(AO_LIB_FOUND)
	target_link_executable(postfish PRIVATE AO_LIB)
endif()

install(TARGETS postfish RUNTIME DESTINATION bin)
