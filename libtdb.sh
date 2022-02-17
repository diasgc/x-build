#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libtdb'
dsc=''
lic='GLP-2.0'
src='https://gitlab.com/samba-team/devel/samba.git'
bra='tdb-1.4.6'
cfg='other'
cfg_cmd='./configure'
eta='0'

dev_bra='main'
dev_vrs=''
stb_bra=''
stb_vrs=''

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc=''

eta='20'

. xbuilder.sh

cfg_cmd+=" --prefix=${dir_install} --disable-python --without-ad-dc"

if $host_cross; then
    cat <<-EOF >${dir_src}/cross-answers.txt
		Checking uname sysname type: "${PLATFORM}"
		Checking uname machine type: "${arch}"
		Checking uname release type: "dontcare"
		Checking uname version type: "dontcare"
		Checking simple C program: "hello world"
		rpath library support: OK
		-Wl,--version-script support: NO
		Checking getconf LFS_CFLAGS: NO
		Checking for large file support without additional flags: OK
		Checking for -D_FILE_OFFSET_BITS=64: OK
		Checking for -D_LARGE_FILES: OK
		Checking correct behavior of strtoll: NO
		Checking for working strptime: NO
		Checking for C99 vsnprintf: OK
		Checking for HAVE_SHARED_MMAP: OK
		Checking for HAVE_MREMAP: OK
		Checking for HAVE_INCOHERENT_MMAP: NO
		Checking for HAVE_SECURE_MKSTEMP: OK
		EOF
    cfg_cmd+=" --cross-compile --cross-answers cross-answers.txt --host=${arch} "
fi

start