#!/bin/bash

lib='boost'
apt='libboost1.71-dev'
dsc='Super-project for modularized Boost'
lic='BSD-1c'
src='https://github.com/boostorg/boost.git'
src_opt='--recursive'
cfg='cmake'
dep='zlib liblzma libzstd bzip2 libicu libiconv'
eta='1095'
WFLAGS='-Wno-deprecated-declarations -Wno-format -Wno-implicit-const-int-float-conversion -Wno-#pragma-messages'

dev_bra='master'
dev_vrs='1.78.0'

lst_inc='boost/*'
lst_lib='libboost_*'
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc='boost.pc'

pc_llib=null
pc_vrs="$dev_vrs"

. xbuild

export CXXFLAGS="${CPPFLAGS}"

start

# Filelist
# --------
# lib/libboost_atomic.so
# lib/libboost_chrono.so
# lib/libboost_container.so
# lib/libboost_context.so
# lib/libboost_contract.so
# lib/libboost_coroutine.so
# lib/libboost_date_time.so
# lib/libboost_exception.a
# lib/libboost_fiber.so
# lib/libboost_fiber_numa.so
# lib/libboost_filesystem.so
# lib/libboost_graph.so
# lib/libboost_iostreams.so
# lib/libboost_json.so
# lib/libboost_locale.so
# lib/libboost_log.so
# lib/libboost_log_setup.so
# lib/libboost_nowide.so
# lib/libboost_prg_exec_monitor.so
# lib/libboost_program_options.so
# lib/libboost_random.so
# lib/libboost_serialization.so
# lib/libboost_stacktrace_addr2line.so
# lib/libboost_stacktrace_basic.so
# lib/libboost_stacktrace_noop.so
# lib/libboost_test_exec_monitor.a
# lib/libboost_thread.so
# lib/libboost_timer.so
# lib/libboost_type_erasure.so
# lib/libboost_unit_test_framework.so
# lib/libboost_wave.so
# lib/libboost_wserialization.so
# share/doc/boost/AUTHORS
# share/doc/boost/LICENSE
