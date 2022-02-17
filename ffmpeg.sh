#!/bin/bash
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
cb0='--disable-programs'

ac_nohost=true
ac_nosysroot=true
ac_nopic=true

lst_inc=''
lst_lib=''
lst_bin=''

#gmp gnutls
#fontconfig freetype fribidi libass
#lame libilbc libvorbis opencore-amr opus shine snappy soxr speex twolame vo-amrwbenc
#dav1d kvazaar libtheora libvpx libwebp vid.stab x264 x265 xvidcore
#libiconv libxml2 zlib bzip2
#MediaCodec jni OpenCL

lst_opts_aud='avisynth chromaprint libbs2b libcelt libfdk-aac 
libflite libgme libgsm libilbc libmodplug libmp3lame 
libopencore-amrnb libopencore-amrwb libopus libpulse 
librubberband libshine libsnappy libsoxr libspeex libtwolame 
libvo-amrwbenc libvorbis lv2 pocketsphinx vapoursynth'

lst_opts_vid='frei0r libaom libcodec2 libdav1d libdavs2 
libglslang libiec61883 libkvazaar liblensfun libmysofa 
libopencv libopenh264 libopenjpeg libopenmpt librav1e librist 
librsvg libsvtav1 libtheora libuavs3d libvidstab libvmaf libvpx 
libwebp libx264 libx265 libxavs libxavs2 libxcb libxcb-shape 
libxcb-shm libxcb-xfixes libxvid libzimg libzvbi'

lst_opts_sub='libaribb24 libass libcaca libfontconfig libfreetype 
libfribidi libtesseract'

lst_opts_net='gcrypt gmp gnutls librabbitmq librtmp libsmbclient
libsrt libssh libtls libzmq mbedtls openssl'

lst_opts_io='decklink jni ladspa libdc1394 libjack libklvanc libopenvino
librist librsvg libtensorflow libv4l2 libxcb libxcb-shape libxcb-shm libxcb-xfixes
libxml2 mediacodec mediafoundation openal opencl opengl vulkan'

lst_opts="$lst_opts_aud $lst_opts_vid $lst_opts_sub $lst_opts_net $lst_opts_io"

#dep='zlib bzip2 gmp libiconv lzma libxml2'

extraOpts(){
     case $1 in
          --audio) dep+=" lame libvorbis opus fdk-aac";;
          --video) dep+=" aom libvpx libwebp vidstab x264 x265 xvidcore";;
          --net) dep+=" libressl";;
          --*) [ -f "${1:2}.sh" ] && dep+=" ${1:2}"
               ;;
     esac
}

. xbuilder.sh

nonfree=false
gpl=false
v3=false

for d in $dep; do
     case $d in
          lame) extlibs+=" --enable-libmp3lame";;
          fdk-aac) extlibs+=" --enable-libfdkaac" nonfree=true;;
          openssl) extlibs+=" --enable-openssl" nonfree=true;;
          frei0r) extlibs+=' --enable-frei0r' gpl=true;;
          libcdio) extlibs+=' --enable-frei0r' gpl=true;;
          librubberband) extlibs+=' --enable-frei0r' gpl=true;;
          vidstab) extlibs+=' --enable-frei0r' gpl=true;;
          x264) extlibs+=' --enable-libx264' gpl=true;;
          x265) extlibs+=' --enable-libx265' gpl=true;;
          xavs) extlibs+=' --enable-libxavs' gpl=true;;
          xvidcore) extlibs+=' --enable-libxvid' gpl=true;;
          opencore-amr) extlibs+=" --enable-libopencore-amrnb --enable-libopencore-amrwb";;
          *) if [ -z "${lst_opts##*${1}*}" ] || [ -z "${lst_opts##*lib${1}*}" ]; then
                    extlibs+=" --enable-${1}"
               fi
               ;;
     esac
done

extopts="--pkg-config-flags=--static --enable-lto --enable-runtime-cpudetect --disable-symver --cross-prefix=${CROSS_PREFIX}-"

$nonfree && extlibs+=' --enable-nonfree'
$gpl && extlibs+=' --enable-gpl'
$v3 && extlibs+=' --enable-version3'

if $build_shared; then
     CSH="--enable-shared --disable-static"
else
     CSH="--disable-shared --enable-static"
