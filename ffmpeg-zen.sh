#!/bin/bash

# cpu av8 av7 x86 x64
# NDK + +  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='ffmpeg'
dsc='FFmpeg is the leading multimedia framework'
lic='GLP-2.0'
#vrs='n4.5-dev^{}'
src='https://github.com/FFmpeg/FFmpeg.git'
cfg='ac'
eta='777'
mki='install'
make_install='install'


test "$TERM_PROGRAM" == "vscode" && \
     printf "\nThis won't run on VSCODE.\nExiting...\n\n" && \
     exit 0

applyOptions(){
    oIFS="$IFS"
    IFS="|"; read -a keys <<<"$1"
    IFS=","
    for k in "${keys[@]}"; do
        read -a field <<<"$k"
        dep+=(${field[0]})
        opt+=(${field[1]/;/ })
    done
    IFS="$oFIS"
}

zenSplit(){
    oIFS="$IFS"
    IFS="|"; read -a keys <<<"$1"
    IFS="$oFIS"
    echo "${keys[@]}"
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
    false   AviSynth        "avisynth,--enable-avisynth"
    false   Chromaprint     "chromaprint,--enable-chromaprint"
    false   DSP-bs2b        "libbs2b,--enable-libbs2b"
    false   Celt            "celt,--enable-libcelt"
    false   Codec2          "codec2,--enable-libcodec2"
    false   FDK-AAC         "fdk-aac,--enable-libfdk-aac"
    false   Flite           "flite,--enable-libflite"
    false   GameMusicEmu    "libgme,--enable-libgme"
    false   GSM             "libgsm,--enable-libgsm"
    false   iLBC            "libilbc,--enable-libilbc"
    false   ModPlug         "libmodplug,--enable-libmodplug"
    false   LADSPA-Filter   "ladspa,--enable-ladspa"
    TRUE    LameMP3         "lame,--enable-libmp3lame"
    TRUE    OpenCAmr-NB     "opencore-amr,--enable-libopencore-amrnb"
    TRUE    OpenCAmr-WB     "opencore-amr,--enable-libopencore-amrwb"
    false   OpenMTP         "openmtp,--enable-libopenmpt"
    TRUE    Opus            "opus,--enable-libopus"
    false   PulseAudio      "libpulse,--enable-libpulse"
    false   Rubberband      "librubberband,--enable-librubberband"
    false   ShineMP3        "shine,--enable-libshine"
    false   SnappyCompress  "snappy,--enable-libsnappy"
    false   SoXresampler    "soxr,--enable-libsoxr"
    false   Speex           "speex,--enable-libspeex"
    false   TwoLame-MP2     "twolame,--enable-libtwolame"
    false   VoAmr-WB        "vo-amrwbenc,--enable-libvo-amrwbenc"
    TRUE    Vorbis          "vorbis,--enable-libvorbis"
    false   LV2-AudioFilter "lv2,--enable-lv2"
    false   SofalizerFilter "libmysofa,--enable-libmysofa"
    false   PocketSphinx    "pocketsphinx,--enable-pocketsphinx"
    false   VapourSynth     "vapoursynth,--enable-vapoursynth"
)

