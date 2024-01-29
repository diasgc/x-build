#!/bin/bash

# cpu av8 av7 x86 x64
# NDK + +  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='ffmpeg'
dsc='FFmpeg is the leading multimedia framework'
lic='GLP-2.0'
vrs='n6.2-dev^{}'
src='https://github.com/FFmpeg/FFmpeg.git'
cfg='ac'
eta='777'
mki='install'
make_install='install'
dep=

ac_nohost=true
#ac_nosysroot=true
#ac_nopic=true

lst_inc=''
lst_lib=''
lst_bin=''

test "$TERM_PROGRAM" == "vscode" && \
     printf "\nThis won't run on VSCODE.\nExiting...\n\n" && \
     exit 0

applyOptions(){
    IFS='|' read -r -a keys <<<"$1"
    for k in "${keys[@]}"; do
        IFS=',' read -r -a field <<<"$k"
        dep+=(${field[0]})
        opt+=(${field[1]/;/ })
    done
}

zenSplit(){
    IFS='|' read -r -a keys <<<"$1"
    echo "${keys[@]}"
}

zenTagList(){
    tagList=$(git ls-remote $src | grep 'refs/tags/' | sed 's/^.*refs\/tags\///g')
    echo "$tagList" | grep '^n' | tail -n 6 | sed -z 's/\n/|/g'
}

archOpts=(
    TRUE    NATIVE          "native"
    false   android-arm64   "aa8"
    false   android-armv7   "aa7"
    false   android-x64     "aa64"
    false   linux-arm64     "la8"
    false   linux-armv7     "la7"
    false   linux-x64       "la7"
    false   windows-arm64   "wa8"
    false   windows-x64     "wx64"
)

sizeOpts=(
    TRUE    Performance     ","
    false   Size            ",--enable-small;--disable-debug"
)

audioOpts=(

    false   FDK-AAC         "fdk-aac,--enable-libfdk-aac"
    TRUE    LameMP3         "lame,--enable-libmp3lame"
    false   OpenCAmr-NB     "opencore-amr,--enable-libopencore-amrnb"
    false   OpenCAmr-WB     "opencore-amr,--enable-libopencore-amrwb"
    TRUE    Opus            "opus,--enable-libopus"
    false   ShineMP3        "shine,--enable-libshine"
    false   SnappyCompress  "snappy,--enable-libsnappy"
    false   Speex           "speex,--enable-libspeex"
    TRUE    Vorbis          "vorbis,--enable-libvorbis"
    false   VoAmr-WB        "vo-amrwbenc,--enable-libvo-amrwbenc"
)

audioOptsExt=(
    false   AviSynth        "avisynth,--enable-avisynth"
    false   Chromaprint     "chromaprint,--enable-chromaprint"
    false   DSP-bs2b        "libbs2b,--enable-libbs2b"
    false   Celt            "celt,--enable-libcelt"
    false   Codec2          "codec2,--enable-libcodec2"
    false   Flite           "flite,--enable-libflite"
    false   GameMusicEmu    "libgme,--enable-libgme"
    false   GSM             "libgsm,--enable-libgsm"
    false   iLBC            "libilbc,--enable-libilbc"
    false   ModPlug         "libmodplug,--enable-libmodplug"
    false   LADSPA-Filter   "ladspa,--enable-ladspa"
    false   OpenMTP         "openmtp,--enable-libopenmpt"
    false   PulseAudio      "libpulse,--enable-libpulse"
    false   Rubberband      "librubberband,--enable-librubberband"
    false   SoXresampler    "soxr,--enable-libsoxr"
    false   TwoLame-MP2     "twolame,--enable-libtwolame"
    false   LV2-AudioFilter "lv2,--enable-lv2"
    false   SofalizerFilter "libmysofa,--enable-libmysofa"
    false   PocketSphinx    "pocketsphinx,--enable-pocketsphinx"
    false   VapourSynth     "vapoursynth,--enable-vapoursynth"
)

