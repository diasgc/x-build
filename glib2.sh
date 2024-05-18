#!/bin/bash

lib='glib2'
pkg='glib-2.0'
apt='libglib2.0-dev'
dsc='GLib is a library containing many useful C routines for things such as trees, hashes, lists, and strings'
lic='LGPL-2.1'
src='https://gitlab.gnome.org/GNOME/glib.git'
dep='libiconv libffi'
cfg='meson'
eta='280'
meson_cfg='-Dgtk_doc=false -Dman=false'

dev_vrs='2.71.1'

lst_inc='libintl.h glib-2.0/*.h glib-2.0/glib/*.h glib-2.0/gobject/*.h glib-2.0/gio/*.h'
lst_lib='libintl libgio-2.0 libglib-2.0 libgthread-2.0 libgobject-2.0 libgmodule-2.0'
lst_bin='glib-gettextize gdbus glib-genmarshal gdbus-codegen gio-querymodules gobject-query glib-compile-schemas gresource gsettings gio glib-mkenums gtester-report'
lst_lic='COPYING AUTHORS'
lst_pc='glib-2.0.pc gio-2.0.pc gio-windows-2.0.pc gmodule-2.0.pc gmodule-export-2.0.pc gobject-2.0.pc gthread-2.0.pc gmodule-no-export-2.0.pc'

before_make(){
    mkf="-C ${dir_build}"
    mki="${mkf} install"
    make_install="${mkf} install"
}

on_config(){
    $host_mingw && meson_cfg+=' -Dlibelf=disabled -Dforce_posix_threads=true'
    WFLAGS='-Wno-unused-result -Wno-unused-variable -Wno-unused-function -Wno-array-bounds'
    LDFLAGS+=" -L${dir_install_lib} -liconv -lffi"
}

. xbuild && start

# cpu av8 av7 x86 x64
# NDK +++ +++ ... ... CLANG
# GNU +++ +++ ... ... GCC
# WIN +++ ... ... +++ CLANG/GCC