fi

#extlibs="--enable-libmp3lame --enable-libvorbis --enable-libx265 --enable-libopus --enable-libaom --enable-frei0r --enable-gpl"

$host_arm && extopts+=' --enable-neon'
$host_x86 && extopts+=' --disable-asm'
$build_arch
case $host_os in
     android) CPPFLAGS+=" -Ofast -fPIC -fPIE  -Wno-implicit-const-int-float-conversion -Wno-deprecated-declarations"
          extopts+=" --disable-alsa --enable-opencl --enable-jni --enable-vulkan --enable-opengl --enable-cross-compile "
          ;;
     gnu) extopts+=" --enable-opencl --enable-nvenc --enable-opengl --enable-pic" LDFLAGS+=" -ldl -lstdc++";;
esac

ac_config="--arch=$CPU \
     --target-os=${PLATFORM,,} \
     --cc=$CC \
     --ar=$AR \
     --strip=$STRIP \
     --disable-doc \
     --disable-htmlpages \
     --disable-ffplay \
     --extra-libs=-lpthread \
     $extopts \
     $extlibs"

# make the log cleaner

NPROC=16
start

<<'OPTIONS'
  --disable-alsa           disable ALSA support [autodetect]
  --disable-appkit         disable Apple AppKit framework [autodetect]
  --disable-avfoundation   disable Apple AVFoundation framework [autodetect]
  --enable-avisynth        enable reading of AviSynth script files [no]
  --disable-bzlib          disable bzlib [autodetect]
  --disable-coreimage      disable Apple CoreImage framework [autodetect]
  --enable-chromaprint     enable audio fingerprinting with chromaprint [no]
  --enable-frei0r          enable frei0r video filtering [no]
  --enable-gcrypt          enable gcrypt, needed for rtmp(t)e support
                           if openssl, librtmp or gmp is not used [no]
  --enable-gmp             enable gmp, needed for rtmp(t)e support
                           if openssl or librtmp is not used [no]
  --enable-gnutls          enable gnutls, needed for https support
                           if openssl, libtls or mbedtls is not used [no]
  --disable-iconv          disable iconv [autodetect]
  --enable-jni             enable JNI support [no]
  --enable-ladspa          enable LADSPA audio filtering [no]
  --enable-libaom          enable AV1 video encoding/decoding via libaom [no]
  --enable-libaribb24      enable ARIB text and caption decoding via libaribb24 [no]
  --enable-libass          enable libass subtitles rendering,
                           needed for subtitles and ass filter [no]
  --enable-libbluray       enable BluRay reading using libbluray [no]
  --enable-libbs2b         enable bs2b DSP library [no]
  --enable-libcaca         enable textual display using libcaca [no]
  --enable-libcelt         enable CELT decoding via libcelt [no]
  --enable-libcdio         enable audio CD grabbing with libcdio [no]
  --enable-libcodec2       enable codec2 en/decoding using libcodec2 [no]
  --enable-libdav1d        enable AV1 decoding via libdav1d [no]
  --enable-libdavs2        enable AVS2 decoding via libdavs2 [no]
  --enable-libdc1394       enable IIDC-1394 grabbing using libdc1394
                           and libraw1394 [no]
  --enable-libfdk-aac      enable AAC de/encoding via libfdk-aac [no]
  --enable-libflite        enable flite (voice synthesis) support via libflite [no]
  --enable-libfontconfig   enable libfontconfig, useful for drawtext filter [no]
  --enable-libfreetype     enable libfreetype, needed for drawtext filter [no]
  --enable-libfribidi      enable libfribidi, improves drawtext filter [no]
  --enable-libglslang      enable GLSL->SPIRV compilation via libglslang [no]
  --enable-libgme          enable Game Music Emu via libgme [no]
  --enable-libgsm          enable GSM de/encoding via libgsm [no]
  --enable-libiec61883     enable iec61883 via libiec61883 [no]
  --enable-libilbc         enable iLBC de/encoding via libilbc [no]
  --enable-libjack         enable JACK audio sound server [no]
  --enable-libklvanc       enable Kernel Labs VANC processing [no]
  --enable-libkvazaar      enable HEVC encoding via libkvazaar [no]
  --enable-liblensfun      enable lensfun lens correction [no]
  --enable-libmodplug      enable ModPlug via libmodplug [no]
  --enable-libmp3lame      enable MP3 encoding via libmp3lame [no]
  --enable-libopencore-amrnb enable AMR-NB de/encoding via libopencore-amrnb [no]
  --enable-libopencore-amrwb enable AMR-WB decoding via libopencore-amrwb [no]
  --enable-libopencv       enable video filtering via libopencv [no]
  --enable-libopenh264     enable H.264 encoding via OpenH264 [no]
  --enable-libopenjpeg     enable JPEG 2000 de/encoding via OpenJPEG [no]
  --enable-libopenmpt      enable decoding tracked files via libopenmpt [no]
  --enable-libopenvino     enable OpenVINO as a DNN module backend
                           for DNN based filters like dnn_processing [no]
  --enable-libopus         enable Opus de/encoding via libopus [no]
  --enable-libpulse        enable Pulseaudio input via libpulse [no]
  --enable-librabbitmq     enable RabbitMQ library [no]
  --enable-librav1e        enable AV1 encoding via rav1e [no]
  --enable-librist         enable RIST via librist [no]
  --enable-librsvg         enable SVG rasterization via librsvg [no]
  --enable-librubberband   enable rubberband needed for rubberband filter [no]
  --enable-librtmp         enable RTMP[E] support via librtmp [no]
  --enable-libshine        enable fixed-point MP3 encoding via libshine [no]
  --enable-libsmbclient    enable Samba protocol via libsmbclient [no]
  --enable-libsnappy       enable Snappy compression, needed for hap encoding [no]
  --enable-libsoxr         enable Include libsoxr resampling [no]
  --enable-libspeex        enable Speex de/encoding via libspeex [no]
  --enable-libsrt          enable Haivision SRT protocol via libsrt [no]
  --enable-libssh          enable SFTP protocol via libssh [no]
  --enable-libsvtav1       enable AV1 encoding via SVT [no]
  --enable-libtensorflow   enable TensorFlow as a DNN module backend
                           for DNN based filters like sr [no]
  --enable-libtesseract    enable Tesseract, needed for ocr filter [no]
  --enable-libtheora       enable Theora encoding via libtheora [no]
  --enable-libtls          enable LibreSSL (via libtls), needed for https support
                           if openssl, gnutls or mbedtls is not used [no]
  --enable-libtwolame      enable MP2 encoding via libtwolame [no]
  --enable-libuavs3d       enable AVS3 decoding via libuavs3d [no]
  --enable-libv4l2         enable libv4l2/v4l-utils [no]
  --enable-libvidstab      enable video stabilization using vid.stab [no]
  --enable-libvmaf         enable vmaf filter via libvmaf [no]
  --enable-libvo-amrwbenc  enable AMR-WB encoding via libvo-amrwbenc [no]
  --enable-libvorbis       enable Vorbis en/decoding via libvorbis,
                           native implementation exists [no]
  --enable-libvpx          enable VP8 and VP9 de/encoding via libvpx [no]
  --enable-libwebp         enable WebP encoding via libwebp [no]
  --enable-libx264         enable H.264 encoding via x264 [no]
  --enable-libx265         enable HEVC encoding via x265 [no]
  --enable-libxavs         enable AVS encoding via xavs [no]
  --enable-libxavs2        enable AVS2 encoding via xavs2 [no]
  --enable-libxcb          enable X11 grabbing using XCB [autodetect]
  --enable-libxcb-shm      enable X11 grabbing shm communication [autodetect]
  --enable-libxcb-xfixes   enable X11 grabbing mouse rendering [autodetect]
  --enable-libxcb-shape    enable X11 grabbing shape rendering [autodetect]
  --enable-libxvid         enable Xvid encoding via xvidcore,
                           native MPEG-4/Xvid encoder exists [no]
  --enable-libxml2         enable XML parsing using the C library libxml2, needed
                           for dash demuxing support [no]
  --enable-libzimg         enable z.lib, needed for zscale filter [no]
  --enable-libzmq          enable message passing via libzmq [no]
  --enable-libzvbi         enable teletext support via libzvbi [no]
  --enable-lv2             enable LV2 audio filtering [no]
  --disable-lzma           disable lzma [autodetect]
  --enable-decklink        enable Blackmagic DeckLink I/O support [no]
  --enable-mbedtls         enable mbedTLS, needed for https support
                           if openssl, gnutls or libtls is not used [no]
  --enable-mediacodec      enable Android MediaCodec support [no]
  --enable-mediafoundation enable encoding via MediaFoundation [auto]
  --enable-libmysofa       enable libmysofa, needed for sofalizer filter [no]
  --enable-openal          enable OpenAL 1.1 capture support [no]
  --enable-opencl          enable OpenCL processing [no]
  --enable-opengl          enable OpenGL rendering [no]
  --enable-openssl         enable openssl, needed for https support
                           if gnutls, libtls or mbedtls is not used [no]
  --enable-pocketsphinx    enable PocketSphinx, needed for asr filter [no]
  --disable-sndio          disable sndio support [autodetect]
  --disable-schannel       disable SChannel SSP, needed for TLS support on
                           Windows if openssl and gnutls are not used [autodetect]
  --disable-sdl2           disable sdl2 [autodetect]
  --disable-securetransport disable Secure Transport, needed for TLS support
                           on OSX if openssl and gnutls are not used [autodetect]
  --enable-vapoursynth     enable VapourSynth demuxer [no]
  --enable-vulkan          enable Vulkan code [no]
  --disable-xlib           disable xlib [autodetect]
  --disable-zlib           disable zlib [autodetect]
