#!/bin/bash

lib='cryptopp'
dsc='Free C++ class library of cryptographic schemes'
lic='CRYPTOGAMS'
src='https://github.com/weidai11/cryptopp.git'
cfg='cmake'

cmake_shared='BUILD_SHARED'
cmake_static='BUILD_STATIC'
cmake_config='-DBUILD_TESTING=OFF'

lst_inc='cryptopp/*.h'
lst_lib='libcryptopp'
lst_bin=''
lst_lic='License.txt'
lst_pc='cryptopp.pc'

dev_bra='master'
dev_vrs=''
stb_bra=''
stb_vrs=''

pc_llib='-lcryptopp'

eta='190'

. xbuilder.sh

source_config(){
    local url="https://raw.githubusercontent.com/noloader/cryptopp-cmake/master/"
    for f in CMakeLists.txt cryptopp-config.cmake; do
        wget -O ${f} ${url}${f}
    done
}

start

# cpu av8 av7 x86 x64
# NDK ++   .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
# include/cryptopp/blumshub.h
# include/cryptopp/elgamal.h
# include/cryptopp/ecpoint.h
# include/cryptopp/keccak.h
# include/cryptopp/speck.h
# include/cryptopp/sha.h
# include/cryptopp/modes.h
# include/cryptopp/siphash.h
# include/cryptopp/zlib.h
# include/cryptopp/gf256.h
# include/cryptopp/config_os.h
# include/cryptopp/asn.h
# include/cryptopp/3way.h
# include/cryptopp/ppc_simd.h
# include/cryptopp/modarith.h
# include/cryptopp/xtr.h
# include/cryptopp/poly1305.h
# include/cryptopp/smartptr.h
# include/cryptopp/blake2.h
# include/cryptopp/pch.h
# include/cryptopp/tiger.h
# include/cryptopp/rabbit.h
# include/cryptopp/arc4.h
# include/cryptopp/polynomi.h
# include/cryptopp/idea.h
# include/cryptopp/strciphr.h
# include/cryptopp/hmac.h
# include/cryptopp/kalyna.h
# include/cryptopp/sha3.h
# include/cryptopp/hight.h
# include/cryptopp/threefish.h
# include/cryptopp/files.h
# include/cryptopp/mqueue.h
# include/cryptopp/aria.h
# include/cryptopp/serpentp.h
# include/cryptopp/eccrypto.h
# include/cryptopp/scrypt.h
# include/cryptopp/salsa.h
# include/cryptopp/config.h
# include/cryptopp/shacal2.h
# include/cryptopp/pwdbased.h
# include/cryptopp/basecode.h
# include/cryptopp/hmqv.h
# include/cryptopp/config_misc.h
# include/cryptopp/config_ns.h
# include/cryptopp/mqv.h
# include/cryptopp/mars.h
# include/cryptopp/aes_armv4.h
# include/cryptopp/config_cxx.h
# include/cryptopp/algebra.h
# include/cryptopp/rc2.h
# include/cryptopp/allocate.h
# include/cryptopp/ripemd.h
# include/cryptopp/filters.h
# include/cryptopp/arm_simd.h
# include/cryptopp/blowfish.h
# include/cryptopp/emsa2.h
# include/cryptopp/donna_32.h
# include/cryptopp/hc256.h
# include/cryptopp/resource.h
# include/cryptopp/gost.h
# include/cryptopp/naclite.h
# include/cryptopp/darn.h
# include/cryptopp/config_align.h
# include/cryptopp/square.h
# include/cryptopp/mdc.h
# include/cryptopp/zdeflate.h
# include/cryptopp/config_ver.h
# include/cryptopp/integer.h
# include/cryptopp/panama.h
# include/cryptopp/aes.h
# include/cryptopp/sosemanuk.h
# include/cryptopp/md5.h
# include/cryptopp/sha256_armv4.h
# include/cryptopp/simon.h
# include/cryptopp/mersenne.h
# include/cryptopp/ida.h
# include/cryptopp/authenc.h
# include/cryptopp/lea.h
# include/cryptopp/sha512_armv4.h
# include/cryptopp/eax.h
# include/cryptopp/nbtheory.h
# include/cryptopp/rijndael.h
# include/cryptopp/default.h
# include/cryptopp/seed.h
# include/cryptopp/misc.h
# include/cryptopp/cryptlib.h
# include/cryptopp/hrtimer.h
# include/cryptopp/base64.h
# include/cryptopp/rc6.h
# include/cryptopp/factory.h
# include/cryptopp/gf2_32.h
# include/cryptopp/sm4.h
# include/cryptopp/pkcspad.h
# include/cryptopp/rng.h
# include/cryptopp/shake.h
# include/cryptopp/xtrcrypt.h
# include/cryptopp/dll.h
# include/cryptopp/luc.h
# include/cryptopp/oids.h
# include/cryptopp/dsa.h
# include/cryptopp/md2.h
# include/cryptopp/hashfwd.h
# include/cryptopp/lubyrack.h
# include/cryptopp/gf2n.h
# include/cryptopp/hex.h
# include/cryptopp/md4.h
# include/cryptopp/dh.h
# include/cryptopp/fhmqv.h
# include/cryptopp/secblock.h
# include/cryptopp/xed25519.h
# include/cryptopp/donna_64.h
# include/cryptopp/cast.h
# include/cryptopp/padlkrng.h
# include/cryptopp/channels.h
# include/cryptopp/osrng.h
# include/cryptopp/twofish.h
# include/cryptopp/cmac.h
# include/cryptopp/rw.h
# include/cryptopp/dh2.h
# include/cryptopp/whrlpool.h
# include/cryptopp/chachapoly.h
# include/cryptopp/words.h
# include/cryptopp/config_int.h
# include/cryptopp/wake.h
# include/cryptopp/simeck.h
# include/cryptopp/seckey.h
# include/cryptopp/safer.h
# include/cryptopp/seal.h
# include/cryptopp/ccm.h
# include/cryptopp/fips140.h
# include/cryptopp/config_dll.h
# include/cryptopp/gcm.h
# include/cryptopp/gfpcrypt.h
# include/cryptopp/queue.h
# include/cryptopp/trunhash.h
# include/cryptopp/esign.h
# include/cryptopp/sm3.h
# include/cryptopp/gzip.h
# include/cryptopp/ossig.h
# include/cryptopp/dmac.h
# include/cryptopp/stdcpp.h
# include/cryptopp/des.h
# include/cryptopp/adv_simd.h
# include/cryptopp/skipjack.h
# include/cryptopp/nr.h
# include/cryptopp/ecp.h
# include/cryptopp/algparam.h
# include/cryptopp/hkdf.h
# include/cryptopp/modexppc.h
# include/cryptopp/simple.h
# include/cryptopp/donna.h
# include/cryptopp/tea.h
# include/cryptopp/adler32.h
# include/cryptopp/cham.h
# include/cryptopp/iterhash.h
# include/cryptopp/ec2n.h
# include/cryptopp/chacha.h
# include/cryptopp/rabin.h
# include/cryptopp/base32.h
# include/cryptopp/drbg.h
# include/cryptopp/trap.h
# include/cryptopp/config_asm.h
# include/cryptopp/serpent.h
# include/cryptopp/rsa.h
# include/cryptopp/vmac.h
# include/cryptopp/shark.h
# include/cryptopp/cbcmac.h
# include/cryptopp/oaep.h
# include/cryptopp/pssr.h
# include/cryptopp/lsh.h
# include/cryptopp/rc5.h
# include/cryptopp/zinflate.h
# include/cryptopp/pubkey.h
# include/cryptopp/sha1_armv4.h
# include/cryptopp/crc.h
# include/cryptopp/donna_sse.h
# include/cryptopp/xts.h
# include/cryptopp/config_cpu.h
# include/cryptopp/cpu.h
# include/cryptopp/ttmac.h
# include/cryptopp/randpool.h
# include/cryptopp/argnames.h
# include/cryptopp/fltrimpl.h
# include/cryptopp/secblockfwd.h
# include/cryptopp/tweetnacl.h
# include/cryptopp/camellia.h
# include/cryptopp/eprecomp.h
# include/cryptopp/rdrand.h
# include/cryptopp/hc128.h
# lib/pkgconfig/cryptopp.pc
# lib/libcryptopp.a
# lib/cmake/cryptopp/cryptopp-config.cmake
# lib/cmake/cryptopp/cryptopp-targets.cmake
# lib/cmake/cryptopp/cryptopp-config-version.cmake
# lib/cmake/cryptopp/cryptopp-targets-release.cmake
# lib/libcryptopp.so
# share/doc/cryptopp/License.txt
