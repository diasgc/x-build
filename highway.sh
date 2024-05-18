#!/bin/bash

lib='highway'
pkg='libhwy'
dsc='Performance-portable, length-agnostic SIMD with runtime dispatch'
lic='Apache2.0'
src='https://github.com/google/highway.git'
cfg='cmake'
eta='10'

cmake_static='BUILD_STATIC_LIBS'
cmake_config="-DBUILD_GMOCK=OFF -DBUILD_TESTING=OFF -DHWY_EXAMPLES_TESTS_INSTALL=ON"

dev_bra='master'
dev_vrs='1.1.0'
stb_bra=''
stb_vrs=''

lst_inc='hwy/*.h hwy/tests/*.h hwy/contrib/*.h hwy/*.h hwy/ops/*.h'
lst_lib='libhwy libhwy_test libhwy_contrib'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='libhwy.pc libhwy-test.pc libhwy-contrib.pc'

. xbuild && start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/hwy/nanobenchmark.h
# include/hwy/detect_targets.h
# include/hwy/detect_compiler_arch.h
# include/hwy/tests/test_util-inl.h
# include/hwy/tests/include_farm_sve.h
# include/hwy/tests/hwy_gtest.h
# include/hwy/tests/test_util.h
# include/hwy/contrib/sort/sort-inl.h
# include/hwy/contrib/image/image.h
# include/hwy/contrib/math/math-inl.h
# include/hwy/contrib/dot/dot-inl.h
# include/hwy/highway.h
# include/hwy/targets.h
# include/hwy/highway_export.h
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
# lib/libhwy_test.so
# lib/libhwy_test.a
# lib/pkgconfig/libhwy-test.pc
# lib/pkgconfig/libhwy.pc
# lib/pkgconfig/libhwy-contrib.pc
# lib/libhwy_contrib.so
# lib/libhwy_contrib.a
# lib/libhwy.so
# lib/libhwy.a
# share/doc/highway/LICENSE
