#!/bin/bash
# cpu av8 av7 x86 x64
# NDK +++ +++ +++ +++ clang
# GNU +++ +++  .   .  gcc
# WIN +++  .   .   .  clang/gcc

lib='guetzli'
dsc='Perceptual JPEG encoder'
lic='Apache-2.0'
src='https://github.com/google/guetzli.git'
cfg='cmake'
dep='libpng libjpeg'
eta='30'
pc_llib='-lguetzli'

lst_inc=''
lst_lib='libguetzli'
lst_bin='butteraugli'
lst_lic='LICENSE'
lst_pc=''

cmake_static='BUILD_STATIC_LIBS'

. xbuild

start

# patch 01: create CMakeLists.txt with dual static shared build support
<<'XB64_PATCH'
LS0tIENNYWtlTGlzdHMudHh0CTIwMjItMDEtMjQgMjE6MTU6MzQuMjAxMDAwNzAwICswMDAwCisr
KyBDTWFrZUxpc3RzLnR4dAkyMDIyLTAxLTI0IDIwOjUzOjI3LjU5MTAwMDcwMCArMDAwMApAQCAt
MCwwICsxLDQ3IEBACitjbWFrZV9taW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMi44LjEyKQorCitw
cm9qZWN0KGd1ZXR6bGkgQ1hYKQorb3B0aW9uKEJVSUxEX1NUQVRJQ19MSUJTICJCdWlsZCBzdGF0
aWMgbGlicyIgT04pCitvcHRpb24oQlVJTERfVE9PTFMgIkJ1aWxkIHRvb2xzIiBPTikKKworYWRk
X2RlZmluaXRpb25zKCItV25vLWZvcm1hdCIpCisKK2ZpbmRfcGFja2FnZShaTElCKQorZmluZF9w
YWNrYWdlKFBORykKK2ZpbmRfcGFja2FnZShKUEVHKQorCitpbmNsdWRlX2RpcmVjdG9yaWVzKCR7
Q01BS0VfU09VUkNFX0RJUn0gJHtDTUFLRV9TT1VSQ0VfRElSfS90aGlyZF9wYXJ0eS9idXR0ZXJh
dWdsaSAke1pMSUJfSU5DTFVERV9ESVJTfSAke1BOR19JTkNMVURFX0RJUlN9ICR7SlBFR19JTkNM
VURFX0RJUlN9KQorCitmaWxlKEdMT0JfUkVDVVJTRSBzcmNfZ3VldHpsaSBndWV0emxpLyouY2Mp
CitsaXN0KEFQUEVORCBzcmNfZ3VldHpsaSAke0NNQUtFX1NPVVJDRV9ESVJ9L3RoaXJkX3BhcnR5
L2J1dHRlcmF1Z2xpL2J1dHRlcmF1Z2xpL2J1dHRlcmF1Z2xpLmNjKQorZmlsZShHTE9CX1JFQ1VS
U0UgaGRyX2d1ZXR6bGkgZ3VldHpsaS8qLmgpCitsaXN0KEFQUEVORCBoZHJfZ3VldHpsaSAke0NN
QUtFX1NPVVJDRV9ESVJ9L3RoaXJkX3BhcnR5L2J1dHRlcmF1Z2xpL2J1dHRlcmF1Z2xpL2J1dHRl
cmF1Z2xpLmgpCisKK3NldChndWV0emxpX3RhcmdldHMgZ3VldHpsaSkKK2FkZF9saWJyYXJ5KGd1
ZXR6bGkgJHtzcmNfZ3VldHpsaX0pCit0YXJnZXRfbGlua19saWJyYXJpZXMoZ3VldHpsaSBQVUJM
SUMgJHtaTElCX0xJQlJBUklFU30gJHtQTkdfTElCUkFSSUVTfSAke0pQRUdfTElCUkFSSUVTfSkK
KworaWYoQlVJTERfU0hBUkVEX0xJQlMgQU5EIEJVSUxEX1NUQVRJQ19MSUJTKQorICAgIGFkZF9s
aWJyYXJ5KGd1ZXR6bGlfc3RhdGljIFNUQVRJQyAke3NyY19ndWV0emxpfSkKKyAgICB0YXJnZXRf
bGlua19saWJyYXJpZXMoZ3VldHpsaV9zdGF0aWMgUFJJVkFURSAke1pMSUJfTElCUkFSSUVTfSAk
e1BOR19MSUJSQVJJRVN9ICR7SlBFR19MSUJSQVJJRVN9KQorICAgIHNldF90YXJnZXRfcHJvcGVy
dGllcyhndWV0emxpX3N0YXRpYyBQUk9QRVJUSUVTIE9VVFBVVF9OQU1FIGd1ZXR6bGkpCisgICAg
bGlzdChBUFBFTkQgZ3VldHpsaV90YXJnZXRzIGd1ZXR6bGlfc3RhdGljKQorZW5kaWYoKQorCitp
ZihCVUlMRF9UT09MUykKKyAgICBhZGRfZXhlY3V0YWJsZShidXR0ZXJhdWdsaSB0aGlyZF9wYXJ0
eS9idXR0ZXJhdWdsaS9idXR0ZXJhdWdsaS9idXR0ZXJhdWdsaV9tYWluLmNjCisgICAgICAgICB0
aGlyZF9wYXJ0eS9idXR0ZXJhdWdsaS9idXR0ZXJhdWdsaS9idXR0ZXJhdWdsaS5jYworICAgICAg
ICAgdGhpcmRfcGFydHkvYnV0dGVyYXVnbGkvYnV0dGVyYXVnbGkvYnV0dGVyYXVnbGkuaCkKKyAg
ICB0YXJnZXRfbGlua19saWJyYXJpZXMoYnV0dGVyYXVnbGkgZ3VldHpsaSkKK2VuZGlmKCkKKwor
aW5zdGFsbChUQVJHRVRTICR7Z3VldHpsaV90YXJnZXRzfQorICAgIFJVTlRJTUUgREVTVElOQVRJ
T04gYmluCisgICAgQVJDSElWRSBERVNUSU5BVElPTiBsaWIke0xJQl9TVUZGSVh9CisgICAgTElC
UkFSWSBERVNUSU5BVElPTiBsaWIke0xJQl9TVUZGSVh9KQorCitpbnN0YWxsKEZJTEVTICR7aGRy
X2d1ZXR6bGl9IERFU1RJTkFUSU9OIGluY2x1ZGUvZ3VldHpsaSkKKworaWYoQlVJTERfVE9PTFMp
CisgIGluc3RhbGwoVEFSR0VUUyBidXR0ZXJhdWdsaSBSVU5USU1FIERFU1RJTkFUSU9OIGJpbikK
K2VuZGlmKCkK
XB64_PATCH

# Filelist
# --------
# include/gamma_correct.h
# include/jpeg_data_writer.h
# include/color_transform.h
# include/entropy_encode.h
# include/processor.h
# include/jpeg_data_decoder.h
# include/debug_print.h
# include/score.h
# include/jpeg_huffman_decode.h
# include/butteraugli.h
# include/fdct.h
# include/dct_double.h
# include/jpeg_data.h
# include/quantize.h
# include/jpeg_data_encoder.h
# include/preprocess_downsample.h
# include/jpeg_data_reader.h
# include/fast_log.h
# include/quality.h
# include/jpeg_bit_writer.h
# include/butteraugli_comparator.h
# include/output_image.h
# include/stats.h
# include/jpeg_error.h
# include/idct.h
# include/comparator.h
# lib/pkgconfig/guetzli.pc
# lib/libguetzli.so
# lib/libguetzli.a
# bin/butteraugli
# share/doc/guetzli/LICENSE
