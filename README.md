# x-build
Cross Platform build scripts

# usage
    
    ./xbuild [script-name] [host-arch] [options]

# [script-name]
    one of the listed in 'scripts' folder

# [host-arch]
    Android:                     Alias:
        aarch64-linux-android    aa8 aa64 android-arm64 android-arm8
        armv7-linux-androideabi  aa7 aa32 android-arm android-armv7
        i686-linux-android       a86 android-x86
        x86_64-linux-android     a64 android-x64

    Linux:
        aarch64-linux-gnu        la8 la64 linux-arm64 linux-arm8
        arm-linux-gnuhf          la7 la32 linux-armhf linux-armv7
        i686-linux-gnu           l86 lx86 linux-x86 linux-i686
        x86_64-linux-gnu         l64 lx64 linux-x64 linux-x86_64

    Windows:
        aarch64-w64-mingw32      wa8 wa64 windows-arm64 win-arm64
        arm-w64-mingw32          wa7 wa32 windows-armv7 win-armv7
        i686-w64-mingw32         w86 wx32 wx86 windows-x86 win-x86
        x86_64-w64-mingw32       w64 wx64 windows-x64 win-x64

# [options]

## build
    --static    build static libs
    --shared    build shared libs (static link to dependencies)
    --sharedd   build shared libs (shared link to dependencies)
    --bin       build binaries
    --man       build manuals and documentation
    --dist      build distribution tarball
    --full      build both shared and static libs, executables and dist tarballs
    --cpack     build cpack
    --prefix    install dir

## compiler
    --clang     use clang
    --gcc       use gcc
    --strip     strip libs before install
    --api       set API level (Android)
    --tune      [option]:
                [smd855]   tune to snapdragon 855
                [smd865]   tune to snapdragon 865
                [smd888]   tune to snapdragon 888
    --cpus      print supported cpus
    --mcpu      pass target cpu to compiler (CPPFLAGS)
    --mtune     pass tune flags to compiler (CPPFLAGS)

## source
    --bra*      select branch (git/svn)
    --checkout  checkout to branch (git/svn)
    --devel     use git/svn development source instead of latest stable release tarball
    --dl        download prebuild package instead of build (dependencies)
    --force     rebuild without reload source
    --release   use latest stable release tarball instead of git/svn development source
    --update    reloads source and rebuild
    --upd-all   reloads source and rebuild, including all dependencies

## script
    --break     [option] terminates script:
                [git]          after git clone
                [patch]        after patch applied
                [config]       after config done
                [build]        after build done
                [make]         after make done
    --clear     [option]:
                [source]        remove script source code
                [sources]       remove all downloaded sources
                [builds]        remove all builds
                [packages]      remove all tarballs
                [wipe]          wipe sources, builds and dist tarballs
    --check     check if [script] package is installed
    --check2    check if [script] package is installed (v2)
    --cmake     use cmake build system instead of default
    --ccmake    run ccmake before building
    --desc      get short description from <script>
    --diff      patch utils: get diff of 2 files
    --dir-build set build directory
    --get       [option] get values of:
                [cflags]        cflags from pkg-config
                [ldflags]       ldflages from pkg-config
                [ldstatic]      ldstatic from pkg-config
                [pc-ver]        version from pkg-config
                [pc]            path of pkg-config
                [pc-name]       name of pkg-config
                [prefix]        install dir
                [libname]       'lib' from script
                [aptname]       'pkg_deb' from script
                [var] [varname] value of <varname>
                [vrs_latest]    latest version of tarball
                [vrs_remote]    git current remote version
                [vrs_taglist]   git available local tags
                [vrs_tags]      git available remote tags
                [vrs_local]     git current local version
                [opt*]          show build config options
                [log]           show log
                [patch]         show embedded patch code
                [vrs_git]       git latest remote version string
                [vrs_git_n]     git latest remote version number
    --git       [option]:
                [clone]        clone repository (script)
                [tags]         list all tags
                [info]         get json info (github)
    --goto      [option]:
                ...
    --libName   get lib name from <script>
    --list      [option]:
                [tar*]          list tarballs
                [branches]      list git available branches
                [opt*]          list options
                [tags]          list tags
                [env]           list compiler and binutils values
                [deps]          list available scripts
    --ndk-cmake use cmake executable provided by the ndk package
    --nobanner  disable banner
    --patch     [option]:
                [a|add|append]  append to patch
                [m|make|embed]  embed patch into script file (heredoc encoded)
                [g|get|show]    show (decode) patch embeded
    --skip      [option] skip script on:
                ...
    --var       get var value from <script>
    --version   get <script> source version
    --latest-release  gets the latest release
