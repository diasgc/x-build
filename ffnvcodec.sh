#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='ffnvcodec'
dsc='FFmpeg nvidia headers'
lic='GLP-2.0'
src='https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
cfg='make'
eta='0'

dev_vrs=''

lst_inc='ffnvcodec/dynlink_cuda.h 
 ffnvcodec/nvEncodeAPI.h
 ffnvcodec/dynlink_loader.h
 ffnvcodec/dynlink_cuviddec.h
 ffnvcodec/dynlink_nvcuvid.h'
lst_lib=''
lst_bin=''
lst_pc='ffnvcodec.pc'

on_config(){
    mki="PREFIX=${INSTALL_DIR} install"
    make_install="PREFIX=${INSTALL_DIR} install"
}

. xbuild && start

# Filelist
# --------
# include/ffnvcodec/dynlink_cuda.h
# include/ffnvcodec/nvEncodeAPI.h
# include/ffnvcodec/dynlink_loader.h
# include/ffnvcodec/dynlink_cuviddec.h
# include/ffnvcodec/dynlink_nvcuvid.h
# ffnvcodec.pc