OPTIONS

# Filelist
# --------
# include/libavfilter/avfilter.h
# include/libavfilter/version.h
# include/libavfilter/buffersrc.h
# include/libavfilter/buffersink.h
# include/libswresample/swresample.h
# include/libswresample/version.h
# include/libavutil/hwcontext_vdpau.h
# include/libavutil/attributes.h
# include/libavutil/replaygain.h
# include/libavutil/opt.h
# include/libavutil/sha.h
# include/libavutil/parseutils.h
# include/libavutil/dict.h
# include/libavutil/hwcontext_opencl.h
# include/libavutil/error.h
# include/libavutil/pixfmt.h
# include/libavutil/hmac.h
# include/libavutil/buffer.h
# include/libavutil/hwcontext_videotoolbox.h
# include/libavutil/hwcontext_qsv.h
# include/libavutil/murmur3.h
# include/libavutil/avutil.h
# include/libavutil/intfloat.h
# include/libavutil/avassert.h
# include/libavutil/audio_fifo.h
# include/libavutil/mem.h
# include/libavutil/pixdesc.h
# include/libavutil/samplefmt.h
# include/libavutil/tx.h
# include/libavutil/tree.h
# include/libavutil/ripemd.h
# include/libavutil/film_grain_params.h
# include/libavutil/hwcontext_drm.h
# include/libavutil/blowfish.h
# include/libavutil/timecode.h
# include/libavutil/display.h
# include/libavutil/log.h
# include/libavutil/threadmessage.h
# include/libavutil/xtea.h
# include/libavutil/aes.h
# include/libavutil/md5.h
# include/libavutil/lzo.h
# include/libavutil/spherical.h
# include/libavutil/hwcontext_vulkan.h
# include/libavutil/hwcontext_dxva2.h
# include/libavutil/eval.h
# include/libavutil/base64.h
# include/libavutil/fifo.h
# include/libavutil/hwcontext_vaapi.h
# include/libavutil/file.h
# include/libavutil/channel_layout.h
# include/libavutil/common.h
# include/libavutil/hwcontext_d3d11va.h
# include/libavutil/cast5.h
# include/libavutil/downmix_info.h
# include/libavutil/mastering_display_metadata.h
# include/libavutil/bswap.h
# include/libavutil/dovi_meta.h
# include/libavutil/twofish.h
# include/libavutil/rc4.h
# include/libavutil/version.h
# include/libavutil/imgutils.h
# include/libavutil/ffversion.h
# include/libavutil/timestamp.h
# include/libavutil/video_enc_params.h
# include/libavutil/des.h
# include/libavutil/pixelutils.h
# include/libavutil/frame.h
# include/libavutil/hwcontext_cuda.h
# include/libavutil/hash.h
# include/libavutil/macros.h
# include/libavutil/tea.h
# include/libavutil/adler32.h
# include/libavutil/sha512.h
# include/libavutil/intreadwrite.h
# include/libavutil/bprint.h
# include/libavutil/encryption_info.h
# include/libavutil/motion_vector.h
# include/libavutil/random_seed.h
# include/libavutil/lfg.h
# include/libavutil/mathematics.h
# include/libavutil/hwcontext_mediacodec.h
# include/libavutil/hdr_dynamic_metadata.h
# include/libavutil/aes_ctr.h
# include/libavutil/stereo3d.h
# include/libavutil/avstring.h
# include/libavutil/rational.h
# include/libavutil/crc.h
# include/libavutil/cpu.h
# include/libavutil/time.h
# include/libavutil/avconfig.h
# include/libavutil/hwcontext.h
# include/libavutil/camellia.h
# include/libavdevice/avdevice.h
# include/libavdevice/version.h
# include/libswscale/swscale.h
# include/libswscale/version.h
# include/libavcodec/xvmc.h
# include/libavcodec/ac3_parser.h
# include/libavcodec/jni.h
# include/libavcodec/avcodec.h
# include/libavcodec/codec_desc.h
# include/libavcodec/vaapi.h
# include/libavcodec/packet.h
# include/libavcodec/dxva2.h
# include/libavcodec/codec_id.h
# include/libavcodec/d3d11va.h
# include/libavcodec/vdpau.h
# include/libavcodec/dirac.h
# include/libavcodec/avdct.h
# include/libavcodec/qsv.h
# include/libavcodec/version.h
# include/libavcodec/avfft.h
# include/libavcodec/mediacodec.h
# include/libavcodec/videotoolbox.h
# include/libavcodec/codec_par.h
# include/libavcodec/vorbis_parser.h
# include/libavcodec/dv_profile.h
# include/libavcodec/adts_parser.h
# include/libavcodec/codec.h
# include/libavcodec/bsf.h
# include/libavformat/avio.h
# include/libavformat/avformat.h
# include/libavformat/version.h
# lib/pkgconfig/libavcodec.pc
# lib/pkgconfig/libswscale.pc
# lib/pkgconfig/libavfilter.pc
# lib/pkgconfig/libavformat.pc
# lib/pkgconfig/libavdevice.pc
# lib/pkgconfig/libavutil.pc
# lib/pkgconfig/libswresample.pc
# lib/libavfilter.a
# lib/libavdevice.a
# lib/libavutil.a
# lib/libavcodec.a
# lib/libavformat.a
# lib/libswscale.a
# lib/libswresample.a
# share/ffmpeg/libvpx-1080p.ffpreset
# share/ffmpeg/ffprobe.xsd
# share/ffmpeg/libvpx-720p.ffpreset
# share/ffmpeg/libvpx-360p.ffpreset
# share/ffmpeg/libvpx-1080p50_60.ffpreset
# share/ffmpeg/examples/muxing.c
# share/ffmpeg/examples/transcode_aac.c
# share/ffmpeg/examples/filtering_video.c
# share/ffmpeg/examples/metadata.c
# share/ffmpeg/examples/resampling_audio.c
# share/ffmpeg/examples/encode_audio.c
# share/ffmpeg/examples/decode_video.c
# share/ffmpeg/examples/http_multiclient.c
# share/ffmpeg/examples/remuxing.c
# share/ffmpeg/examples/filter_audio.c
# share/ffmpeg/examples/extract_mvs.c
# share/ffmpeg/examples/vaapi_transcode.c
# share/ffmpeg/examples/hw_decode.c
# share/ffmpeg/examples/demuxing_decoding.c
# share/ffmpeg/examples/filtering_audio.c
# share/ffmpeg/examples/qsvdec.c
# share/ffmpeg/examples/avio_reading.c
# share/ffmpeg/examples/transcoding.c
# share/ffmpeg/examples/avio_list_dir.c
# share/ffmpeg/examples/Makefile
# share/ffmpeg/examples/vaapi_encode.c
# share/ffmpeg/examples/scaling_video.c
# share/ffmpeg/examples/encode_video.c
# share/ffmpeg/examples/README
# share/ffmpeg/examples/decode_audio.c
# share/ffmpeg/libvpx-720p50_60.ffpreset
# bin/ffmpeg
# bin/ffprobe
