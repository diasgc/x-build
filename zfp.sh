#!/bin/bash

#vrs='0.5.0'
lib='zfp'
dsc='Compressed numerical arrays that support high-speed random access'
lic='BSD-3c'
src='https://github.com/LLNL/zfp.git'
cfg='cmake'
eta='190'

cmake_config="-DBUILD_TESTING=OFF -DBUILD_GMOCK=OFF"

pc_url='http://oldhome.schmorp.de/marc/liblzf.html'
pc_llib='-llzf'

lst_inc='zfp*.h zfp/*.h zfpcpp.h ieeecodec.h'
lst_lib='libzfp'
lst_bin='zfp'
lst_lic='LICENSE'
lst_pc='zfp.pc'

dualbuild_support=false

. xbuilder.sh

start

# Filelist
# --------
# include/zfpcarray3.h
# include/zfparray.h
# include/zfpcarray2.h
# include/zfparray2.h
# include/zfpcarray1.h
# include/bitstream.h
# include/zfparray1.h
# include/zfp/exception.h
# include/zfp/genheader.h
# include/zfp/pointer2.h
# include/zfp/view2.h
# include/zfp/handle2.h
# include/zfp/view3.h
# include/zfp/cache.h
# include/zfp/store3.h
# include/zfp/iterator1.h
# include/zfp/cache4.h
# include/zfp/iterator2.h
# include/zfp/memory.h
# include/zfp/cache2.h
# include/zfp/view4.h
# include/zfp/zfpheader.h
# include/zfp/types.h
# include/zfp/store2.h
# include/zfp/traits.h
# include/zfp/handle4.h
# include/zfp/reference1.h
# include/zfp/store1.h
# include/zfp/store.h
# include/zfp/pointer4.h
# include/zfp/iterator4.h
# include/zfp/handle3.h
# include/zfp/reference4.h
# include/zfp/cache1.h
# include/zfp/version.h
# include/zfp/pointer1.h
# include/zfp/cache3.h
# include/zfp/pointer3.h
# include/zfp/reference2.h
# include/zfp/view1.h
# include/zfp/reference3.h
# include/zfp/store4.h
# include/zfp/header.h
# include/zfp/macros.h
# include/zfp/iterator3.h
# include/zfp/handle1.h
# include/zfp/system.h
# include/zfpcpp.h
# include/zfpcarray4.h
# include/zfpindex.h
# include/zfparray3.h
# include/zfpcodec.h
# include/zfparray4.h
# include/zfpfactory.h
# include/zfp.h
# include/gencodec.h
# lib/pkgconfig/zfp.pc
# lib/cmake/zfp/zfp-targets-release.cmake
# lib/cmake/zfp/zfp-targets.cmake
# lib/cmake/zfp/zfp-config-version.cmake
# lib/cmake/zfp/zfp-config.cmake
# lib/libzfp.so
# share/doc/zfp/LICENSE
# bin/zfp