# Filelist
# --------
# include/glib-2.0/gmodule.h
# include/glib-2.0/glib.h
# include/glib-2.0/glib/gconvert.h
# include/glib-2.0/glib/garray.h
# include/glib-2.0/glib/gquark.h
# include/glib-2.0/glib/gqueue.h
# include/glib-2.0/glib/gkeyfile.h
# include/glib-2.0/glib/gbase64.h
# include/glib-2.0/glib/genviron.h
# include/glib-2.0/glib/galloca.h
# include/glib-2.0/glib/guri.h
# include/glib-2.0/glib/gbookmarkfile.h
# include/glib-2.0/glib/gasyncqueue.h
# include/glib-2.0/glib/gtimezone.h
# include/glib-2.0/glib/grcbox.h
# include/glib-2.0/glib/gbytes.h
# include/glib-2.0/glib/gmacros.h
# include/glib-2.0/glib/gwin32.h
# include/glib-2.0/glib/gcharset.h
# include/glib-2.0/glib/gstring.h
# include/glib-2.0/glib/gthreadpool.h
# include/glib-2.0/glib/grefcount.h
# include/glib-2.0/glib/gstdio.h
# include/glib-2.0/glib/gshell.h
# include/glib-2.0/glib/gqsort.h
# include/glib-2.0/glib/gutils.h
# include/glib-2.0/glib/gbacktrace.h
# include/glib-2.0/glib/grand.h
# include/glib-2.0/glib/gunicode.h
# include/glib-2.0/glib/gpoll.h
# include/glib-2.0/glib/gatomic.h
# include/glib-2.0/glib/gmessages.h
# include/glib-2.0/glib/glib-autocleanups.h
# include/glib-2.0/glib/glist.h
# include/glib-2.0/glib/gmem.h
# include/glib-2.0/glib/gdatetime.h
# include/glib-2.0/glib/gdate.h
# include/glib-2.0/glib/ghook.h
# include/glib-2.0/glib/gdataset.h
# include/glib-2.0/glib/gchecksum.h
# include/glib-2.0/glib/gnode.h
# include/glib-2.0/glib/gfileutils.h
# include/glib-2.0/glib/ghmac.h
# include/glib-2.0/glib/grefstring.h
# include/glib-2.0/glib/gthread.h
# include/glib-2.0/glib/guuid.h
# include/glib-2.0/glib/gslice.h
# include/glib-2.0/glib/gprimes.h
# include/glib-2.0/glib/gmarkup.h
# include/glib-2.0/glib/gerror.h
# include/glib-2.0/glib/gdir.h
# include/glib-2.0/glib/ghash.h
# include/glib-2.0/glib/gmappedfile.h
# include/glib-2.0/glib/gslist.h
# include/glib-2.0/glib/ggettext.h
# include/glib-2.0/glib/gsequence.h
# include/glib-2.0/glib/goption.h
# include/glib-2.0/glib/gtypes.h
# include/glib-2.0/glib/gstringchunk.h
# include/glib-2.0/glib/gvarianttype.h
# include/glib-2.0/glib/deprecated/gcompletion.h
# include/glib-2.0/glib/deprecated/gallocator.h
# include/glib-2.0/glib/deprecated/gcache.h
# include/glib-2.0/glib/deprecated/gthread.h
# include/glib-2.0/glib/deprecated/grel.h
# include/glib-2.0/glib/deprecated/gmain.h
# include/glib-2.0/glib/giochannel.h
# include/glib-2.0/glib/gversionmacros.h
# include/glib-2.0/glib/ghostutils.h
# include/glib-2.0/glib/gstrvbuilder.h
# include/glib-2.0/glib/gbitlock.h
# include/glib-2.0/glib/gpattern.h
# include/glib-2.0/glib/gvariant.h
# include/glib-2.0/glib/gscanner.h
# include/glib-2.0/glib/gi18n-lib.h
# include/glib-2.0/glib/glib-typeof.h
# include/glib-2.0/glib/gprintf.h
# include/glib-2.0/glib/gstrfuncs.h
# include/glib-2.0/glib/gregex.h
# include/glib-2.0/glib/gmain.h
# include/glib-2.0/glib/gtestutils.h
# include/glib-2.0/glib/gi18n.h
# include/glib-2.0/glib/gspawn.h
# include/glib-2.0/glib/gversion.h
# include/glib-2.0/glib/gtimer.h
# include/glib-2.0/glib/gtrashstack.h
# include/glib-2.0/glib/gtree.h
# include/glib-2.0/gobject/gobject.h
# include/glib-2.0/gobject/gtype.h
# include/glib-2.0/gobject/gobjectnotifyqueue.c
# include/glib-2.0/gobject/gvalue.h
# include/glib-2.0/gobject/gsignal.h
# include/glib-2.0/gobject/gparamspecs.h
# include/glib-2.0/gobject/gtypeplugin.h
# include/glib-2.0/gobject/genums.h
# include/glib-2.0/gobject/gvaluecollector.h
# include/glib-2.0/gobject/gboxed.h
# include/glib-2.0/gobject/gclosure.h
# include/glib-2.0/gobject/glib-enumtypes.h
# include/glib-2.0/gobject/gsourceclosure.h
# include/glib-2.0/gobject/gvaluetypes.h
# include/glib-2.0/gobject/gtypemodule.h
# include/glib-2.0/gobject/gvaluearray.h
# include/glib-2.0/gobject/gparam.h
# include/glib-2.0/gobject/glib-types.h
# include/glib-2.0/gobject/gobject-autocleanups.h
# include/glib-2.0/gobject/gbinding.h
# include/glib-2.0/gobject/gmarshal.h
# include/glib-2.0/glib-unix.h
# include/glib-2.0/gio/gfileoutputstream.h
# include/glib-2.0/gio/gzlibcompressor.h
# include/glib-2.0/gio/gapplication.h
# include/glib-2.0/gio/gdataoutputstream.h
# include/glib-2.0/gio/gemblem.h
# include/glib-2.0/gio/gsimpleiostream.h
# include/glib-2.0/gio/gsocketservice.h
# include/glib-2.0/gio/gproxyaddressenumerator.h
# include/glib-2.0/gio/gpollableoutputstream.h
# include/glib-2.0/gio/glistmodel.h
# include/glib-2.0/gio/gactionmap.h
# include/glib-2.0/gio/gnativesocketaddress.h
# include/glib-2.0/gio/gdbusobjectmanagerclient.h
# include/glib-2.0/gio/gtlsfiledatabase.h
# include/glib-2.0/gio/gio-autocleanups.h
# include/glib-2.0/gio/gthreadedsocketservice.h
# include/glib-2.0/gio/gsubprocesslauncher.h
# include/glib-2.0/gio/gsettingsschema.h
# include/glib-2.0/gio/ginetsocketaddress.h
# include/glib-2.0/gio/gdbusmethodinvocation.h
# include/glib-2.0/gio/gmenuexporter.h
# include/glib-2.0/gio/gdbusobjectproxy.h
# include/glib-2.0/gio/gactiongroup.h
# include/glib-2.0/gio/ginputstream.h
# include/glib-2.0/gio/gmountoperation.h
# include/glib-2.0/gio/gresolver.h
# include/glib-2.0/gio/gdrive.h
# include/glib-2.0/gio/gdbusmessage.h
# include/glib-2.0/gio/gloadableicon.h
# include/glib-2.0/gio/gsettingsbackend.h
# include/glib-2.0/gio/gfileinputstream.h
# include/glib-2.0/gio/gvolume.h
# include/glib-2.0/gio/gnetworkaddress.h
# include/glib-2.0/gio/gcredentials.h
# include/glib-2.0/gio/gsimplepermission.h
# include/glib-2.0/gio/gsubprocess.h
# include/glib-2.0/gio/gnetworkservice.h
# include/glib-2.0/gio/gconverter.h
# include/glib-2.0/gio/gfileattribute.h
# include/glib-2.0/gio/gproxyaddress.h
# include/glib-2.0/gio/gsettings.h
# include/glib-2.0/gio/gcancellable.h
# include/glib-2.0/gio/gaction.h
# include/glib-2.0/gio/gioenumtypes.h
# include/glib-2.0/gio/gtask.h
# include/glib-2.0/gio/gliststore.h
# include/glib-2.0/gio/gcharsetconverter.h
# include/glib-2.0/gio/gresource.h
# include/glib-2.0/gio/gconverterinputstream.h
# include/glib-2.0/gio/gdbuserror.h
# include/glib-2.0/gio/gapplicationcommandline.h
# include/glib-2.0/gio/gpermission.h
# include/glib-2.0/gio/gbytesicon.h
# include/glib-2.0/gio/gtlsbackend.h
# include/glib-2.0/gio/gdbusobjectmanagerserver.h
# include/glib-2.0/gio/gfilenamecompleter.h
# include/glib-2.0/gio/gtlsserverconnection.h
# include/glib-2.0/gio/gdbusactiongroup.h
# include/glib-2.0/gio/gdbusutils.h
# include/glib-2.0/gio/goutputstream.h
# include/glib-2.0/gio/ginetaddress.h
# include/glib-2.0/gio/gdbusserver.h
# include/glib-2.0/gio/ginitable.h
# include/glib-2.0/gio/gsimpleaction.h
# include/glib-2.0/gio/gbufferedoutputstream.h
# include/glib-2.0/gio/gdbusaddress.h
# include/glib-2.0/gio/gsocketaddressenumerator.h
# include/glib-2.0/gio/gdbusobjectmanager.h
# include/glib-2.0/gio/gdbusnamewatching.h
# include/glib-2.0/gio/gappinfo.h
# include/glib-2.0/gio/gmemoryoutputstream.h
# include/glib-2.0/gio/gnetworking.h
# include/glib-2.0/gio/gdbusmenumodel.h
# include/glib-2.0/gio/gsimpleasyncresult.h
# include/glib-2.0/gio/gmenu.h
# include/glib-2.0/gio/gzlibdecompressor.h
# include/glib-2.0/gio/gthemedicon.h
# include/glib-2.0/gio/gdbusintrospection.h
# include/glib-2.0/gio/gproxyresolver.h
# include/glib-2.0/gio/gmemoryinputstream.h
# include/glib-2.0/gio/gconverteroutputstream.h
# include/glib-2.0/gio/giomodule.h
# include/glib-2.0/gio/gpowerprofilemonitor.h
# include/glib-2.0/gio/gpollableutils.h
# include/glib-2.0/gio/gdbusnameowning.h
# include/glib-2.0/gio/gactiongroupexporter.h
# include/glib-2.0/gio/gtlsclientconnection.h
# include/glib-2.0/gio/gemblemedicon.h
# include/glib-2.0/gio/gfileenumerator.h
# include/glib-2.0/gio/gcontenttype.h
# include/glib-2.0/gio/gsrvtarget.h
# include/glib-2.0/gio/gioscheduler.h
# include/glib-2.0/gio/gtlsinteraction.h
# include/glib-2.0/gio/gremoteactiongroup.h
# include/glib-2.0/gio/gfile.h
# include/glib-2.0/gio/gdtlsserverconnection.h
# include/glib-2.0/gio/gdbusobjectskeleton.h
# include/glib-2.0/gio/gsocketcontrolmessage.h
# include/glib-2.0/gio/gfilteroutputstream.h
# include/glib-2.0/gio/gfileinfo.h
# include/glib-2.0/gio/gsocketlistener.h
# include/glib-2.0/gio/gtcpconnection.h
# include/glib-2.0/gio/gsocketconnection.h
# include/glib-2.0/gio/gbufferedinputstream.h
# include/glib-2.0/gio/gpropertyaction.h
# include/glib-2.0/gio/gdbusobject.h
# include/glib-2.0/gio/gasyncresult.h
# include/glib-2.0/gio/gdbusconnection.h
# include/glib-2.0/gio/gfilemonitor.h
# include/glib-2.0/gio/gicon.h
# include/glib-2.0/gio/gdtlsconnection.h
# include/glib-2.0/gio/gasyncinitable.h
# include/glib-2.0/gio/gsocketaddress.h
# include/glib-2.0/gio/gtlsdatabase.h
# include/glib-2.0/gio/gsocket.h
# include/glib-2.0/gio/gtlspassword.h
# include/glib-2.0/gio/gdbusproxy.h
# include/glib-2.0/gio/gfileiostream.h
# include/glib-2.0/gio/gtestdbus.h
# include/glib-2.0/gio/gdtlsclientconnection.h
# include/glib-2.0/gio/gdatainputstream.h
# include/glib-2.0/gio/gtcpwrapperconnection.h
# include/glib-2.0/gio/gioenums.h
# include/glib-2.0/gio/gsocketclient.h
# include/glib-2.0/gio/gnativevolumemonitor.h
# include/glib-2.0/gio/gpollableinputstream.h
# include/glib-2.0/gio/gdbusinterface.h
# include/glib-2.0/gio/gio.h
# include/glib-2.0/gio/gtlsconnection.h
# include/glib-2.0/gio/giostream.h
# include/glib-2.0/gio/gmount.h
# include/glib-2.0/gio/gvolumemonitor.h
# include/glib-2.0/gio/gioerror.h
# include/glib-2.0/gio/gproxy.h
# include/glib-2.0/gio/gnetworkmonitor.h
# include/glib-2.0/gio/gdbusauthobserver.h
# include/glib-2.0/gio/gtlscertificate.h
# include/glib-2.0/gio/ginetaddressmask.h
# include/glib-2.0/gio/gnotification.h
# include/glib-2.0/gio/gmemorymonitor.h
# include/glib-2.0/gio/gfileicon.h
# include/glib-2.0/gio/gvfs.h
# include/glib-2.0/gio/gseekable.h
# include/glib-2.0/gio/gdatagrambased.h
# include/glib-2.0/gio/gdbusinterfaceskeleton.h
# include/glib-2.0/gio/giotypes.h
# include/glib-2.0/gio/gsocketconnectable.h
# include/glib-2.0/gio/gsimpleproxyresolver.h
# include/glib-2.0/gio/gfilterinputstream.h
# include/glib-2.0/gio/gmenumodel.h
# include/glib-2.0/gio/gsimpleactiongroup.h
# include/glib-2.0/glib-object.h
# include/gio-unix-2.0/gio/gunixmounts.h
# include/gio-unix-2.0/gio/gdesktopappinfo.h
# include/gio-unix-2.0/gio/gunixcredentialsmessage.h
# include/gio-unix-2.0/gio/gunixconnection.h
# include/gio-unix-2.0/gio/gunixoutputstream.h
# include/gio-unix-2.0/gio/gunixfdlist.h
# include/gio-unix-2.0/gio/gfiledescriptorbased.h
# include/gio-unix-2.0/gio/gunixinputstream.h
# include/gio-unix-2.0/gio/gunixsocketaddress.h
# include/gio-unix-2.0/gio/gunixfdmessage.h
# include/libintl.h
# lib/libgobject-2.0.a
# lib/pkgconfig/gio-unix-2.0.pc
# lib/pkgconfig/gmodule-2.0.pc
# lib/pkgconfig/gmodule-export-2.0.pc
# lib/pkgconfig/gobject-2.0.pc
# lib/pkgconfig/gthread-2.0.pc
# lib/pkgconfig/gmodule-no-export-2.0.pc
# lib/pkgconfig/glib-2.0.pc
# lib/pkgconfig/gio-2.0.pc
# lib/libgio-2.0.a
# lib/libgthread-2.0.a
# lib/libgmodule-2.0.so
# lib/glib-2.0/include/glibconfig.h
# lib/libgthread-2.0.so
# lib/libglib-2.0.so
# lib/libglib-2.0.a
# lib/libgmodule-2.0.a
# lib/libgio-2.0.so
# lib/libintl.so
# lib/libgobject-2.0.so
# lib/libintl.a
# share/gettext/its/gschema.loc
# share/gettext/its/gschema.its
# share/locale/sr@latin/LC_MESSAGES/glib20.mo
# share/locale/yi/LC_MESSAGES/glib20.mo
# share/locale/zh_CN/LC_MESSAGES/glib20.mo
# share/locale/hy/LC_MESSAGES/glib20.mo
# share/locale/ast/LC_MESSAGES/glib20.mo
# share/locale/ar/LC_MESSAGES/glib20.mo
# share/locale/mr/LC_MESSAGES/glib20.mo
# share/locale/it/LC_MESSAGES/glib20.mo
# share/locale/vi/LC_MESSAGES/glib20.mo
# share/locale/cy/LC_MESSAGES/glib20.mo
# share/locale/fi/LC_MESSAGES/glib20.mo
# share/locale/be/LC_MESSAGES/glib20.mo
# share/locale/ug/LC_MESSAGES/glib20.mo
# share/locale/zh_TW/LC_MESSAGES/glib20.mo
# share/locale/tl/LC_MESSAGES/glib20.mo
# share/locale/sv/LC_MESSAGES/glib20.mo
# share/locale/dz/LC_MESSAGES/glib20.mo
# share/locale/el/LC_MESSAGES/glib20.mo
# share/locale/ne/LC_MESSAGES/glib20.mo
# share/locale/eu/LC_MESSAGES/glib20.mo
# share/locale/en@shaw/LC_MESSAGES/glib20.mo
# share/locale/mn/LC_MESSAGES/glib20.mo
# share/locale/ru/LC_MESSAGES/glib20.mo
# share/locale/sr/LC_MESSAGES/glib20.mo
# share/locale/pl/LC_MESSAGES/glib20.mo
# share/locale/xh/LC_MESSAGES/glib20.mo
# share/locale/nn/LC_MESSAGES/glib20.mo
# share/locale/sk/LC_MESSAGES/glib20.mo
# share/locale/ja/LC_MESSAGES/glib20.mo
# share/locale/kk/LC_MESSAGES/glib20.mo
# share/locale/as/LC_MESSAGES/glib20.mo
# share/locale/pt/LC_MESSAGES/glib20.mo
# share/locale/sq/LC_MESSAGES/glib20.mo
# share/locale/hr/LC_MESSAGES/glib20.mo
# share/locale/ca@valencia/LC_MESSAGES/glib20.mo
# share/locale/nl/LC_MESSAGES/glib20.mo
# share/locale/en_CA/LC_MESSAGES/glib20.mo
# share/locale/gu/LC_MESSAGES/glib20.mo
# share/locale/wa/LC_MESSAGES/glib20.mo
# share/locale/cs/LC_MESSAGES/glib20.mo
# share/locale/az/LC_MESSAGES/glib20.mo
# share/locale/sr@ije/LC_MESSAGES/glib20.mo
# share/locale/pa/LC_MESSAGES/glib20.mo
# share/locale/bn_IN/LC_MESSAGES/glib20.mo
# share/locale/he/LC_MESSAGES/glib20.mo
# share/locale/mai/LC_MESSAGES/glib20.mo
# share/locale/sl/LC_MESSAGES/glib20.mo
# share/locale/ta/LC_MESSAGES/glib20.mo
# share/locale/ro/LC_MESSAGES/glib20.mo
# share/locale/th/LC_MESSAGES/glib20.mo
# share/locale/hu/LC_MESSAGES/glib20.mo
# share/locale/ko/LC_MESSAGES/glib20.mo
# share/locale/zh_HK/LC_MESSAGES/glib20.mo
# share/locale/da/LC_MESSAGES/glib20.mo
# share/locale/tt/LC_MESSAGES/glib20.mo
# share/locale/tr/LC_MESSAGES/glib20.mo
# share/locale/ps/LC_MESSAGES/glib20.mo
# share/locale/mk/LC_MESSAGES/glib20.mo
# share/locale/fr/LC_MESSAGES/glib20.mo
# share/locale/fur/LC_MESSAGES/glib20.mo
# share/locale/ml/LC_MESSAGES/glib20.mo
# share/locale/ga/LC_MESSAGES/glib20.mo
# share/locale/et/LC_MESSAGES/glib20.mo
# share/locale/uk/LC_MESSAGES/glib20.mo
# share/locale/mg/LC_MESSAGES/glib20.mo
# share/locale/hi/LC_MESSAGES/glib20.mo
# share/locale/be@latin/LC_MESSAGES/glib20.mo
# share/locale/en_GB/LC_MESSAGES/glib20.mo
# share/locale/an/LC_MESSAGES/glib20.mo
# share/locale/af/LC_MESSAGES/glib20.mo
# share/locale/pt_BR/LC_MESSAGES/glib20.mo
# share/locale/de/LC_MESSAGES/glib20.mo
# share/locale/nds/LC_MESSAGES/glib20.mo
# share/locale/gd/LC_MESSAGES/glib20.mo
# share/locale/ka/LC_MESSAGES/glib20.mo
# share/locale/eo/LC_MESSAGES/glib20.mo
# share/locale/te/LC_MESSAGES/glib20.mo
# share/locale/si/LC_MESSAGES/glib20.mo
# share/locale/rw/LC_MESSAGES/glib20.mo
# share/locale/bn/LC_MESSAGES/glib20.mo
# share/locale/or/LC_MESSAGES/glib20.mo
# share/locale/gl/LC_MESSAGES/glib20.mo
# share/locale/kn/LC_MESSAGES/glib20.mo
# share/locale/oc/LC_MESSAGES/glib20.mo
# share/locale/nb/LC_MESSAGES/glib20.mo
# share/locale/tg/LC_MESSAGES/glib20.mo
# share/locale/ku/LC_MESSAGES/glib20.mo
# share/locale/lv/LC_MESSAGES/glib20.mo
# share/locale/bg/LC_MESSAGES/glib20.mo
# share/locale/id/LC_MESSAGES/glib20.mo
# share/locale/fa/LC_MESSAGES/glib20.mo
# share/locale/lt/LC_MESSAGES/glib20.mo
# share/locale/ms/LC_MESSAGES/glib20.mo
# share/locale/es/LC_MESSAGES/glib20.mo
# share/locale/ca/LC_MESSAGES/glib20.mo
# share/locale/am/LC_MESSAGES/glib20.mo
# share/locale/is/LC_MESSAGES/glib20.mo
# share/locale/bs/LC_MESSAGES/glib20.mo
# share/glib-2.0/gettext/po/Makefile.in.in
# share/glib-2.0/codegen/utils.py
# share/glib-2.0/codegen/codegen.py
# share/glib-2.0/codegen/config.py
# share/glib-2.0/codegen/codegen_main.py
# share/glib-2.0/codegen/dbustypes.py
# share/glib-2.0/codegen/codegen_docbook.py
# share/glib-2.0/codegen/codegen_rst.py
# share/glib-2.0/codegen/parser.py
# share/glib-2.0/codegen/__init__.py
# share/glib-2.0/valgrind/glib.supp
# share/glib-2.0/gdb/glib_gdb.py
# share/glib-2.0/gdb/gobject_gdb.py
# share/glib-2.0/schemas/gschema.dtd
# share/doc/glib2/AUTHORS
# share/doc/glib2/COPYING
# share/aclocal/gsettings.m4
# share/aclocal/glib-gettext.m4
# share/aclocal/glib-2.0.m4
# share/bash-completion/completions/gsettings
# share/bash-completion/completions/gapplication
# share/bash-completion/completions/gresource
# share/bash-completion/completions/gdbus
# share/bash-completion/completions/gio
# share/gdb/auto-load/usr/aarch64-linux-android/local/lib/libglib-2.0.so.0.7100.0-gdb.py
# share/gdb/auto-load/usr/aarch64-linux-android/local/lib/libgobject-2.0.so.0.7100.0-gdb.py
# bin/glib-gettextize
# bin/gio-querymodules
# bin/gdbus-codegen
# bin/gtester-report
# bin/gobject-query
# bin/glib-mkenums
# bin/gsettings
# bin/glib-compile-resources
# bin/glib-compile-schemas
# bin/gapplication
# bin/gresource
# bin/glib-genmarshal
# bin/gtester
# bin/gdbus
# bin/gio