videoOptsExt=(
    false	codec2	    "libcodec2,--enable-libcodec2"
    false	dav1d	    "libdav1d,--enable-libdav1d"
    false	davs2	    "libdavs2,--enable-libdavs2"
    false   frei0r      "frei0r,--enable-frei0r"
    false	glslang	    "libglslang,--enable-libglslang"
    false	iec61883	"libiec61883,--enable-libiec61883"
    false	lensfun	    "lensfun,--enable-liblensfun"
    false	mysofa	    "libmysofa,--enable-libmysofa"
    false	opencv	    "libopencv,--enable-libopencv"
    false	openh264	"libopenh264,--enable-libopenh264"
    false	openjpeg	"libopenjpeg,--enable-libopenjpeg"
    false	openmpt	    "libopenmpt,--enable-libopenmpt"
    false	rav1e	    "librav1e,--enable-librav1e"
    false	rist	    "librist,--enable-librist"
    false	rsvg	    "librsvg,--enable-librsvg"
    false	svtav1	    "svtav1,--enable-libsvtav1"
    false	theora	    "libtheora,--enable-libtheora"
    false	uavs3d	    "libuavs3d,--enable-libuavs3d"
    false	vmaf	    "libvmaf,--enable-libvmaf"
    false	xavs	    "xavs,--enable-libxavs"
    false	xavs2	    "xavs2,--enable-libxavs2"
    false   xEV/Mpeg5   "xeve;xevd,--enable-libxeve;--enable-libxevd"
    false	zimg	    "libzimg,--enable-libzimg"
    false	zvbi	    "libzvbi,--enable-libzvbi"
)
videoOpts=(
    false	aom	        "libaom,--enable-libaom"
    TRUE	kvazaar     "kvazaar,--enable-libkvazaar"
    TRUE	vidstab	    "vidstab,--enable-libvidstab"
    TRUE	vpx	        "vpx,--enable-libvpx"
    TRUE	webp	    "libwebp,--enable-libwebp"
    TRUE	x264	    "x264,--enable-libx264"
    TRUE	x265	    "x265,--enable-libx265"
    false	xvid	    "xvidcore,--enable-libxvid"
)

netOptsExt=(
    false	gcrypt      "gcrypt,--enable-gcrypt"
    false	rabbitmq	"librabbitmq,--enable-librabbitmq"
    false	rtmp        "librtmp,--enable-librtmp"
    false	smbclient	"libsmbclient,--enable-libsmbclient"
    false	srt	        "libsrt,--enable-libsrt"
    false	ssh	        "libssh,--enable-libssh"
    false	tls	        "libtls,--enable-libtls"
    false	zmq	        "libzmq,--enable-libzmq"
)
netOpts=(
    false	gmp         "gmp,--enable-gmp"
    false	gnutls      "gnutls,--enable-gnutls"
    false	mbedtls	    "mbedtls,--enable-mbedtls"
    false	openssl	    "openssl,--enable-openssl"
)

subOptsExt=(
    false	aribb24	    "libaribb24,--enable-libaribb24"
    false	ass	        "libass,--enable-libass"
    false	caca	    "libcaca,--enable-libcaca"
    false	fontconfig	"libfontconfig,--enable-libfontconfig"
)
subOpts=(
    false	freetype	"libfreetype,--enable-libfreetype"
    false	fribidi	    "libfribidi,--enable-libfribidi"
    false	tesseract	"tesseract,--enable-libtesseract"
)

ioOptsExt=(
    false	decklink	"decklink,--enable-decklink"
    false	dc1394  	"libdc1394,--enable-libdc1394"
    false	klvanc	    "libklvanc,--enable-libklvanc"
    false	openvino	"libopenvino,--enable-libopenvino"
    false	rist	    "librist,--enable-librist"
    false	tensorflow	"libtensorflow,--enable-libtensorflow"
    false	v4l2	    "libv4l2,--enable-libv4l2"
    false	xcb	        "libxcb,--enable-libxcb"
    false	xcb-shape	"libxcb-shape,--enable-libxcb-shape"
    false	xcb-shm	    "libxcb-shm,--enable-libxcb-shm"
    false	xcb-xfixes	"libxcb-xfixes,--enable-libxcb-xfixes"
    false	xml2	    "libxml2,--enable-libxml2"
)

ioOpts=(
    TRUE	jni         ",--enable-jni"
    false	jack	    "libjack,--enable-libjack"
    false	mediacodec	",--enable-mediacodec"
    false	mediafoundation	"mediafoundation,--enable-mediafoundation"
    false	openal	    "openal,--enable-openal"
    false	opencl	    "opencl,--enable-opencl"
    false	opengl	    "opengl,--enable-opengl"
    false	vulkan	    ",--enable-vulkan"
)


zen=$(zenity --width=500 --forms --title "Build Options" \
    --add-combo "Target Arch" --combo-values "native|android-armv8|android-armv7|android-x64|linux-arm64|linux-x64|windows-arm64|windows-x64" \
    --add-combo "Source Version" --combo-values "$(zenTagList)" \
    --add-combo "Link Type" --combo-values "static|shared|both" \
    --add-combo "Build Executables" --combo-values "yes|no" \
    --add-combo "Optimize for" --combo-values "Size|Performance" \
    --add-combo "Audio External Libs" --combo-values "none|basic|extended" \
    --add-combo "Video External Libs" --combo-values "none|basic|extended" \
    --add-combo "Net External Libs" --combo-values "none|basic|extended" \
    --add-combo "Subtitle External Libs" --combo-values "none|basic|extended" \
    --add-combo "I/O External Libs" --combo-values "none|basic|extended" \
    --add-entry "Version Name" \
)

#0 android-armv8
#1 n6.2-dev^{}
#2 static yes Performance basic basic none none 6.2-basicAV
extopts=
mainOpts=( $(zenSplit ${zen[@]}) )

