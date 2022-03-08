#!/bin/bash

lib='id3v2lib'
apt='id3lib-dev'
dsc='id3v2lib is a library written in C to read and edit id3 tags from mp3 files'
lic='BSD-2c'
src='https://github.com/larsbs/id3v2lib.git'
cfg='cmake'
eta='10'
cmake_static='BUILD_STATIC_LIBS'

lst_inc=''
lst_lib=''
lst_bin=''
lst_lic='LICENSE README.md'
lst_pc=''

dev_vrs='1.0.0'

. xbuild

start

# patch 01 on src/CMakeLists.txt to support dual static-shared build
# patch 02 on CMakeLists.txt to configure pc file
# patch 03 on id3v2lib.pc.in to create pc file
<<'LZS_PATCH'
LQgEGcCcGMHoGECyBDA1gUwDIEtwBdwA6PADzwEgAmABksuGoGYGAOUARhYC5HGv2A7IQCswygBYAbJUbjGoANTVl1
AFAKNEGAhQYc+IqQo06DZtTacelftULV2w9o2cBOeUpWqAAt9DBKABpXRSD2cVBfVVBogGUAUQAVAApsABNGADdKAH
0oaFAAM0hkAFt0QgKAC3RkNPRIStB0rMoAG2wAIya8AE8AB3QiAoBXPGw24YBKOKTUjOycmrqG8By07Eh0aDwAe0he
0AASAG8W7I7OnNiAeQBVACV4eJyAEQBJB4BfWGwAO2gbRG9V+C3aXRmwFUwAAgq9XjlMO8AEIPGEPACa81aoFiiRhi
Xe8GOZzBeRgX0h0PeADk8TDMJhkviHgBxJKxZpg0CveJ42kE943GmgS4zBQAMTuNPghOFyThCKRyIghRIor+qHFoB1
oEViJRaMx2Oyp3Aaq+JLamstp3OuXylPUutxSRyLPZiRyAAUHjdvfEHoS+SbKGaLaBff7A8HOfdEt67l6aTDEPEua1
tbrafTGcz0Z7OfbwyRLbz+Sm5SKxep4jTXlKZVXkuL9crkgAiDugLvi94S5LIu7vTAI2IACXR8SVKM5MProCHI7H+M
J8ANyNiWZ1bZRneA+GQ42g3fpa/FdY+A5moBz+LzHwe8VlN0xJPtS1q9Ugaw2Wx2+y9GWfKEpWQoiv8gLAugN53gyT
ISiOfLvmClzXPcTwvI+PyQUCIL2pchBVDyIEClWzQAnhMGqNCYAEV0hD9NAhD/OQ7CuAI1AMOw3GgA4XDKAJdgqCJy
iKA4yjqJo9HdExLF/FQtD0EwrAcNwjDUAJwiEJQLAsJIkiMMIhniV4vj+NQgTUIo7CBI4kTeOo/RbIU2AkAAvN4SAw
gA0i8cGMj6T6IQAGo5CjoCQ2w5M56CuR5pyxfFXzqJcf7uackXRUlbk/Jc6i4dB6WJS5uW/JR0HqOoNJlOgXAZhcXT
qK8QzQJA2D9OMux/PVMnNOAoDIKKXQlAcoAAO7tXgeDoH8FGgMSeygFsdSDX8aSgOgGx4BmoB4MgADmA3FLspSgKU/
TyK5bRDOojyYPVVTTf04BcLAsAHdgeBVCM3TQKdsBtMgP6dOA6gAGqrNg3X1d44OBrE4E5IgMIAFKvt4hBwwjSOILS
GPqA86AAI4jJsQz1YTJNk1sRDOdgmRHnVMQKDgoP1cAmCnGlmyWsAHRguobN0+1jMzZTCjwIUQNHRz7x2hV9R/ilCg
6jRIDAAtuhYLgBDEGQimmCpFgcK4AmSNYhCCK4hmuOwJueJJGiq0gaA6wY+vGEpZiqexAl8MIdgsOIAjiK44fCB4Ik
+H4wCSIEwiKPHkgOdEswpPDDyI8KyNo6+HA3gkGc4zneM0vn1BUpLwqIayjwvIhmDxKGhFyf8DXgrJBTeMKmAYn2dL
3ghSGcqc3l+Tk8CPE+NJesiAqYm8nw4ahDFMSRFaCsKw2dLA/SoAd/1/K5B03vqsR3Mij7Pokr5YvkMxAA==
LZS_PATCH

# Filelist
# --------
# include/id3v2lib/constants.h
# include/id3v2lib/frame.h
# include/id3v2lib.h
# include/id3v2lib/header.h
# include/id3v2lib/types.h
# include/id3v2lib/utils.h
# lib/libid3v2.a
# lib/libid3v2.so
# lib/pkgconfig/id3v2lib.pc
# share/doc/id3v2lib/LICENSE
# share/doc/id3v2lib/README.md
