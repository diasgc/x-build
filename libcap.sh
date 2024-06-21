#!/bin/bash
# cpu av8 av7 x86 x64
# NDK  .   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='libcap'
dsc='Library for getting and setting POSIX.1e (formerly POSIX 6) draft 15 capabilities'
lic='GLP-2.0'
src='https://kernel.googlesource.com/pub/scm/linux/kernel/git/morgan/libcap.git'
cfg='make'

dev_bra='main'
dev_vrs=''
pkg_deb='libcap-dev'
eta='0'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE AUTHORS'
lst_pc=''

eta='20'

on_config(){
    make_args='CC='$CC' -Wl,-rpath='${dir_install_lib}' -Wl,--enable-new-dtags OBJCOPY='$OBJCOPY' PREFIX="'${dir_install}'" PTHREADS=no'
    make_install='CC='$CC' -Wl,-rpath='${dir_install_lib}' -Wl,--enable-new-dtags OBJCOPY='$OBJCOPY' prefix="'${dir_install}'" RAISE_SETFCAP=no lib=/lib PTHREADS=no install'
}

. xbuild && start

# Filelist
# --------
# .gitignore
# go/go-mod-index.html
# go/.gitignore
# go/compare-cap.go
# go/b210613.go
# go/ok.go
# go/try-launching.go
# go/cgo-required.sh
# go/psx-signals.go
# go/go.mod
# go/Makefile
# go/mknames.go
# tests/.gitignore
# tests/noop.c
# tests/uns_test.c
# tests/psx_test.c
# tests/exploit.c
# tests/Makefile
# tests/libcap_launch_test.c
# tests/libcap_psx_test.c
# doc/capgetp.3
# doc/cap_setgroups.3
# doc/cap_mode_name.3
# doc/cap_launch.3
# doc/cap_dup.3
# doc/cap_get_pid.3
# doc/cap_launcher_setuid.3
# doc/cap_func_launcher.3
# doc/cap_mode.3
# doc/cap_copy_ext.3
# doc/cap_iab_to_text.3
# doc/cap_iab_set_vector.3
# doc/cap_iab_set_proc.3
# doc/cap_iab_get_proc.3
# doc/capsh.1
# doc/cap_size.3
# doc/capsetp.3
# doc/md2html.lua
# doc/cap_init.3
# doc/capability.notes
# doc/cap_launcher_set_chroot.3
# doc/cap_clear.3
# doc/cap_set_file.3
# doc/cap_setuid.3
# doc/psx_syscall3.3
# doc/cap_iab_fill.3
# doc/cap_set_ambient.3
# doc/cap_iab_from_text.3
# doc/cap_get_mode.3
# doc/cap_from_name.3
# doc/cap_get_proc.3
# doc/cap_compare.3
# doc/cap_free.3
# doc/mkmd.sh
# doc/cap_iab_init.3
# doc/cap_drop_bound.3
# doc/cap_set_flag.3
# doc/captree.8
# doc/cap_set_mode.3
# doc/values/22.txt
# doc/values/10.txt
# doc/values/2.txt
# doc/values/20.txt
# doc/values/11.txt
# doc/values/17.txt
# doc/values/15.txt
# doc/values/23.txt
# doc/values/9.txt
# doc/values/33.txt
# doc/values/6.txt
# doc/values/26.txt
# doc/values/19.txt
# doc/values/5.txt
# doc/values/12.txt
# doc/values/28.txt
# doc/values/38.txt
# doc/values/37.txt
# doc/values/35.txt
# doc/values/29.txt
# doc/values/32.txt
# doc/values/24.txt
# doc/values/14.txt
# doc/values/30.txt
# doc/values/4.txt
# doc/values/34.txt
# doc/values/1.txt
# doc/values/31.txt
# doc/values/13.txt
# doc/values/16.txt
# doc/values/21.txt
# doc/values/18.txt
# doc/values/0.txt
# doc/values/36.txt
# doc/values/40.txt
# doc/values/39.txt
# doc/values/3.txt
# doc/values/27.txt
# doc/values/8.txt
# doc/values/25.txt
# doc/values/7.txt
# doc/cap_new_launcher.3
# doc/libcap.3
# doc/cap_from_text.3
# doc/cap_iab.3
# doc/libpsx.3
# doc/cap_to_name.3
# doc/cap_set_proc.3
# doc/cap_launcher_set_iab.3
# doc/cap_iab_compare.3
# doc/cap_set_fd.3
# doc/cap_get_fd.3
# doc/old/_fgetfilecap.2
# doc/old/_fsetfilecap.2
# doc/old/_setproccap.2
# doc/old/_setfilecap.2
# doc/old/_getfilecap.2
# doc/old/_getproccap.2
# doc/old/README
# doc/cap_get_bound.3
# doc/cap_clear_flag.3
# doc/cap_get_secbits.3
# doc/Makefile
# doc/cap_launcher_setgroups.3
# doc/setcap.8
# doc/cap_get_file.3
# doc/cap_reset_ambient.3
# doc/getpcaps.8
# doc/getcap.8
# doc/psx_syscall.3
# doc/cap_get_ambient.3
# doc/cap_iab_get_vector.3
# doc/cap_to_text.3
# doc/cap_iab_get_pid.3
# doc/cap_copy_int.3
# doc/cap_launcher_callback.3
# doc/cap_launcher_set_mode.3
# doc/psx_syscall6.3
# doc/cap_get_flag.3
# doc/cap_set_secbits.3
# contrib/pcaps4server
# contrib/bug400591/Makefile
# contrib/bug400591/bug.c
# contrib/sucap/su.c
# contrib/sucap/README.md
# contrib/sucap/Makefile
# contrib/sucap/sucap.pamconfig
# contrib/pcaps4suid0
# contrib/seccomp/go.mod
# contrib/seccomp/explore.go
# contrib/Makefile
# contrib/pcaps4convenience
# template.c
# .git/index
# .git/HEAD
# .git/packed-refs
# .git/config
# .git/description
# .git/hooks/fsmonitor-watchman.sample
# .git/hooks/push-to-checkout.sample
# .git/hooks/update.sample
# .git/hooks/pre-applypatch.sample
# .git/hooks/pre-push.sample
# .git/hooks/pre-receive.sample
# .git/hooks/pre-merge-commit.sample
# .git/hooks/applypatch-msg.sample
# .git/hooks/pre-commit.sample
# .git/hooks/prepare-commit-msg.sample
# .git/hooks/commit-msg.sample
# .git/hooks/post-update.sample
# .git/hooks/pre-rebase.sample
# .git/objects/pack/pack-483a1a49c6dd420f6ec323db3569c1cd92adcf14.pack
# .git/objects/pack/pack-483a1a49c6dd420f6ec323db3569c1cd92adcf14.idx
# .git/info/exclude
# .git/refs/remotes/origin/HEAD
# .git/refs/heads/master
# .git/logs/HEAD
# .git/logs/refs/remotes/origin/HEAD
# .git/logs/refs/heads/master
# License
# progs/quicktest.sh
# progs/capshdoc.h
# progs/getpcaps.c
# progs/.gitignore
# progs/getpcaps.o
# progs/getcap
# progs/setcap.c
# progs/setcap.o
# progs/getcap.c
# progs/mkcapshdoc.sh
# progs/getcap.o
# progs/old/execcap.c
# progs/old/setpcaps.c
# progs/old/sucap.c
# progs/old/README
# progs/getpcaps
# progs/capsh.c
# progs/Makefile
# progs/setcap
# progs/capshdoc.h.cf
# progs/capsh
# cap/convenience.go
# cap/names.go
# cap/oslocks.go
# cap/text.go
# cap/legacy.go
# cap/modern.go
# cap/file.go
# cap/cap_test.go
# cap/License
# cap/syscalls.go
# cap/oslockluster.go
# cap/cap.go
# cap/iab.go
# cap/go.mod
# cap/launch.go
# cap/flags.go
# cap/README
# distcheck.sh
# libcap/_makenames.c
# libcap/libcap.so
# libcap/_caps_output.gperf
# libcap/execable.c
# libcap/empty.c
# libcap/include/uapi/linux/prctl.h
# libcap/include/uapi/linux/securebits.h
# libcap/include/uapi/linux/capability.h
# libcap/include/sys/.gitignore
# libcap/include/sys/securebits.h
# libcap/include/sys/capability.h
# libcap/.gitignore
# libcap/cap_file.c
# libcap/libcap.pc
# libcap/libcap.pc.in
# libcap/cap_alloc.o
# libcap/cap_magic.o
# libcap/cap_proc.c
# libcap/empty
# libcap/cap_alloc.c
# libcap/libpsx.pc.in
# libcap/libcap.so.2.59
# libcap/cap_test.c
# libcap/cap_flag.o
# libcap/cap_file.o
# libcap/cap_text.o
# libcap/_makenames
# libcap/cap_proc.o
# libcap/loader.txt
# libcap/libcap.h
# libcap/libcap.a
# libcap/cap_names.h
# libcap/cap_extint.c
# libcap/cap_text.c
# libcap/Makefile
# libcap/cap_names.list.h
# libcap/cap_extint.o
# libcap/libpsx.pc
# libcap/execable.h
# libcap/cap_flag.c
# CHANGELOG
# pam_cap/execable.c
# pam_cap/test_pam_cap.c
# pam_cap/.gitignore
# pam_cap/pam_cap.c
# pam_cap/sudotest.conf
# pam_cap/test.c
# pam_cap/License
# pam_cap/capability.conf
# pam_cap/Makefile
# pam_cap/lazylink.c
# goapps/web/go.mod
# goapps/web/web.go
# goapps/web/README
# goapps/captree/captree.go
# goapps/captree/go.mod
# goapps/setid/setid.go
# goapps/setid/go.mod
# goapps/gowns/gowns.go
# goapps/gowns/go.mod
# Make.Rules
# gomods.sh
# kdebug/test-init.sh
# kdebug/test-prompt.sh
# kdebug/test-kernel.sh
# kdebug/exit.c
# kdebug/Makefile
# kdebug/test-passwd
# kdebug/test-bash.sh
# Makefile
# pgp.keys.asc
# README
# psx/psx.go
# psx/psx_cgo.go
# psx/License
# psx/psx_cgo_test.go
# psx/go.mod
# psx/psx_test.go
# psx/psx_syscall.h
# psx/psx.c
# psx/doc.go
# psx/README
