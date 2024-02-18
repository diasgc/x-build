#!/bin/bash

lib='lensfun'
dsc='An open source database of photographic lenses and their characteristics'
lic='LGPL-3.0'
src='https://github.com/lensfun/lensfun.git'
cfg='cmake'
dep='libpng glib2'
eta='60'

cmake_bin='BUILD_LENSTOOL'
cmake_static='BUILD_STATIC'
cmake_config="-DBUILD_TESTS=OFF -DBUILD_DOC=OFF -DINSTALL_HELPER_SCRIPTS=OFF -DINSTALL_PYTHON_MODULE=OFF -DBUILD_AUXFUN=ON"

dev_vrs='0.3.99'

lst_inc='lensfun/lensfun.h'
lst_lib='liblensfun'
lst_bin='lenstool'
lst_lic='LICENSE AUTHORS'
lst_pc='lensfun.pc'

. xbuild

start

# CMakeLists.txt patch to dual build static/shared
<<'LZS_PATCH_DISABLE'
LQgEBsEsCMGcHpwFMB2sBmBXF8DCBZAQwGskAZSWAF1gDoqAPKgSACYAGV14dgZh4DsoVgEYAXAFZ2Y3q1oDWvThKX
tQAanZb2AKHX6IMBMjRYcBEuUo16TNp259Bw1mPYAWMe4Bs8gJxKrCpaGtq6AALhoMAiIgA0HBqxCbygkTqgAMoAog
AqAPqZAPIAqgBKuNn5AGIAkmTZmfkACmVFzdllubWNABQAtgD2ACbAAMaD4IMATsCwsEhyYwAOyxmgoK3tnd2NoLhF
+M31VdVkAIIA4pmgAEQAJADeAGrZuLlFZbUAWufdRQA5Qo5Vg1C7XAC+twAlBkdMBatVegAhEr1AAihVyf1quFhwA2
53RmLItWRZXOZQAmr0TBhsFlsd1cKAng0AZlqiUgZkKhD8dkyDlevjCcT8qTyZSaXSzFkABKU7Lo1mPdmc7mFPmirJ
5fLYsqXPVbDpdHqZWmoekoTZtU27G4HI4nMFXG7AdEHAHVQpU/DIopkfLPWqZMn1Wq5KkCgHoxEi+E5AoGo0FE07c2
W0wM9NmvbFV5lMOAu5PQvFoHnY5Q0Dl2olh4vToV/L4c4AKU+ENoZeb9aB+FqAK7PabRf7rdxbSh+PhKb1pIBAGkJW
SKV8+rKGU9LpLQZL1+b+fD4UPMtiyGRevPcjctza9FyAe9+70iSSyVlqgANUBkZewuoYoflK1JZtaTyct+EKqv+S4w
Wy2Qck+Wq4MeQGgDeq7LquoGZvekE/ghjy7mS+5rpSR6ARsSb6pSqYtHaGablaZiEdBtrbHmNwFn2Da9uOgL5FWtQ1
nW/Fji2badmU3YCVJQ4jvJE6Drg063KApS5M0JQFAC5z4NkECsdg1GgPGcGMmU2QAIolOcZB3DCegbDRepYbmDrgXK
nnmvshzHA0rrXNEnqAj6mR+gGQYhmGyIRlGZlIXGSJmWeF5Xjed4mSg7EQusrmFWU3LdIZoDoo03T6f8AKqgQ5xLlU
6UOUG8WxrUskFYVGwHtK5WVUOOIlk89WNfkzWXrhcadd1hWUrg8q1K8/XnoNNV1W2Y0TUGkrTehyVPi+gIJuoejvrh
vS3BpV2AfGqIYliOIsucsagPdZCYpkirWSBmRmedkqXXMVCEFQkBjBp55PYByXxrCoAZAAxKAyzEAA5hMKDoJAaOgL
AmCrDMVAZF6dSXOUpwnL0I2bVUuDlNZAIFMU5SVPke2IDltDLGMtBjP0lgbQ1dMM0hBRtdK7MdRCnPZig3NjGkgJkN
GOhAA===
LZS_PATCH_DISABLE

# cpu av8 av7 x86 x64
# NDK +++  .   .   .  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# bin/lenstool
# include/lensfun/lensfun.h
# lib/liblensfun.a
# lib/liblensfun.so
# lib/pkgconfig/lensfun.pc
# share/doc/lensfun/AUTHORS
# share/doc/lensfun/LICENSE
# share/lensfun/version_2/6x6.xml
# share/lensfun/version_2/actioncams.xml
# share/lensfun/version_2/compact-canon.xml
# share/lensfun/version_2/compact-casio.xml
# share/lensfun/version_2/compact-fujifilm.xml
# share/lensfun/version_2/compact-kodak.xml
# share/lensfun/version_2/compact-konica-minolta.xml
# share/lensfun/version_2/compact-leica.xml
# share/lensfun/version_2/compact-nikon.xml
# share/lensfun/version_2/compact-olympus.xml
# share/lensfun/version_2/compact-panasonic.xml
# share/lensfun/version_2/compact-pentax.xml
# share/lensfun/version_2/compact-ricoh.xml
# share/lensfun/version_2/compact-samsung.xml
# share/lensfun/version_2/compact-sigma.xml
# share/lensfun/version_2/compact-sony.xml
# share/lensfun/version_2/contax.xml
# share/lensfun/version_2/generic.xml
# share/lensfun/version_2/lensfun-database.dtd
# share/lensfun/version_2/lensfun-database.xsd
# share/lensfun/version_2/mil-canon.xml
# share/lensfun/version_2/mil-fujifilm.xml
# share/lensfun/version_2/mil-leica.xml
# share/lensfun/version_2/mil-nikon.xml
# share/lensfun/version_2/mil-olympus.xml
# share/lensfun/version_2/mil-panasonic.xml
# share/lensfun/version_2/mil-pentax.xml
# share/lensfun/version_2/mil-samsung.xml
# share/lensfun/version_2/mil-samyang.xml
# share/lensfun/version_2/mil-sigma.xml
# share/lensfun/version_2/mil-sony.xml
# share/lensfun/version_2/mil-tamron.xml
# share/lensfun/version_2/mil-tokina.xml
# share/lensfun/version_2/mil-zeiss.xml
# share/lensfun/version_2/misc.xml
# share/lensfun/version_2/om-system.xml
# share/lensfun/version_2/rf-leica.xml
# share/lensfun/version_2/slr-canon.xml
# share/lensfun/version_2/slr-hasselblad.xml
# share/lensfun/version_2/slr-konica-minolta.xml
# share/lensfun/version_2/slr-leica.xml
# share/lensfun/version_2/slr-nikon.xml
# share/lensfun/version_2/slr-olympus.xml
# share/lensfun/version_2/slr-panasonic.xml
# share/lensfun/version_2/slr-pentax.xml
# share/lensfun/version_2/slr-ricoh.xml
# share/lensfun/version_2/slr-samsung.xml
# share/lensfun/version_2/slr-samyang.xml
# share/lensfun/version_2/slr-schneider.xml
# share/lensfun/version_2/slr-sigma.xml
# share/lensfun/version_2/slr-soligor.xml
# share/lensfun/version_2/slr-sony.xml
# share/lensfun/version_2/slr-tamron.xml
# share/lensfun/version_2/slr-tokina.xml
# share/lensfun/version_2/slr-ussr.xml
# share/lensfun/version_2/slr-vivitar.xml
# share/lensfun/version_2/slr-zeiss.xml
# share/lensfun/version_2/timestamp.txt