videoOpts=(
    false   frei0r      "frei0r,--enable-frei0r"
    false	aom	        "libaom,--enable-libaom"
    false	codec2	    "libcodec2,--enable-libcodec2"
    false	dav1d	    "libdav1d,--enable-libdav1d"
    false	davs2	    "libdavs2,--enable-libdavs2"
    false	glslang	    "libglslang,--enable-libglslang"
    false	iec61883	"libiec61883,--enable-libiec61883"
    false	kvazaar     "libkvazaar,--enable-libkvazaar"
    false	lensfun	    "liblensfun,--enable-liblensfun"
    false	mysofa	    "libmysofa,--enable-libmysofa"
    false	opencv	    "libopencv,--enable-libopencv"
    false	openh264	"libopenh264,--enable-libopenh264"
    false	openjpeg	"libopenjpeg,--enable-libopenjpeg"
    false	openmpt	    "libopenmpt,--enable-libopenmpt"
    false	rav1e	    "librav1e,--enable-librav1e"
    false	rist	    "librist,--enable-librist"
    false	rsvg	    "librsvg,--enable-librsvg"
    false	svtav1	    "libsvtav1,--enable-libsvtav1"
    false	theora	    "libtheora,--enable-libtheora"
    false	uavs3d	    "libuavs3d,--enable-libuavs3d"
    false	vidstab	    "libvidstab,--enable-libvidstab"
    false	vmaf	    "libvmaf,--enable-libvmaf"
    TRUE	vpx	        "libvpx,--enable-libvpx"
    TRUE	webp	    "libwebp,--enable-libwebp"
    TRUE	x264	    "libx264,--enable-libx264"
    TRUE	x265	    "libx265,--enable-libx265"
    false	xavs	    "libxavs,--enable-libxavs"
    false	xavs2	    "libxavs2,--enable-libxavs2"
    TRUE	xvid	    "libxvid,--enable-libxvid"
    false	zimg	    "libzimg,--enable-libzimg"
    false	zvbi	    "libzvbi,--enable-libzvbi"
)

subOpts=(
    false	aribb24	    "libaribb24,--enable-libaribb24"
    false	ass	        "libass,--enable-libass"
    false	caca	    "libcaca,--enable-libcaca"
    false	fontconfig	"libfontconfig,--enable-libfontconfig"
    false	freetype	"libfreetype,--enable-libfreetype"
    false	fribidi	    "libfribidi,--enable-libfribidi"
    false	tesseract	"tesseract,--enable-libtesseract"
)

netOpts=(
    false	gcrypt      "gcrypt,--enable-gcrypt"
    false	gmp         "gmp,--enable-gmp"
    false	gnutls      "gnutls,--enable-gnutls"
    false	rabbitmq	"librabbitmq,--enable-librabbitmq"
    false	rtmp        "librtmp,--enable-librtmp"
    false	smbclient	"libsmbclient,--enable-libsmbclient"
    false	srt	        "libsrt,--enable-libsrt"
    false	ssh	        "libssh,--enable-libssh"
    false	tls	        "libtls,--enable-libtls"
    false	zmq	        "libzmq,--enable-libzmq"
    false	mbedtls	    "mbedtls,--enable-mbedtls"
    false	openssl	    "openssl,--enable-openssl"
)

ioOpts=(
    false	decklink	"decklink,--enable-decklink"
    false	jni         ",--enable-jni"
    false	ladspa	    "ladspa,--enable-ladspa"
    false	dc1394  	"libdc1394,--enable-libdc1394"
    false	jack	    "libjack,--enable-libjack"
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
    false	mediacodec	",--enable-mediacodec"
    false	mediafoundation	"mediafoundation,--enable-mediafoundation"
    false	openal	    "openal,--enable-openal"
    false	opencl	    "opencl,--enable-opencl"
    false	opengl	    "opengl,--enable-opengl"
    false	vulkan	    "vulkan,--enable-vulkan"
)
src_ver=
mainOpts=$(zenity --width=500 --forms --title "Build Options" \
    --add-combo "Target Arch" --combo-values "native|android-armv8|android-armv7|android-x64|linux-arm64|linux-x64|windows-arm64|windows-x64" \
    --add-combo "Source Version" --combo-values "static|shared|both" \
    --add-combo "Link Type" --combo-values "static|shared|both" \
    --add-combo "Build Executables" --combo-values "yes|no" \
    --add-combo "Optimize for" --combo-values "Size|Performance" \
    --add-combo "Audio External Libs" --combo-values "none|basic|extended" \
    --add-combo "Video External Libs" --combo-values "none|basic|extended" \
    --add-combo "Subtitle External Libs" --combo-values "none|basic|extended" \
    --add-combo "I/O External Libs" --combo-values "none|basic|extended" \
    --add-entry "Version Name" \
)
mainOpts=( $(zenSplit ${mainOpts[@]}) )
echo ${mainOpts[@]}

