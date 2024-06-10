#!/bin/bash

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libdc1394'
pkg_deb='libdc1394-dev'
dsc='IIDC Camera Control Library'
lic='LGPL-2.1'
vrs='2.2.7'
git='https://git.code.sf.net/p/libdc1394/code'
eta='60'
pkg='libdc1394-2'
cfg='cmake'

on_config(){
    if ${src_rel}; then
        vrs="$(sourceforge_json ${lib} | jq -r .release.filename)"
        src="https://sourceforge.net/projects/${lib}/files/${vrs}"
        vrs=$(grep -oP '(?<=/)[0-9\.]+(?=/)' <<<${vrs})
    fi
    return 0
}

. xbuild && start