#!/bin/bash

#export CFLAGS="-march=native -O3 -flto"
export CC=clang LD=ld.lld

if [ ! -d "FFmpeg" ];then
	git clone https://github.com/FFmpeg/FFmpeg.git
fi
cd FFmpeg
git checkout release/5.1

# libflite:
build_vvc=false
build_amd=true


ffmpeg_cfg="--prefix=/usr --extra-version=amd-r74800u --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu \
--incdir=/usr/include/x86_64-linux-gnu --arch=native --enable-gpl --disable-stripping --enable-lto "

ffmpeg_libs="--enable-gnutls --enable-ladspa --enable-libaom --enable-libass \
--enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 \
--enable-libdav1d --enable-libfontconfig --enable-libfreetype --enable-libfribidi \
--enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa \
--enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librabbitmq \
--enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex \
--enable-libsrt --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvidstab \
--enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx265 --enable-libxml2 \
--enable-libxvid --enable-libzimg --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx \
--enable-openal --enable-opencl --enable-opengl --enable-sdl2 --enable-pocketsphinx --enable-librsvg \
--enable-libmfx --enable-libdc1394 --enable-libdrm --enable-chromaprint --enable-frei0r \
--enable-libx264 --enable-shared --enable-libflite --enable-vaapi"

ffmpeg_pkgs="libgnutls28-dev ladspa-sdk libaom-dev libass-dev libbluray-dev libbs2b-dev libcaca-dev \
libcdio-paranoia-dev libcodec2-dev libdav1d-dev libflite1 libfontconfig-dev libfreetype-dev libfribidi-dev \
liblilv-dev libgme-dev libgsm1-dev libjack-dev libmp3lame-dev libmysofa-dev libopenjp2-7-dev libopenmpt-dev \
libopus-dev libpulse-dev librabbitmq-dev librubberband-dev libshine-dev libsnappy-dev libsoxr-dev libspeex-dev \
libsrt-gnutls-dev libssh-dev libtheora-dev libtwolame-dev libvidstab-dev libvorbis-dev libvpx-dev libwebp-dev \
libx265-dev libxml2-dev libxvidcore-dev libzimg-dev libzmq3-dev libzvbi-dev libsdl2-dev libpocketsphinx-dev \
librsvg2-dev libmfx-dev libdc1394-dev libdrm-dev libiec61883-dev libchromaprint-dev frei0r-plugins-dev libx264-dev \
libopenal-dev libopencl-clang-dev libclc-14-dev libopengl-dev libomxil-bellagio-dev flite1-dev libva-dev"

if ${build_amd}; then
  ffmpeg_pkgs+=" ocl-icd-opencl-dev"
fi

if ${build_vvc} ; then
	o_flags="-O3 -DNDEBUG -flto -march=native"
	for lib in vvenc vvdec; do
		if [ ! -f "/usr/lib/x86_64-linux-gnu/lib${lib}.a" ]; then
			if [ ! -d "${lib}" ]; then
				git clone https://github.com/fraunhoferhhi/${lib}.git
			fi
			cd ${lib}
			for f in $(find . -name "CMakeLists.txt"); do sed -i "s/-Werror/-Wno-error/g" $f; done
			mkdir -p build
			cd build
			cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS_RELEASE="${o_flags}" -DCMAKE_C_FLAGS_RELEASE="${o_flags}"
			make -j$(nproc)
			sudo make install
			cd ..
		fi
	done
	ffmpeg_libs+=" --enable-vvc"
fi

clear
sudo apt install -y ${ffmpeg_pkgs} || exit 1

export CFLAGS='-march=native -O3 -flto'

make distclean 2>/dev/null
echo -e "configuring..."
./configure ${ffmpeg_cfg} ${ffmpeg_libs} || exit 1 
#--enable-libiec61883 --enable-libflite --extra-cflags="${CFLAGS}"
clear
echo -e "building..."
make -j$(nproc) || exit 1
clear
echo -e "installing..."
sudo make install 