exit 0

zenArgs=(
    --print-column=3 --hide-column=3 
    --height=400 --width=300 
    --column "Use" --column "Feature" --column "Value"
)

dep=
opt=

applyOptions $(zenity --list --radiolist --text="Target" ${zenArgs[@]} ${archOpts[@]})
test -z "${dep[@]}" && exit 0

archs=${dep[@]}
echo ${archs[@]}
dep=()

applyOptions $(zenity --list --checklist --text="Audio Features" ${zenArgs[@]} ${audioOpts[@]})

applyOptions $(zenity --list --checklist --text="Video Features" ${zenArgs[@]} ${videoOpts[@]})

applyOptions $(zenity --list --checklist --text="Subtitle Features" ${zenArgs[@]} ${subOpts[@]})

applyOptions $(zenity --text="I/O Features" ${zenArgs[@]} ${ioOpts[@]})

applyOptions $(zenity --list --radiolist --text="Size/Performance" ${zenArgs[@]} ${sizeOpts[@]})

extraversion=$(zenity --entry --text "Version Name (no spaces)")


echo "archs: ${archs[@]}"
echo "ffmpeg options: ${opt[@]}"
echo "lib dependencies: ${dep[@]}"

exit 0

# cpu av8 av7 x86 x64
# NDK + +  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

lib='ffmpeg'
dsc='FFmpeg is the leading multimedia framework'
lic='GLP-2.0'
vrs='n4.5-dev^{}'
src='https://github.com/FFmpeg/FFmpeg.git'
cfg='ac'
eta='777'
mki='install'
make_install='install'
#cb0='--disable-programs'

ac_nohost=true
ac_nosysroot=true
ac_nopic=true

lst_inc=''
lst_lib=''
lst_bin=''

. xbuild

#--cross-prefix=${CROSS_PREFIX} <- remove or pkg-config cannot find aom version > 1.0.0
extopts="--pkg-config-flags=--static --enable-lto --enable-runtime-cpudetect --disable-symver --cross-prefix=${CROSS_PREFIX}"
nonfree=false
gpl=false
v3=false

for d in $dep; do
     case $d in
        fdk-aac|openssl) nonfree=true;;
        frei0r|vidstab|x264|x265|xavs|xvidcore) gpl=true;;
     esac
done

$nonfree && extlibs+=' --enable-nonfree'
$gpl && extlibs+=' --enable-gpl'
$v3 && extlibs+=' --enable-version3'

if $build_shared; then
     CSH="--enable-shared --disable-static"
else
     CSH="--disable-shared --enable-static"
fi

$host_arm && extopts+=' --enable-neon'
$host_x86 && extopts+=' --disable-asm'

case $host_os in
    android)    CPPFLAGS+=" -Ofast -fPIC -fPIE  -Wno-implicit-const-int-float-conversion -Wno-deprecated-declarations"
                extopts+=" --disable-alsa --enable-jni --enable-cross-compile "
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

<<'OPTIONS'

