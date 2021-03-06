#!/bin/bash

export CFLAGS="-O3 -flto -march=native" CC=clang CXX=clang++

# git clone https://github.com/FFmpeg/FFmpeg.git
# cd FFmpeg
# git checkout release/5.0

# libflite:

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
--enable-libx264 --enable-shared --enable-vvc --enable-libflite"

ffmpeg_pkgs="libgnutls28-dev ladspa-sdk libaom-dev libass-dev libbluray-dev libbs2b-dev libcaca-dev \
libcdio-paranoia-dev libcodec2-dev libdav1d-dev libflite1 libfontconfig-dev libfreetype-dev libfribidi-dev \
liblilv-dev libgme-dev libgsm1-dev libjack-dev libmp3lame-dev libmysofa-dev libopenjp2-7-dev libopenmpt-dev \
libopus-dev libpulse-dev librabbitmq-dev librubberband-dev libshine-dev libsnappy-dev libsoxr-dev libspeex-dev \
libsrt-gnutls-dev libssh-dev libtheora-dev libtwolame-dev libvidstab-dev libvorbis-dev libvpx-dev libwebp-dev \
libx265-dev libxml2-dev libxvidcore-dev libzimg-dev libzmq3-dev libzvbi-dev libsdl2-dev libpocketsphinx-dev \
librsvg2-dev libmfx-dev libdc1394-dev libdrm-dev libiec61883-dev libchromaprint-dev frei0r-plugins-dev libx264-dev \
libopenal-dev libopencl-clang-dev libclc-14-dev libopengl-dev nvidia-cuda-dev libomxil-bellagio-dev"

build_flite=true
if [ $build_flite ] && [ ! -f "/usr/local/lib/libflite.a" ]; then
	git clone https://github.com/festvox/flite.git
	cd flite
	./configure && make && sudo make install
	cd ..
fi

build_vvc=true
if [ $build_vvc ]; then
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
fi

clear
sudo apt install -y ${ffmpeg_pkgs} || exit 1

export CFLAGS='-Wno-implicit-const-int-float-conversion -Wno-deprecated-declarations -Wno-enum-conversion -O3 -march=native'

make distclean 2>/dev/null
echo -e "configuring..."
./configure --prefix=/usr --extra-version=Gubuntu --toolchain=clang-asan --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=native --enable-lto --enable-gpl --disable-stripping ${ffmpeg_libs} || exit 1 
#--enable-libiec61883 --enable-libflite --extra-cflags="${CFLAGS}"
clear
echo -e "building..."
make -j$(nproc) || exit 1
clear
echo -e "installing..."
sudo make install 
