#!/bin/bash

lib='ogg'
apt='libogg0'
dsc='Ogg media container'
lic='BSD'
src='https://github.com/xiph/ogg.git'
cfg='cmake'
eta='3'

ac_bin="--disable-extra-programs|--enable-extra-programs"

lst_inc='ogg/*.h'
lst_lib='libogg'
lst_bin=''
lst_lic='COPYING AUTHORS'
lst_pc='ogg.pc'

. xbuild

cmake_static='BUILD_STATIC_LIBS'
cmake_config='-DBUILD_TESTING=OFF -DINSTALL_DOCS=OFF'

start

# support dual static/shared build
<<'LZS_PATCH'
LQgEGEFkEMGsFMAyBLAzgF1QOnQD3QJABMADEUcCQCzACMArKOQFz0DMzVJW7VAHAE5aQgGygA1CVokSAKHEKIMBCg
zY8hUuUo0GTIqw4l6WEfSpUBRemYlSZsgAKPQwPgHYANO4kfvoZ1lQYODUeHQACgAhAFUASUQAEQB9AGUACQBBACUA
URTEOKjU0AAVbJjcgEog+AA7ABNkADMImtBZYGgGhuSAG2QAIwAnaGGATwiAewBzGdAAEgBvAHkAcTXk9NzMxNzs1I
BfRdWNtJWY7PBco5rxbt6BkbHJ2fmVqIApXPBSk/XNttdvsjv8zqkLlcbod2g9+kNRhMIis5sxmG9QJlCpkSm92ugx
jNwslkHUAMZ9ACuDXgySaw3gZPQU2GyHgqGmc1AAAUYlFCuAgiFFgAeWIJFJxABypX2ADFMtdmMsoJkANK5ZLgS55G
XnS7XZKJOLZQ4AelJFOp8AAfE4XMABPRPGxGOInZ4qGwAo4hSEFiLpalSljEMlpbLsgqlSrIOrNUGQ4gw9LwIgYntj
aa7aB2p0wuhkgThkTCwAHYZTMvwYboNkczrCjHc7Irbn7UpxG6NkIQgBqILiKylJ0KUXOA4OQ6lhx7wUnqWno6KyQX
09nwGFvP5cXAWx2e2yoAARMsAfvgQdDsfOncALbQMmViJwp6gVDNXCgPp1WB3YWvgiLycjMywfrgxzLD+sCQSKIbZG
suSlMkHzfL8qTonMNr/iEBZFoSxIVlWNZ1uyETyMKTZzGBn7HC2bYdl2qQUZRwT9oOw7LuO7FTsOs7iKx84cSOyxjq
uwn8YJPJ8gKF6HieZ5nECh5HDeAmCRcpS8shUqZJAuSgG8LHBHmwAtNE8RJMkcrZHpuQAOorNkao1JuuHEsWpbJER1
a1vWIE8q27bZJ23ZuaxNl2Y5zllBUuRzpRkX6dFaribxIlLPRaHIWufEJcKcbgCsqQABrWbZyVOalcR7DKcRyl2R4s
jMWC4MgZYABZYEZ4WUYVxVlUlDlVWk6ROTlwlpOU0prCcWU/BN6UblJ/WleVUUjbEUqJIgmq5Rl82/Gli55b1wolUV
ezJJkpTTbEsrhlKwahsk3I3ekJ6OMMZbQOgHU3mdISadpyS6fpoAojMxmgOZ4pWUNKU4axeGeYRla+aRHJvDREGBQx
IVMdDUkI1VsWVETgkk85x1Lssh2LSdM4U6xq2DRVw3UzVuR1Q1+yGSWrXtV1RnqVJwSs+tlXUxk4008OU3ZDNc2ttl
ctM6LYsS1TqVbTte3CcrKyq/tkli8EF0rFdN13TED2Ji9b2lB9x5fT9f1qWbwTA7boN2RDczM7m0P1E0rRIzDdQYNA
fR9BE8GIaUuLUUs4Gm6xuQldy43+zMpQEZggcVHV4N7MG0o3bTSyqhqj3PcmyRRNKWZp5RY62dkACaoCl52umdpxsb
xrXSZhmOzeBzk4DpHEA7dzcvcVwPVdxjX9v12PJot8K2tz2XfeV9XCZPSPr15A1JVbyE26ycpfM9+X/cZYfw8vam6a
ZpvZpGZRrkh+ZdwhwfE+KYbQghBDJFMOozRkAzEpAybysAZjJAgVAmByRoF9HgCBLAZYyRYFJKZUkUcY5xxyAnJOUN
eoZyziFHOecSzhFQAlIunYS7zwfgfFeR865hkbttTeCU245C7vffeS9n5r1HkUcevVJ7T1nqIxeT8uEv3XtIgRvUd6
KMficCRx8HZnziBfBK19dxyTvuwsRyih6SMemmDM+RP49TuIBQYERjzABpM0Y8J5jx3FhpZFIz1Ox7jHCUTI21QBwy
CVkPIBQiipHDq49xwAo51jJD44Ju4AGNH/mA0A8BcBlhZJEah2dIb0NLKgUAYMbhvWuDnNEoAGq7TofnbAZIHwIDzE
AA
LZS_PATCH


# cpu av8 av7 x86 x64
# NDK ++  ++  ++  ++  clang
# GNU  .   .   .   .  gcc
# WIN  .   .   .   .  clang/gcc

# Filelist
# --------
#
# include/ogg/config_types.h
# include/ogg/config_types.h
# include/ogg/ogg.h
# include/ogg/ogg.h
# include/ogg/os_types.h
# include/ogg/os_types.h
# lib/cmake/Ogg/OggConfig.cmake
# lib/cmake/Ogg/OggConfigVersion.cmake
# lib/cmake/Ogg/OggTargets.cmake
# lib/cmake/Ogg/OggTargets-release.cmake
# lib/libogg.a
# lib/libogg.so
# lib/pkgconfig/ogg.pc