AUDIO
  --enable-avisynth        enable reading of AviSynth script files [no]
  --enable-chromaprint     enable audio fingerprinting with chromaprint [no]
  --enable-ladspa          enable LADSPA audio filtering [no]
  --enable-libbs2b         enable bs2b DSP library [no]
  --enable-libcelt         enable CELT decoding via libcelt [no]
  --enable-libcodec2       enable codec2 en/decoding using libcodec2 [no]
  --enable-libfdk-aac      enable AAC de/encoding via libfdk-aac [no]
  --enable-libflite        enable flite (voice synthesis) support via libflite [no]
  --enable-libgme          enable Game Music Emu via libgme [no]
  --enable-libgsm          enable GSM de/encoding via libgsm [no]
  --enable-libilbc         enable iLBC de/encoding via libilbc [no]
  --enable-libmodplug      enable ModPlug via libmodplug [no]
  --enable-libmp3lame      enable MP3 encoding via libmp3lame [no]
  --enable-libopencore-amrnb enable AMR-NB de/encoding via libopencore-amrnb [no]
  --enable-libopencore-amrwb enable AMR-WB decoding via libopencore-amrwb [no]
  --enable-libopenmpt      enable decoding tracked files via libopenmpt [no]
  --enable-libopus         enable Opus de/encoding via libopus [no]
  --enable-libpulse        enable Pulseaudio input via libpulse [no]
  --enable-librubberband   enable rubberband needed for rubberband filter [no]
  --enable-libshine        enable fixed-point MP3 encoding via libshine [no]
  --enable-libsnappy       enable Snappy compression, needed for hap encoding [no]
  --enable-libsoxr         enable Include libsoxr resampling [no]
  --enable-libspeex        enable Speex de/encoding via libspeex [no]
  --enable-libtwolame      enable MP2 encoding via libtwolame [no]
  --enable-libvo-amrwbenc  enable AMR-WB encoding via libvo-amrwbenc [no]
  --enable-libvorbis       enable Vorbis en/decoding via libvorbis,
                           native implementation exists [no]
  --enable-lv2             enable LV2 audio filtering [no]
  --enable-libmysofa       enable libmysofa, needed for sofalizer filter [no]
  --enable-pocketsphinx    enable PocketSphinx, needed for asr filter [no]
  --enable-vapoursynth     enable VapourSynth demuxer [no]

VIDEO
  --enable-frei0r          enable frei0r video filtering [no]
  --enable-libaom          enable AV1 video encoding/decoding via libaom [no]
  --enable-libdav1d        enable AV1 decoding via libdav1d [no]
  --enable-libdavs2        enable AVS2 decoding via libdavs2 [no]
  --enable-libkvazaar      enable HEVC encoding via libkvazaar [no]
  --enable-liblensfun      enable lensfun lens correction [no]
  --enable-libopencv       enable video filtering via libopencv [no]
  --enable-libopenh264     enable H.264 encoding via OpenH264 [no]
  --enable-libopenjpeg     enable JPEG 2000 de/encoding via OpenJPEG [no]
  --enable-librav1e        enable AV1 encoding via rav1e [no]
  --enable-librsvg         enable SVG rasterization via librsvg [no]
  --enable-libsvtav1       enable AV1 encoding via SVT [no]
  --enable-libtheora       enable Theora encoding via libtheora [no]
  --enable-libuavs3d       enable AVS3 decoding via libuavs3d [no]
  --enable-libv4l2         enable libv4l2/v4l-utils [no]
  --enable-libvidstab      enable video stabilization using vid.stab [no]
  --enable-libvmaf         enable vmaf filter via libvmaf [no]
  --enable-libvpx          enable VP8 and VP9 de/encoding via libvpx [no]
  --enable-libwebp         enable WebP encoding via libwebp [no]
  --enable-libx264         enable H.264 encoding via x264 [no]
  --enable-libx265         enable HEVC encoding via x265 [no]
  --enable-libxavs         enable AVS encoding via xavs [no]
  --enable-libxavs2        enable AVS2 encoding via xavs2 [no]
  --enable-libxvid         enable Xvid encoding via xvidcore,
                           native MPEG-4/Xvid encoder exists [no]
  --enable-libzimg         enable z.lib, needed for zscale filter [no]

