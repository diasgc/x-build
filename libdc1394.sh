#!/bin/bash

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdc1394'

dsc='IIDC Camera Control Library'
lic='LGPL-2.1'
git='https://git.code.sf.net/p/libdc1394/code'
pkg='libdc1394-2'
cfg='cmake'

cmake_file='libdc1394'

dev_bra='master'
dev_vrs='2.2.7'
pkg_deb='libdc1394-dev'
eta='60'

on_src_release(){
    vrs="$(sourceforge_json ${lib} | jq -r .release.filename)"
    src="https://sourceforge.net/projects/${lib}/files/${vrs}"
    vrs=$(grep -oP '(?<=/)[0-9\.]+(?=/)' <<<${vrs})
}

on_config(){
    ${src_rel} && on_src_release
}

. xbuild && start