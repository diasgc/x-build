#!/bin/bash

#             a8  a7  x86 x64
# ndk-clang   F.. ... ... ...
# linux-gnu   ... ... ... ...
# mingw-llvm  ... ... ... ...

lib='mega'
pkg='libmega'
apt="${lib}-dev"
dsc='MEGA cloud storage C++ SDK'
lic='BSD-2c'
src='https://github.com/meganz/sdk.git' #src_opt='--recurse-submodules'
cfg='ag'
dep='openssl libcares curl libraw libuv freeimage libmediainfo cryptopp sqlite3 readline libsodium' #freeimage
eta='270'
mki='install-strip'
mkc='distclean'
CFG="--disable-tests --disable-examples --without-pdfium"
lst_inc=''
lst_lib=''
lst_bin=''

. xbuilder.sh

start

# Filelist
# --------
# include/megaapi_impl.h
# include/mega.h
# include/megaapi.h
# include/mega/mega_zxcvbn.h
# include/mega/transfer.h
# include/mega/treeproc.h
# include/mega/logging.h
# include/mega/mega_evt_tls.h
# include/mega/mediafileattribute.h
# include/mega/request.h
# include/mega/gfx/freeimage.h
# include/mega/gfx/gfx_pdfium.h
# include/mega/gfx/GfxProcCG.h
# include/mega/gfx/external.h
# include/mega/crypto/sodium.h
# include/mega/crypto/cryptopp.h
# include/mega/utils.h
# include/mega/mega_dict-src.h
# include/mega/megaapp.h
# include/mega/useralerts.h
# include/mega/megaclient.h
# include/mega/config.h
# include/mega/fileattributefetch.h
# include/mega/sharenodekeys.h
# include/mega/mega_ccronexpr.h
# include/mega/thread/posixthread.h
# include/mega/thread/cppthread.h
# include/mega/types.h
# include/mega/console.h
# include/mega/db/sqlite.h
# include/mega/backofftimer.h
# include/mega/gfx.h
# include/mega/config-android.h
# include/mega/mega_utf8proc.h
# include/mega/node.h
# include/mega/base64.h
# include/mega/file.h
# include/mega/mega_glob.h
# include/mega/filefingerprint.h
# include/mega/sync.h
# include/mega/filesystem.h
# include/mega/waiter.h
# include/mega/transferslot.h
# include/mega/attrmap.h
# include/mega/proxy.h
# include/mega/json.h
# include/mega/mega_http_parser.h
# include/mega/thread.h
# include/mega/version.h
# include/mega/mega_evt_queue.h
# include/mega/share.h
# include/mega/account.h
# include/mega/serialize64.h
# include/mega/user.h
# include/mega/http.h
# include/mega/posix/meganet.h
# include/mega/posix/megaconsole.h
# include/mega/posix/megafs.h
# include/mega/posix/megasys.h
# include/mega/posix/megawaiter.h
# include/mega/posix/megaconsolewaiter.h
# include/mega/command.h
# include/mega/pendingcontactrequest.h
# include/mega/raid.h
# include/mega/pubkeyaction.h
# include/mega/db.h
# lib/pkgconfig/libmega.pc
# lib/libmega.la
# lib/libmega.a
