#!/bin/bash

lib='poppler'
apt='libpoppler-dev'
dsc='PDF rendering library'
lic='GPL-2.0'
src='https://github.com/freedesktop/poppler.git'
cfg='cmake'
eta='240'
dep='boost fontconfig libtiff libjpeg openjpeg lcms2'
cmake_bin="ENABLE_UTILS"
cmake_static='BUILD_STATIC_LIBS'

dev_bra=''
dev_vrs='22.02.0'
stb_bra=''
stb_vrs=''

lst_inc='poppler/cpp/poppler*.h'
lst_lib='libpoppler-cpp libpoppler'
lst_bin=''
lst_lic='COPYING COPYING3'
lst_pc='poppler-cpp.pc poppler.pc'

. xbuild

cmake_config="-DBUILD_GTK_TESTS=OFF -DBUILD_CPP_TESTS=OFF -DBUILD_MANUAL_TESTS=OFF -DBUILD_QT5_TESTS=OFF \
     -DBUILD_QT6_TESTS=OFF -DENABLE_QT5=OFF -DENABLE_QT6=OFF \
     -DENABLE_LIBCURL=OFF"
start

# PATCH 01 on CMakeLists.txt to support dual static-shared build
# PATCH 02 on cpp/CMakeLists.txt to support dual static-shared build
# PATCH 03 on utils/CMakeLists.txt to include directories of missing headers png,iconv,...
<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEUcGcEQGyhECMAXEQOxMMCcWnDNDAVhI0SJUAGpRogFD
i5EGAhQZseQqXKUKtekRacmAgMxY2/ISLGSp0gAK3QwAQA4aAGlYSX7hkdD3pUHgAOwATZAAzAAoASkD
0aAAnAHN4dAB9ABtkYNgs5AAjRKTkeFQogAcAewqKzPhE0EQASQA5AGl0gAUAJWaANQBBABUAUVAAEgB
vatr6xPSWgCEAZQBfONAcjGhMzKjhwZ6AcVHhldBZuobQHoBVVuHmyHGAEVGVp9aR5oB5VtABRyTWaSx
6RwAmqB3p82j9/pMplBBu1Ruk2p9BohEItQa9mj01qAjuAABIDN4fL7wgHTZGo9GtTHY3FLfGEuLAWSR
KJLO7NRCvdKYp7gVkXQatV6gPkCoUrUlHUZC5YrOLiUCgaChUL5IpJACelRq10SwB26GQAGNQCLmuBEV
d5sKeuB1urNQBiVLBBrQdDwdLwXDVRIZAAW8G1DWNcwa5oSlptS0GKzR3xelxN82AFUSyAAbv74KBRgA
NLq/HrDdIAMQF6cGmYARHTICi0eA7j0eqNHuklnCehD0uy1gB6J0NdJ5wvFoMhqphrDh5se0CoNLpBIp
Ld5moNS1lWOmhP+62gXq/LqjavND6gfq3lZ/AEMBjOLAkL+235Pnovgi77OKAvx3MMXTgekGbjFOiTrj
uqQZNkuR6sU+bHnBZ5JiCHTdH0QxjI62bTqqGyyJq2wJHsBxHKc5xZnGZoWhe9yPM8lKwt8TwIkCwQgm
CkLQlScI8bSSLtgyGKHCyyxjsSrrkk+wlcTSiL0mi0lYjickEuR4ghOE0SbDyfaDEsiBog8mIWWigxdM
06TmY5pKjIM7wAZslHBDsNH1pZKyBJqmpweOgzBMEVToCu0jSCAwCgFatTjlAcBIGgmA4PgxBkBQVA6E
QRgcMwJAMFggjmMIogSFIJCyPISUVClijpSoWXqLlWjUHQhUcCQhifjQRiVZYNU2PYjhGEYHgSFNbgME
Q/i2IEhk8psiFbiheTZPqGHlFhjWMaaiL2v8/SsuCfQfORWw+dR+yHCcZwXAdtS3A8TyZjC1JiYCwLLJ
dULfaJr7qZJmlMjJOl4npClkhSKk/aDbYdoyzLQ2yemcty0SyoKwqHKK4rElKMr8vjCpKiqoJqhRWo6m
hhonjmjXYRe0xwekjUum6+mapuGQbRk+4VIepT7SRZqsyxNpXjed4Pv+gEAt+3BiCsf7PqDYhgRBUEwU
dLO1AhSRIfkqE7eh4vM/G0uJhecEneAZ0XUc97unTVG7A9dHPYbtu1GzNpsZ9nFI7x/2goDiMgwiKNSZ
D2msvJJJKWHsfiRpaNQ8nWOyKtxmBF7fkNoFwVYaEZSWsE55VMEMXl5LwChFUVoAK4ALYhNF4axfFoBt
5amSoM1aXKJlag5Zo+U9XoJACBw3BEAII3VdYMhyBqg/IMPo9KBlqjZRoeXaLPTDz+fNBYDQK+CFVVi1
XYDjAAtbh0OIr8gQE5ehBE6Amh3LAVorRBQ3NAYIyB0AGitJGK0sBsDAMCOqbkwQrSZDbpXdI4REjwCt
P/PaUR44Q3RvhUY9YywThyGgjB8BNjal1MGXBg9oAFHqJUX+/9agd0dBwgBwowKumuutU2m0cjbUKFbT
CvCuGIitFUDuHc656lQDdHkiAoArCIHWMCUo4hAA

LZS_PATCH

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc


# Filelist
# --------
# include/poppler/cpp/poppler-version.h
# include/poppler/cpp/poppler_cpp_export.h
# include/poppler/cpp/poppler-toc.h
# include/poppler/cpp/poppler-rectangle.h
# include/poppler/cpp/poppler-page-transition.h
# include/poppler/cpp/poppler-page-renderer.h
# include/poppler/cpp/poppler-page.h
# include/poppler/cpp/poppler-image.h
# include/poppler/cpp/poppler-global.h
# include/poppler/cpp/poppler-font-private.h
# include/poppler/cpp/poppler-font.h
# include/poppler/cpp/poppler-embedded-file.h
# include/poppler/cpp/poppler-document.h
# include/poppler/cpp/poppler-destination.h
# lib/libpoppler-cpp.a
# lib/libpoppler-cpp.so
# lib/libpoppler.a
# lib/libpoppler.so
# lib/pkgconfig/poppler-cpp.pc
# lib/pkgconfig/poppler.pc
# bin/pdfunite
# bin/pdfseparate
# bin/pdftohtml
# bin/pdftotext
# bin/pdftops
# bin/pdfinfo
# bin/pdfimages
# bin/pdffonts
# bin/pdfdetach
# bin/pdftoppm
# bin/pdfattach
# share/man/man1/pdftoppm.1
# share/man/man1/pdfunite.1
# share/man/man1/pdfseparate.1
# share/man/man1/pdftohtml.1
# share/man/man1/pdftotext.1
# share/man/man1/pdftops.1
# share/man/man1/pdfinfo.1
# share/man/man1/pdfimages.1
# share/man/man1/pdffonts.1
# share/man/man1/pdfattach.1
# share/man/man1/pdfdetach.1
# share/doc/poppler/COPYING3
# share/doc/poppler/COPYING
