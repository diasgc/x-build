#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='aria2'
dsc='The ultra fast download utility'
lic='GLP-2.0'
src='https://github.com/aria2/aria2.git'
url='https://aria2.github.io/'
dep='openssl expat libssh2 sqlite3 libcares'

cfg='ar'

on_config(){
    if ${src_rel}; then
        vrs="$(github_latest_release aria2/aria2)"
        src="https://github.com/nkoriyama/aribb24/archive/refs/tags/release-${vrs}.tar.gz"
    fi
}

dev_bra='main'
dev_vrs=''
eta='600'
pkg_deb='libaria2-0-dev'

lst_inc=''
lst_lib=''
lst_bin='aria2c'
lst_lic='COPYING AUTHORS'
lst_pc=''

. xbuild && start

# Filelist
# --------
# share/man/man1/aria2c.1
# share/man/ru/man1/aria2c.1
# share/man/pt/man1/aria2c.1
# share/doc/aria2/xmlrpc/aria2rpc
# share/doc/aria2/xmlrpc/README.txt
# share/doc/aria2/xmlrpc/aria2mon
# share/doc/aria2/AUTHORS
# share/doc/aria2/README.html
# share/doc/aria2/bash_completion/README.txt
# share/doc/aria2/bash_completion/aria2c
# share/doc/aria2/COPYING
# share/doc/aria2/README
# share/doc/aria2/README.rst
# bin/aria2c
