#!/bin/bash

lib='libpng'
apt='libpng-dev'
dsc='Portable Network Graphics support'
lic='Other'
src='https://git.code.sf.net/p/libpng/code.git'
vnd='libpng'
cfg='cmake'
dep='zlib'

mki='install/strip'

dev_vrs='1.6.38'
cmake_static="PNG_STATIC"
cmake_shared="PNG_SHARED"
cmake_bin="PNG_EXECUTABLES"
cmake_config="-DPNG_TESTS=OFF -DHAVE_LD_VERSION_SCRIPT=OFF"  # -DPNG_HARDWARE_OPTIMIZATIONS=OFF 

lst_inc='pnglibconf.h png.h pngconf.h libpng16/*.h'
lst_lib='libpng libpng16'
lst_bin='png-fix-itxt libpng16-config pngfix'
lst_lic='LICENSE AUTHORS'
lst_pc='libpng16.pc'

eta='20'

. xbuild

start

# patch 01 on arm/filter_neon.S to fix llvm,_asm issue and allowing hw optimizations
<<'XB64_PATCH'
LS0tIGFybS9maWx0ZXJfbmVvbi5TCTIwMjItMDItMjYgMTk6MjI6MzcuNzU2MTUwNjAwICswMDAwCisrKyBhcm0vZm
lsdGVyX25lb24uUwkyMDIyLTAyLTI2IDE5OjIzOjI4LjkzNjE1MDYwMCArMDAwMApAQCAtMjAsMTAgKzIwLDYgQEAK
IC5zZWN0aW9uIC5ub3RlLkdOVS1zdGFjaywiIiwlcHJvZ2JpdHMgLyogbWFyayBzdGFjayBhcyBub24tZXhlY3V0YW
JsZSAqLwogI2VuZGlmCiAKLSNpZmRlZiBfX2NsYW5nX18KLS5zZWN0aW9uIF9fTExWTSxfX2FzbQotI2VuZGlmCi0K
ICNpZmRlZiBQTkdfUkVBRF9TVVBQT1JURUQKIAogLyogQXNzZW1ibGVyIE5FT04gc3VwcG9ydCAtIG9ubHkgd29ya3
MgZm9yIDMyLWJpdCBBUk0gKGkuZS4gaXQgZG9lcyBub3Qgd29yayBmb3IK
XB64_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/pnglibconf.h
# include/png.h
# include/libpng16/pnglibconf.h
# include/libpng16/png.h
# include/libpng16/pngconf.h
# include/pngconf.h
# lib/libpng.so
# lib/pkgconfig/libpng16.pc
# lib/libpng/libpng16-release.cmake
# lib/libpng/libpng16.cmake
# lib/libpng16.a
# lib/libpng.a
# lib/libpng16.so
# share/man/man5/png.5
# share/man/man3/libpng.3
# share/man/man3/libpngpf.3
# share/doc/libpng/LICENSE
# share/doc/libpng/AUTHORS
# bin/png-fix-itxt
# bin/libpng16-config
# bin/pngfix
