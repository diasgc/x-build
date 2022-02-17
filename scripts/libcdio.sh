#!/bin/bash

#vrs='2.1.0'
lib='libcdio'
apt='libcdio-dev'
dsc='Portable CD-ROM I/O library'
lic='GPL-3.0'
src='git://git.sv.gnu.org/libcdio.git'
sty='git'
cfg='ac'
dep='libiconv'
eta='10'
eta='80'
#cbk="example-progs"

mkc='distclean'
CFG="MAKE=make --enable-maintainer-mode"

lst_inc='cdio++/*.hpp cdio/*.h'
lst_lib='libiso9660++ libiso9660 libcdio++ libcdio libudf'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='libiso9660.pc libiso9660++.pc libcdio.pc libcdio++.pc libudf.pc'

. xbuilder.sh

WFLAGS="-Wno-header-guard"

source_patch(){
  sed -i 's|$(LIBCDIOPP_LIBS) $(LTLIBICONV)|$(LIBCDIOPP_LIBS) $(LIBCDIO_LIBS) $(LTLIBICONV)|g' ./example/C++/OO/Makefile.in
  doAutoreconf .
}

before_make(){
  #no docs, no bins, no help2man
  sed -i 's/^SUBDIRS = doc include lib src test example/SUBDIRS = include lib/' Makefile
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/cdio++/read.hpp
# include/cdio++/devices.hpp
# include/cdio++/device.hpp
# include/cdio++/mmc.hpp
# include/cdio++/disc.hpp
# include/cdio++/iso9660.hpp
# include/cdio++/enum.hpp
# include/cdio++/cdio.hpp
# include/cdio++/cdtext.hpp
# include/cdio++/track.hpp
# include/cdio/cdio_config.h
# include/cdio/mmc_cmds.h
# include/cdio/logging.h
# include/cdio/cdtext.h
# include/cdio/bytesex.h
# include/cdio/track.h
# include/cdio/memory.h
# include/cdio/udf_file.h
# include/cdio/xa.h
# include/cdio/audio.h
# include/cdio/bytesex_asm.h
# include/cdio/cd_types.h
# include/cdio/types.h
# include/cdio/dvd.h
# include/cdio/ecma_167.h
# include/cdio/udf.h
# include/cdio/rock.h
# include/cdio/sector.h
# include/cdio/cdio.h
# include/cdio/mmc_hl_cmds.h
# include/cdio/iso9660.h
# include/cdio/mmc_ll_cmds.h
# include/cdio/read.h
# include/cdio/version.h
# include/cdio/posix.h
# include/cdio/mmc_util.h
# include/cdio/udf_time.h
# include/cdio/device.h
# include/cdio/utf8.h
# include/cdio/ds.h
# include/cdio/mmc.h
# include/cdio/disc.h
# include/cdio/util.h
# lib/pkgconfig/libudf.pc
# lib/pkgconfig/libiso9660.pc
# lib/pkgconfig/libcdio++.pc
# lib/pkgconfig/libiso9660++.pc
# lib/pkgconfig/libcdio.pc
# lib/libiso9660++.la
# lib/libudf.so
# lib/libcdio++.a
# lib/libcdio.a
# lib/libcdio++.so
# lib/libiso9660.a
# lib/libiso9660.so
# lib/libiso9660++.so
# lib/libudf.a
# lib/libcdio.la
# lib/libiso9660.la
# lib/libcdio.so
# lib/libiso9660++.a
# lib/libcdio++.la
# lib/libudf.la
# share/doc/libcdio/AUTHORS
# share/doc/libcdio/COPYING
