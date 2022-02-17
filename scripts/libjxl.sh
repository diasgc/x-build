#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++  F  ... +++ CLANG
# GNU  F  ... ... ... GCC
# WIN  F  ... ... ... CLANG/GCC

lvr='0.7.0'
lib='libjxl'
dsc='A fast, compressed, persistent binary data store library for C.'
lic='BSD-3c'
src='https://github.com/libjxl/libjxl.git'
sub='submodule update --init --recursive --depth 1 --recommend-shallow'
cfg='cmake'
eta='164'
dep='highway openexr gflags lcms2'
cmake_static='JPEGXL_STATIC'
cmake_config="-DBUILD_TESTING=OFF -DJPEGXL_ENABLE_BENCHMARK=OFF -DJPEGXL_ENABLE_EXAMPLES=OFF -DJPEGXL_ENABLE_MANPAGES=OFF"
API=28

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE PATENTS AUTHORS'
lst_pc=''

. xbuilder.sh




start

# errors:
# arm-android: clang++: error: unsupported option '-mfloat-abi=hard' for target 'thumbv7-none-linux-android28' (ac_strategy.cc)
# aarch64-w64: ld.lld: error: undefined symbol: clock_gettime

# CMAKE OPTIONS
# -DJPEGXL_ENABLE_BENCHMARK          ON
# -DJPEGXL_ENABLE_COVERAGE           OFF
# -DJPEGXL_ENABLE_DEVTOOLS           OFF
# -DJPEGXL_ENABLE_EXAMPLES           ON
# -DJPEGXL_ENABLE_FUZZERS            OFF
# -DJPEGXL_ENABLE_JNI                ON
# -DJPEGXL_ENABLE_MANPAGES           ON
# -DJPEGXL_ENABLE_OPENEXR            ON
# -DJPEGXL_ENABLE_PLUGINS            OFF
# -DJPEGXL_ENABLE_PROFILER           OFF
# -DJPEGXL_ENABLE_SJPEG              ON
# -DJPEGXL_ENABLE_SKCMS              ON
# -DJPEGXL_ENABLE_TCMALLOC           OFF
# -DJPEGXL_ENABLE_TOOLS              ON
# -DJPEGXL_ENABLE_TRANSCODE_JPEG     ON
# -DJPEGXL_ENABLE_VIEWERS            OFF
# -DJPEGXL_FORCE_NEON                OFF
# -DJPEGXL_FORCE_SYSTEM_BROTLI       OFF
# -DJPEGXL_FORCE_SYSTEM_GTEST        OFF
# -DJPEGXL_FORCE_SYSTEM_HWY          OFF
# -DJPEGXL_STATIC                    OFF
# -DGXL_WARNINGS_AS_ERRORS           OFF
# -DSJPEG_BUILD_EXAMPLES             OFF
# -DSJPEG_ENABLE_SIMD                ON


# Filelist
# --------
# include/jxl/resizable_parallel_runner_cxx.h
# include/jxl/resizable_parallel_runner.h
# include/jxl/parallel_runner.h
# include/jxl/color_encoding.h
# include/jxl/cms_interface.h
# include/jxl/butteraugli_cxx.h
# include/jxl/jxl_threads_export.h
# include/jxl/butteraugli.h
# include/jxl/types.h
# include/jxl/decode.h
# include/jxl/jxl_export.h
# include/jxl/thread_parallel_runner_cxx.h
# include/jxl/codestream_header.h
# include/jxl/decode_cxx.h
# include/jxl/memory_manager.h
# include/jxl/encode_cxx.h
# include/jxl/encode.h
# include/jxl/thread_parallel_runner.h
# include/hwy/nanobenchmark.h
# include/hwy/detect_targets.h
# include/hwy/detect_compiler_arch.h
# include/hwy/tests/test_util-inl.h
# include/hwy/tests/hwy_gtest.h
# include/hwy/tests/test_util.h
# include/hwy/contrib/sort/sort-inl.h
# include/hwy/contrib/image/image.h
# include/hwy/contrib/math/math-inl.h
# include/hwy/contrib/dot/dot-inl.h
# include/hwy/highway.h
# include/hwy/targets.h
# include/hwy/base.h
# include/hwy/aligned_allocator.h
# include/hwy/ops/x86_512-inl.h
# include/hwy/ops/arm_sve-inl.h
# include/hwy/ops/generic_ops-inl.h
# include/hwy/ops/arm_neon-inl.h
# include/hwy/ops/shared-inl.h
# include/hwy/ops/x86_128-inl.h
# include/hwy/ops/wasm_128-inl.h
# include/hwy/ops/x86_256-inl.h
# include/hwy/ops/set_macros-inl.h
# include/hwy/ops/scalar-inl.h
# include/hwy/cache_control.h
# include/hwy/foreach_target.h
# lib/pkgconfig/libhwy-test.pc
# lib/pkgconfig/libjxl_threads.pc
# lib/pkgconfig/libhwy.pc
# lib/pkgconfig/libjxl.pc
# lib/pkgconfig/libhwy-contrib.pc
# lib/libhwy_test.a
# lib/libjxl.a
# lib/libhwy.a
# lib/libjxl_threads.a
# lib/libjxl_dec.a
# lib/libhwy_contrib.a
# lib/libjxl.so
# lib/libjxl_threads.so
# share/doc/libjxl/PATENTS
# share/doc/libjxl/LICENSE
# share/doc/libjxl/AUTHORS
# bin/djxl_ng
# bin/cjpeg_hdr
# bin/cjxl_ng
# bin/cjxl
# bin/djxl
