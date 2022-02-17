#!/bin/bash
# Aa8 Aa7 A86 A64 L64 W64 La8 La7 Wa8 W86 L86
#  -   .   .   .   .   .   .   .   .   .   .  static
#  +   .   .   .   .   .   .   .   .   .   .  shared
#  +   .   .   .   .   .   .   .   .   .   .  bin

lib='lv2'
dsc='An extensible audio plugin interface'
lic='LGPL-2.1'
src='https://gitlab.com/lv2/lv2.git'
sty='git'
cfg='wf'
pkg='lv2'
dep='sndfile'
eta='19'

. xbuilder.sh

CFG="--prefix=${dir_install} --no-plugins"

source_config(){
  do_log 'prepare' git submodule update --init --recursive
}

build_clean(){
  do_log 'clean' $dir_src/waf distclean
}
build_config(){
  do_log 'config' $dir_src/waf configure $CFG
}
on_make(){
  $dir_src/waf build $CFG
}
on_install(){
  $dir_src/waf install --prefix=${dir_install}
}
build_make_package(){
  $dir_src/waf install --destdir=${1}
}

start

# Filelist
# --------

# lib/pkgconfig/lv2.pc
# lib/lv2/event.lv2/event.h
# lib/lv2/event.lv2/event.ttl
# lib/lv2/event.lv2/event.meta.ttl
# lib/lv2/event.lv2/manifest.ttl
# lib/lv2/event.lv2/event-helpers.h
# lib/lv2/eg-params.lv2/params.so
# lib/lv2/eg-params.lv2/params.ttl
# lib/lv2/eg-params.lv2/manifest.ttl
# lib/lv2/core.lv2/attributes.h
# lib/lv2/core.lv2/lv2.h
# lib/lv2/core.lv2/people.ttl
# lib/lv2/core.lv2/lv2_util.h
# lib/lv2/core.lv2/lv2core.meta.ttl
# lib/lv2/core.lv2/meta.ttl
# lib/lv2/core.lv2/lv2core.ttl
# lib/lv2/core.lv2/manifest.ttl
# lib/lv2/resize-port.lv2/resize-port.h
# lib/lv2/resize-port.lv2/resize-port.meta.ttl
# lib/lv2/resize-port.lv2/resize-port.ttl
# lib/lv2/resize-port.lv2/manifest.ttl
# lib/lv2/schemas.lv2/rdfs.ttl
# lib/lv2/schemas.lv2/xsd.ttl
# lib/lv2/schemas.lv2/dct.ttl
# lib/lv2/schemas.lv2/doap.ttl
# lib/lv2/schemas.lv2/owl.ttl
# lib/lv2/schemas.lv2/manifest.ttl
# lib/lv2/schemas.lv2/foaf.ttl
# lib/lv2/schemas.lv2/rdf.ttl
# lib/lv2/schemas.lv2/dcs.ttl
# lib/lv2/state.lv2/state.ttl
# lib/lv2/state.lv2/state.meta.ttl
# lib/lv2/state.lv2/manifest.ttl
# lib/lv2/state.lv2/state.h
# lib/lv2/morph.lv2/morph.meta.ttl
# lib/lv2/morph.lv2/morph.ttl
# lib/lv2/morph.lv2/morph.h
# lib/lv2/morph.lv2/manifest.ttl
# lib/lv2/eg-fifths.lv2/fifths.ttl
# lib/lv2/eg-fifths.lv2/fifths.so
# lib/lv2/eg-fifths.lv2/manifest.ttl
# lib/lv2/buf-size.lv2/buf-size.ttl
# lib/lv2/buf-size.lv2/buf-size.h
# lib/lv2/buf-size.lv2/buf-size.meta.ttl
# lib/lv2/buf-size.lv2/manifest.ttl
# lib/lv2/data-access.lv2/data-access.meta.ttl
# lib/lv2/data-access.lv2/data-access.ttl
# lib/lv2/data-access.lv2/data-access.h
# lib/lv2/data-access.lv2/manifest.ttl
# lib/lv2/worker.lv2/worker.ttl
# lib/lv2/worker.lv2/worker.meta.ttl
# lib/lv2/worker.lv2/worker.h
# lib/lv2/worker.lv2/manifest.ttl
# lib/lv2/instance-access.lv2/instance-access.h
# lib/lv2/instance-access.lv2/instance-access.meta.ttl
# lib/lv2/instance-access.lv2/manifest.ttl
# lib/lv2/instance-access.lv2/instance-access.ttl
# lib/lv2/eg-midigate.lv2/midigate.ttl
# lib/lv2/eg-midigate.lv2/midigate.so
# lib/lv2/eg-midigate.lv2/manifest.ttl
# lib/lv2/options.lv2/options.meta.ttl
# lib/lv2/options.lv2/options.h
# lib/lv2/options.lv2/manifest.ttl
# lib/lv2/options.lv2/options.ttl
# lib/lv2/eg-metro.lv2/metro.so
# lib/lv2/eg-metro.lv2/metro.ttl
# lib/lv2/eg-metro.lv2/manifest.ttl
# lib/lv2/presets.lv2/presets.h
# lib/lv2/presets.lv2/presets.ttl
# lib/lv2/presets.lv2/manifest.ttl
# lib/lv2/presets.lv2/presets.meta.ttl
# lib/lv2/atom.lv2/atom.ttl
# lib/lv2/atom.lv2/forge.h
# lib/lv2/atom.lv2/forge-overflow-test.c
# lib/lv2/atom.lv2/atom.h
# lib/lv2/atom.lv2/atom-test-utils.c
# lib/lv2/atom.lv2/atom.meta.ttl
# lib/lv2/atom.lv2/atom-test.c
# lib/lv2/atom.lv2/manifest.ttl
# lib/lv2/atom.lv2/util.h
# lib/lv2/eg-amp.lv2/amp.ttl
# lib/lv2/eg-amp.lv2/amp.so
# lib/lv2/eg-amp.lv2/manifest.ttl
# lib/lv2/urid.lv2/urid.h
# lib/lv2/urid.lv2/urid.ttl
# lib/lv2/urid.lv2/urid.meta.ttl
# lib/lv2/urid.lv2/manifest.ttl
# lib/lv2/parameters.lv2/parameters.meta.ttl
# lib/lv2/parameters.lv2/parameters.h
# lib/lv2/parameters.lv2/parameters.ttl
# lib/lv2/parameters.lv2/manifest.ttl
# lib/lv2/midi.lv2/midi.h
# lib/lv2/midi.lv2/midi.meta.ttl
# lib/lv2/midi.lv2/manifest.ttl
# lib/lv2/midi.lv2/midi.ttl
# lib/lv2/port-groups.lv2/port-groups.meta.ttl
# lib/lv2/port-groups.lv2/port-groups.h
# lib/lv2/port-groups.lv2/manifest.ttl
# lib/lv2/port-groups.lv2/port-groups.ttl
# lib/lv2/eg-sampler.lv2/click.wav
# lib/lv2/eg-sampler.lv2/sampler.ttl
# lib/lv2/eg-sampler.lv2/manifest.ttl
# lib/lv2/eg-sampler.lv2/sampler.so
# lib/lv2/dynmanifest.lv2/dynmanifest.ttl
# lib/lv2/dynmanifest.lv2/dynmanifest.meta.ttl
# lib/lv2/dynmanifest.lv2/dynmanifest.h
# lib/lv2/dynmanifest.lv2/manifest.ttl
# lib/lv2/ui.lv2/ui.ttl
# lib/lv2/ui.lv2/ui.h
# lib/lv2/ui.lv2/ui.meta.ttl
# lib/lv2/ui.lv2/manifest.ttl
# lib/lv2/log.lv2/log.ttl
# lib/lv2/log.lv2/log.meta.ttl
# lib/lv2/log.lv2/logger.h
# lib/lv2/log.lv2/log.h
# lib/lv2/log.lv2/manifest.ttl
# lib/lv2/units.lv2/units.meta.ttl
# lib/lv2/units.lv2/units.h
# lib/lv2/units.lv2/units.ttl
# lib/lv2/units.lv2/manifest.ttl
# lib/lv2/time.lv2/time.ttl
# lib/lv2/time.lv2/time.meta.ttl
# lib/lv2/time.lv2/manifest.ttl
# lib/lv2/time.lv2/time.h
# lib/lv2/patch.lv2/patch.meta.ttl
# lib/lv2/patch.lv2/patch.h
# lib/lv2/patch.lv2/patch.ttl
# lib/lv2/patch.lv2/manifest.ttl
# lib/lv2/port-props.lv2/port-props.ttl
# lib/lv2/port-props.lv2/port-props.h
# lib/lv2/port-props.lv2/port-props.meta.ttl
# lib/lv2/port-props.lv2/manifest.ttl
# lib/lv2/uri-map.lv2/uri-map.ttl
# lib/lv2/uri-map.lv2/uri-map.h
# lib/lv2/uri-map.lv2/uri-map.meta.ttl
# lib/lv2/uri-map.lv2/manifest.ttl
# share/lv2specgen/DTD/xhtml-bdo-1.mod
# share/lv2specgen/DTD/xhtml-charent-1.mod
# share/lv2specgen/DTD/xhtml-style-1.mod
# share/lv2specgen/DTD/xhtml-inlstyle-1.mod
# share/lv2specgen/DTD/xhtml-script-1.mod
# share/lv2specgen/DTD/xhtml-edit-1.mod
# share/lv2specgen/DTD/xhtml-form-1.mod
# share/lv2specgen/DTD/xhtml-inlphras-1.mod
# share/lv2specgen/DTD/xhtml-param-1.mod
# share/lv2specgen/DTD/xhtml-special.ent
# share/lv2specgen/DTD/xhtml-target-1.mod
# share/lv2specgen/DTD/xhtml-image-1.mod
# share/lv2specgen/DTD/xhtml-list-1.mod
# share/lv2specgen/DTD/xhtml-legacy-1.mod
# share/lv2specgen/DTD/xhtml-basic-table-1.mod
# share/lv2specgen/DTD/xhtml-inlstruct-1.mod
# share/lv2specgen/DTD/xhtml-datatypes-1.mod.1
# share/lv2specgen/DTD/xhtml-pres-1.mod
# share/lv2specgen/DTD/xhtml-basic11.dtd
# share/lv2specgen/DTD/xhtml-basic11-model-1.mod
# share/lv2specgen/DTD/xhtml-events-1.mod
# share/lv2specgen/DTD/xhtml-qname-1.mod
# share/lv2specgen/DTD/xhtml-lat1.ent
# share/lv2specgen/DTD/xhtml-inputmode-1.mod
# share/lv2specgen/DTD/xhtml-inlpres-1.mod
# share/lv2specgen/DTD/xhtml-ssismap-1.mod
# share/lv2specgen/DTD/xhtml-base-1.mod
# share/lv2specgen/DTD/xhtml-csismap-1.mod
# share/lv2specgen/DTD/xhtml-blkpres-1.mod
# share/lv2specgen/DTD/xhtml-link-1.mod
# share/lv2specgen/DTD/xhtml-hypertext-1.mod
# share/lv2specgen/DTD/xhtml-rdfa-1.dtd
# share/lv2specgen/DTD/xhtml-blkphras-1.mod
# share/lv2specgen/DTD/xhtml-metaAttributes-1.mod
# share/lv2specgen/DTD/xhtml-table-1.mod
# share/lv2specgen/DTD/xhtml-struct-1.mod
# share/lv2specgen/DTD/xhtml-framework-1.mod
# share/lv2specgen/DTD/xhtml-blkstruct-1.mod
# share/lv2specgen/DTD/xhtml-rdfa-model-1.mod
# share/lv2specgen/DTD/xhtml-attribs-1.mod
# share/lv2specgen/DTD/xhtml-meta-1.mod
# share/lv2specgen/DTD/xhtml-text-1.mod
# share/lv2specgen/DTD/xhtml-datatypes-1.mod
# share/lv2specgen/DTD/xhtml-object-1.mod
# share/lv2specgen/DTD/xhtml-symbol.ent
# share/lv2specgen/style.css
# share/lv2specgen/template.html
# bin/lv2_validate
# bin/lv2specgen.py