argList=( "${mainOpts[0]}" )
bra=${mainOpts[1]}
test "x${mainOpts[2]}" != "xshared" && argList+=( "--static" )
test "x${mainOpts[2]}" != "xstatic" && argList+=( "--shared" )
test "x${mainOpts[3]}" != "xno" && argList+=( "--bin" )
test "x${mainOpts[4]}" != "xPerformance" && extopts="--enable-small"

zenArgs=(
    --print-column=3 --hide-column=3 
    --height=400 --width=300 
    --column "Use" --column "Feature" --column "Value"
)

dep=
opt=

if [ "x${mainOpts[5]}" != "xnone" ]; then
    test "x${mainOpts[5]}" != "xbasic" && audioOpts+=( "${audioOptsExt[@]}" )
    applyOptions $(zenity --list --checklist --text="Audio ${mainOpts[5]} Features" ${zenArgs[@]} ${audioOpts[@]})
fi

if [ "x${mainOpts[6]}" != "xnone" ]; then
    test "x${mainOpts[6]}" != "xbasic" && videoOpts+=( "${videoOptsExt[@]}" )
    applyOptions $(zenity --list --checklist --text="Audio ${mainOpts[6]} Features" ${zenArgs[@]} ${videoOpts[@]})
fi

if [ "x${mainOpts[7]}" != "xnone" ]; then
    test "x${mainOpts[7]}" == "xbasic" && netOpts+=( "${netOptsExt[@]}" )
    applyOptions $(zenity --list --checklist --text="Audio ${mainOpts[7]} Features" ${zenArgs[@]} ${netOpts[@]})
fi

if [ "x${mainOpts[8]}" != "xnone" ]; then
    test "x${mainOpts[8]}" == "xbasic" && subOpts+=( "${subOptsExt[@]}" )
    applyOptions $(zenity --list --checklist --text="Audio ${mainOpts[8]} Features" ${zenArgs[@]} ${subOpts[@]})
fi

if [ "x${mainOpts[9]}" != "xnone" ]; then
    test "x${mainOpts[9]}" == "xbasic" && ioOpts+=( "${ioOptsExt[@]}" )
    applyOptions $(zenity --list --checklist --text="Audio ${mainOpts[9]} Features" ${zenArgs[@]} ${ioOpts[@]})
fi

extraversion="${mainOpts[10]}"

echo "arguments: ${argList[@]}"
echo "ffmpeg options: ${opt[@]}"
echo "lib dependencies: ${dep[@]}"
dep=$(echo "${dep[@]}")
set -- "${argList[@]}"
source xbuild

#test "x${mainOpts[2]}" != "xshared" && build_static=true
#test "x${mainOpts[2]}" != "xstatic" && build_shared=true
#test "x${mainOpts[3]}" != "xno" && build_bin=true

#--cross-prefix=${CROSS_PREFIX} <- remove or pkg-config cannot find aom version > 1.0.0
extopts="--pkg-config-flags=--static --enable-lto --enable-runtime-cpudetect --disable-symver --cross-prefix=${CROSS_PREFIX} --extra-version=$extraversion $extopts"
extlibs=$(echo "${opt[@]}")
nonfree=false
gpl=false
v3=false

for d in $dep; do
     case $d in
        fdk-aac|openssl) nonfree=true;;
        frei0r|vidstab|x264|x265|xavs|xvidcore) gpl=true;;
        opencore-amr) v3=true;;
     esac
done

$nonfree && extlibs+=' --enable-nonfree'
$gpl && extlibs+=' --enable-gpl'
$v3 && extlibs+=' --enable-version3'

if $build_shared; then
     extlibs+=" --enable-shared --disable-static"
fi
CSH=

$host_arm && extopts+=' --enable-neon'
$host_x86 && extopts+=' --disable-asm'

case $host_os in
    android)    CPPFLAGS+=" -Ofast -fPIC -fPIE -fblocks -Wno-implicit-const-int-float-conversion -Wno-deprecated-declarations" # -ffunction-sections -fdata-sections -Wl,--gc-sections"
                extopts+=" --disable-indev=android_camera --enable-jni --enable-mediacodec --enable-asm --enable-inline-asm --enable-pic --enable-cross-compile" #unecessary --disable-alsa
                ;;
     gnu)       extopts+=" --enable-opencl --enable-opengl --enable-pic" LDFLAGS+=" -ldl -lstdc++"
                lspci -k | grep -A 2 -i "VGA" | grep amd && extopts+=" --enable-nvenc"
                lspci -k | grep -A 2 -i "VGA" | grep nvidia && extopts+=" --enable-nvenc"
                ;;
esac

ac_config="--arch=$CPU \
     --target-os=${PLATFORM,,} \
     --cc=$CC \
     --ar=$AR \
     --strip=$STRIP \
     --disable-doc \
     --disable-htmlpages \
     --disable-ffplay \
     --pkg-config=$(which pkg-config) \
     --extra-libs=-lpthread \
     $extopts \
     $extlibs"
# make the log cleaner

NPROC=16
start