NET
  --enable-gcrypt          enable gcrypt, needed for rtmp(t)e support
                           if openssl, librtmp or gmp is not used [no]
  --enable-gmp             enable gmp, needed for rtmp(t)e support
                           if openssl or librtmp is not used [no]
  --enable-gnutls          enable gnutls, needed for https support
                           if openssl, libtls or mbedtls is not used [no]
  --enable-librist         enable RIST via librist [no]
  --enable-librabbitmq     enable RabbitMQ library [no]
  --enable-librtmp         enable RTMP[E] support via librtmp [no]
  --enable-libsmbclient    enable Samba protocol via libsmbclient [no]
  --enable-libsrt          enable Haivision SRT protocol via libsrt [no]
  --enable-libssh          enable SFTP protocol via libssh [no]
  --enable-libtls          enable LibreSSL (via libtls), needed for https support
                           if openssl, gnutls or mbedtls is not used [no]
  --enable-libzmq          enable message passing via libzmq [no]
  --enable-mbedtls         enable mbedTLS, needed for https support
                           if openssl, gnutls or libtls is not used [no]
  --enable-openssl         enable openssl, needed for https support
                           if gnutls, libtls or mbedtls is not used [no]


SUB
  --enable-libaribb24      enable ARIB text and caption decoding via libaribb24 [no]
  --enable-libass          enable libass subtitles rendering,
                           needed for subtitles and ass filter [no]
  --enable-libcaca         enable textual display using libcaca [no]
  --enable-libfontconfig   enable libfontconfig, useful for drawtext filter [no]
  --enable-libfreetype     enable libfreetype, needed for drawtext filter [no]
  --enable-libfribidi      enable libfribidi, improves drawtext filter [no]                         
  --enable-libtesseract    enable Tesseract, needed for ocr filter [no]
  --enable-libzvbi         enable teletext support via libzvbi [no]

EXTRAS
  --enable-jni             enable JNI support [no]
  --enable-libbluray       enable BluRay reading using libbluray [no]
  --enable-libcdio         enable audio CD grabbing with libcdio [no]
  --enable-libdc1394       enable IIDC-1394 grabbing using libdc1394
                           and libraw1394 [no]
  --enable-libglslang      enable GLSL->SPIRV compilation via libglslang [no]
  --enable-libiec61883     enable iec61883 via libiec61883 [no]
  --enable-libtensorflow   enable TensorFlow as a DNN module backend
                           for DNN based filters like sr [no]
  --enable-libjack         enable JACK audio sound server [no]
  --enable-libklvanc       enable Kernel Labs VANC processing [no]
  --enable-libopenvino     enable OpenVINO as a DNN module backend
                           for DNN based filters like dnn_processing [no]
  --enable-libxml2         enable XML parsing using the C library libxml2, needed
                           for dash demuxing support [no]
  --enable-decklink        enable Blackmagic DeckLink I/O support [no]
  --enable-mediacodec      enable Android MediaCodec support [no]
  --enable-openal          enable OpenAL 1.1 capture support [no]
  --enable-opencl          enable OpenCL processing [no]
  --enable-opengl          enable OpenGL rendering [no]
  --enable-vulkan          enable Vulkan code [no]  


AUTODETECT
  --disable-alsa           disable ALSA support [autodetect]
  --disable-appkit         disable Apple AppKit framework [autodetect]
  --disable-avfoundation   disable Apple AVFoundation framework [autodetect]
  --disable-bzlib          disable bzlib [autodetect]
  --disable-coreimage      disable Apple CoreImage framework [autodetect]
  --disable-iconv          disable iconv [autodetect]

  --enable-libxcb          enable X11 grabbing using XCB [autodetect]
  --enable-libxcb-shm      enable X11 grabbing shm communication [autodetect]
  --enable-libxcb-xfixes   enable X11 grabbing mouse rendering [autodetect]
  --enable-libxcb-shape    enable X11 grabbing shape rendering [autodetect]
  --disable-lzma           disable lzma [autodetect]
  --disable-sdl2           disable sdl2 [autodetect]
  --disable-sndio          disable sndio support [autodetect]
  --disable-schannel       disable SChannel SSP, needed for TLS support on
                           Windows if openssl and gnutls are not used [autodetect]
  --disable-securetransport disable Secure Transport, needed for TLS support
                           on OSX if openssl and gnutls are not used [autodetect]
  --disable-xlib           disable xlib [autodetect]
  --disable-zlib           disable zlib [autodetect]


OPTIONS