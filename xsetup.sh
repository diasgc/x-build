#!/bin/bash
# ................................................
# setup util 1.0 2021-diasgc
# ................................................
[ -z ${vsh+x} ] && . .common

# load config
[ -f ".config" ] && . .config
install=false
install_all=false
ndk_requestupdate=false

: "${sudo:=$(command -v sudo)}"
# check command to install packages
if [ -z "${cmd_apt_install}" ];then
    if [ -f "$(command -v apt)" ];then
        cmd_apt_install="${sudo} apt install"
    elif [ -f "$(command -v pkg)" ]; then
        cmd_apt_install="${sudo} pkg install"
    elif [ -f "$(command -v brew)" ]; then
        cmd_apt_install="${sudo} brew install"
    else
        doErr 'Unknown package installer command'
    fi
fi

# check config
if [ -z "${BUILD_ARCH}" ];then
    case "$(uname -s)" in
        Linux)  build_arch=$(echo "$(uname -m)-${OSTYPE}")
                build_osid=0
                if [ -n "$(command -v getprop)" ];then
                    build_osid=0
                    #build_cpuid=$(get_cpuid $(uname -m))
                    build_arch=$(echo $(uname -m)-linux-android)
                    export API=$(getprop ro.build.version.sdk)
                fi
                ;;
        Darwin) build_arch=$(echo $(uname -m)-darwin-gnu);;
        CYGWIN*|MINGW32*|MSYS*|MINGW*) build_arch=$(echo $(uname -m)-w64-mingw32);;
    esac
fi

echo -ne "$CY1  Updating apps: "; sudo apt update || exit 1
clear

[ "$1" == "--debug" ] && shift && set -x

aptInstall(){
    local showV=1
    [ "$1" == "--nover" ] && showV= && shift
    local v=
    if [ $showV ]; then
        while [ "$1" != "" ];do
            v="${C0}install ${1}"
            echo -ne "  ${v} "
            sudo apt -qq install $1 -y >/dev/null 2>&1
            echo -ne "\e[${#v}D${CC0}${1}${C0} $(apt-cache show $1 | grep Version)"
            shift
        done
    else
        while [ "$1" != "" ];do
            v="${C0}${1}"
            echo -ne " ${v}    "
            sudo apt -qq install $1 -y >/dev/null 2>&1
            echo -ne "\e[${#v}D${CC0}${1}${C0} "
            shift
        done
    fi
    echo
}

# usage: check4Pkg label binName pkgName
checkPackage(){
    if [ $(command -v ${2}) ];then
        local v0=$(apt-cache policy ${3} | grep -Po '(Installed:).\K.*')
        local v1=$(apt-cache policy ${3} | grep -Po '(Candidate:).\K.*')
        if [ $v0=$v1 ]; then
            echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0} (latest)"
        else
            echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0}\t\t${v1}"
        fi
    elif $install_all; then
        tput rc && shift && shift && aptInstall --nover $@
    else
        echo -ne "${CR0}  ${b} ${1}${C0}\t" && tput sc && echo -ne "not installed.\t" && read -p 'Install now? [A]ll|[Y]es|[N]o]' ca
        case $ca in
            y*|Y*) tput rc && shift && shift && aptInstall --nover $@;;
            a*|A*) install_all=true; tput rc && shift && shift && aptInstall --nover $@;;
        esac
    fi
}

# usage: check4Pkg [--pkg] label [binName] pkgName...
check4Pkg(){
    if [ "${1}" == "--pkg" ];then
        shift
        local v0=$(dpkg-query -W ${2} 2>/dev/null | cut -f2)
        if [ -n "${v0}" ];then
            local v1=$(apt-cache madison ${2} | head -n1 | cut -d'|' -f2 | xargs)
            if [ $v0=$v1 ]; then
                echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0} ${CC0}${c}${C0}"
            else
                echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0}\t\t${CY1}latest: ${v1}${C0}"
            fi
        else
            echo -ne "${CR0}  ${b} ${1}${C0}\t" && tput sc && echo -ne "not installed.\t" && read -p 'Install now? [Y|n]' ca
            [ $ca=y ] && tput rc && shift && aptInstall --nover $@
        fi
    else
        if [ $(command -v $2) ];then
            local v0=$(dpkg-query -W ${3} 2>/dev/null | cut -f2)
            local v1=$(apt-cache madison ${3} | head -n1 | cut -d'|' -f2 | xargs)
            #local v0=$(apt-cache policy ${3} | grep -Po '(Installed:).\K.*')
            #local v1=$(apt-cache policy ${3} | grep -Po '(Candidate:).\K.*')
            if [ "$v0" == "$v1" ]; then
                echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0} ${CC0}${c}${C0}"
            else
                echo -e "${CC0}  ${b} ${1}${C0}\t\t${v0}\t\t${CY1}latest: ${v1}${C0}"
            fi
        else
            echo -ne "${CR0}  ${b} ${1}${C0}\t" && tput sc && echo -ne "not installed.\t" && read -p 'Install now? [Y|n]' ca
            [ $ca=y ] && tput rc && shift && shift && aptInstall --nover $@
        fi
    fi
}


#usage getAndroidNdkHomeVersion <androidNdkHomePath>
getAndroidNdkHomeVersion(){
    cat ${1}/source.properties | grep "^Pkg.Revision = " | sed 's/Pkg.Revision = //'
}

getAndroidNdkLatestAvailableVersion(){
    echo $(wget -qO- https://developer.android.com/ndk/downloads | grep ndkVersion | tr ' ' '\n' | tail -n1 | sed 's/"//g')
}

getAndroidNdkLatestDownloadUrl(){
    wget -qO- https://developer.android.com/ndk/downloads | grep -Po "https://dl.google.com/android/repository/android-ndk-r..*-linux.zip" | tail -n1
}

# usage installNdk <version>
installNdk(){
    local dhome
    local dparent
    local url=$(getAndroidNdkLatestDownloadUrl)
    [ $(command -v unzip) ] || sudo apt -qq install unzip -y >/dev/null 2>&1
    echo -ne "${CM0} downloading... ${url}${C0}"
    tput sc && echo -ne "\e[$(tput lines);0H${CY1}"

    [ -z "${ANDROID_HOME}" ] && ANDROID_HOME="~/Android"
    [ -d "${ANDROID_HOME}" ] || mkdir -p ${ANDROID_HOME}
    
    if [ -z "${ANDROID_NDK_HOME}" ];then
        dparent=${ANDROID_HOME}
        dhome="android-ndk"
    else
        dparent=$(dirname ${ANDROID_NDK_HOME})
        dhome=$(basename ${ANDROID_NDK_HOME})
        [ -d "${ANDROID_NDK_HOME}" ] && mv "${ANDROID_NDK_HOME}" "${ANDROID_NDK_HOME}.old"
    fi
    
    pushd ${dparent} >/dev/null
    wget --progress=dot ${url} -O tmp.zip 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\r%4s %s eta:%s  ",$2,$1,$4)}'
    tput rc
    echo -ne "${CM0} decompressing... ${C0}"
    unzip tmp.zip >/dev/null 2>&1
    rm tmp.zip
    mv android-ndk-* ${dhome}
    popd >/dev/null
    echo -ne "${CC0} done. ${C0}\r"
    export ANDROID_HOME ANDROID_NDK_HOME="${dparent}/${dhome}"
    printf "\nexport ANDROID_HOME=${ANDROID_HOME}\nexport ANDROID_NDK_HOME=${ANDROID_NDK_HOME}\n" >> ~/.bashrc && source ~/.bashrc
    check_android_ndk
}

function version_gt() { test "$(echo "$@" | tr " " "n" | sort -V | head -n 1)" != "$1"; }

#usage <toolchain-bin-dir> <clang-prefix> <binutil-prefix>
linkNdkBinR23(){
    ln -s "${1}/${2}-clang" "/usr/bin/${2}-clang"
    ln -s "${1}/${2}-clang++" "/usr/bin/${2}-clang++"
    ln -s "${1}/${2}-clang" "/usr/bin/${2}-as"
    ln -s "${1}/ld.lld" "/usr/bin/${2}-ld"
    ln -s "${1}/llvm-ar" "/usr/bin/${2}-ar"
    ln -s "${1}/llvm-nm" "/usr/bin/${2}-nm"
    ln -s "${1}/llvm-addr2line" "/usr/bin/${2}-addr2line"
    ln -s "${1}/llvm-objcopy" "/usr/bin/${2}-objcopy"
    ln -s "${1}/llvm-objdump" "/usr/bin/${2}-objdump"
    ln -s "${1}/llvm-ranlib" "/usr/bin/${2}-ranlib"
    ln -s "${1}/llvm-readelf" "/usr/bin/${2}-"
    ln -s "${1}/llvm-size" "/usr/bin/${2}-size"
    ln -s "${1}/llvm-strings" "/usr/bin/${2}-strings"
    ln -s "${1}/llvm-strip" "/usr/bin/${2}-strip"
    ln -s "${1}/llvm-windres" "/usr/bin/${2}-windres"
}

install_links_clang(){
    ln -s "${ANDROID_NDK_HOME}/${2}-clang" "$ROOTDIR/bin/usr/bin/${2}-clang"
    ln -s "${1}/${2}-clang++" "/usr/bin/${2}-clang++"
    ln -s "${1}/${2}-clang" "/usr/bin/${2}-as"
    ln -s "${1}/ld.lld" "/usr/bin/${2}-ld"
    ln -s "${1}/llvm-ar" "/usr/bin/${2}-ar"
    ln -s "${1}/llvm-nm" "/usr/bin/${2}-nm"
    ln -s "${1}/llvm-addr2line" "/usr/bin/${2}-addr2line"
    ln -s "${1}/llvm-objcopy" "/usr/bin/${2}-objcopy"
    ln -s "${1}/llvm-objdump" "/usr/bin/${2}-objdump"
    ln -s "${1}/llvm-ranlib" "/usr/bin/${2}-ranlib"
    ln -s "${1}/llvm-readelf" "/usr/bin/${2}-"
    ln -s "${1}/llvm-size" "/usr/bin/${2}-size"
    ln -s "${1}/llvm-strings" "/usr/bin/${2}-strings"
    ln -s "${1}/llvm-strip" "/usr/bin/${2}-strip"
    ln -s "${1}/llvm-windres" "/usr/bin/${2}-windres"
}

ndkPatchLpthread(){
  # NDK Patch: create missing libpthread in NDK
	lpthread="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/$arch/libpthread.a"
	[ ! -f $lpthread ] && $AR cr $lpthread
}

ndkPatchLrt(){
  # NDK Patch: create missing librt in NDK
  lrt="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/${arch}/librt.a"
  [ ! -f $lrt ] && $AR cr $lrt
}

check_android_ndk(){
    local latestNdk=$(getAndroidNdkLatestAvailableVersion)
    if [ ${ANDROID_NDK_HOME} ];then
        local ndkv=$(getAndroidNdkHomeVersion $ANDROID_NDK_HOME)
        local latest
        case $(vercomp $ndkv $latestNdk) in
            *) latest="(latest ${CC0}$latestNdk${C0})"; ndk_requestupdate=true;;
            0) latest="${CC0}${c}${C0}";;
        esac
        #[ $latestNdk -gt $ndkv ] && latest="(latest ${CC0}$latestNdk${C0}" || latest="${CC0}${c}${C0}"
        echo -ne "${CC0}  ${b} Android NDK${C0}\t\t${ndkv} ${latest}"
        local p="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr"
        local ar="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar"
        #echo -ne "\t\t\t${CC0}patching lrt/lpthread...${C0} "
        [ ! -f "$p/include/sys/soundcard.h" ] && echo "#include <linux/soundcard.h>" >"$p/include/sys/soundcard.h"
        for arch in aarch64-linux-android arm-linux-androideabi i686-linux-android x86_64-linux-android; do
            [ ! -f "$p/lib/$arch/libpthread.a" ] && $ar cr "$p/lib/$arch/libpthread.a"
            [ ! -f "$p/lib/$arch/librt.a" ] && $ar cr "$p/lib/$arch/librt.a"
        done
        echo -e "${CC0} lpthread/lrt patches ok${C0}"
    else
        testVer=0
        ndkVer=
        testDir=
        ndkDir=
        files=$(find ~ -name "ndk-lldb")
        for file in $files; do
            testDir="$(dirname "$file")"
            testVer=$(getAndroidNdkHomeVersion $testDir)
            [ -z $ndkVer ] && ndkVer=$testVer && ndkDir=$testDir
            test "$(echo "$testVer $ndkVer" | tr " " "n" | sort -V | head -n 1)" != "$testVer" && ndkVer=$testVer && ndkDir=$testDir
        done
        if [ -n "$ndkDir" ] && [ -d "$ndkDir" ]; then
            export ANDROID_NDK_HOME=${ndkDir}
            echo -e "${CC0}  ${b} Android NDK${C0}\t\tfound at $ndkDir $ndkVer"
            [ -z "$(cat ~/.bashrc | grep 'ANDROID_NDK_HOME')" ] && printf "\nexport ANDROID_NDK_HOME=$ndkDir\n" >> ~/.bashrc && source ~/.bashrc
        else
            echo -e "${CR0}  ${b} Android NDK not found. ${C0}" && tput sc && read -p 'Install now? [Y|n]' ca
            [ $ca=y ] && tput rc && installNdk $latestNdk
        fi
    fi
    
}

writeConfig(){
    local ldate=$(date +%s)
    local xv_ndk=$(getAndroidNdkHomeVersion $ANDROID_NDK_HOME)
    local xv_aarch64_gnu=$(ls -t /usr/lib/gcc-cross/aarch64-linux-gnu 2>/dev/null | head -n1)
    local xv_armeabi_gnu=$(ls -t /usr/lib/gcc-cross/arm-linux-gnueabihf 2>/dev/null | head -n1)
    local xv_x64_gnu=$(ls -t /usr/lib/gcc/x86_64-linux-gnu 2>/dev/null | head -n1)
    local xv_x86_gnu=$(ls -t /usr/lib/gcc-cross/i686-linux-gnu 2>/dev/null | head -n1)
    local xv_x64_mingw=$(ls -t /usr/lib/gcc/x86_64-w64-mingw32 | grep -E "*-win32" | head -n1)
    local xv_x86_mingw=$(ls -t /usr/lib/gcc/i686-w64-mingw32 | grep -E "*-win32" | head -n1)
    [ -z "${llvm_mingw}" ] && [ -n "${LLVM_MINGW_HOME}" ] && llvm_mingw=${LLVM_MINGW_HOME}
    case "$(uname -s)" in
        Linux)  build_arch=$(echo $(uname -m)-linux-gnu)
        [ -n "$(grep -q BCM2708 /proc/cpuinfo)" ] && build_arch="${build_arch}eabihf"    
        if [ -n "$(command -v getprop)" ];then
            build_arch=$(echo $(uname -m)-linux-android)
            export API=$(getprop ro.build.version.sdk)
        fi
        ;;
        Darwin) build_arch=$(echo $(uname -m)-darwin-gnu);;
        CYGWIN*|MINGW32*|MSYS*|MINGW*) build_arch=$(echo $(uname -m)-w64-mingw32);;
    esac

    cat <<-EOF >${1}
    #!/bin/bash
    export config_lastupdate=$(date +%s) \\
           ROOTDIR="$(pwd)" \\
           build_arch="${build_arch}" \\
           ANDROID_NDK_HOME="${ANDROID_NDK_HOME}" \\
           ndk_cc=(clang clang++) \\
           ndk_toolchain="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64" \\
           xv_ndk="${xv_ndk}" \\
           xv_ndk_major="${xv_ndk%%.*}" \\
           MAKE_EXECUTABLE="$(command -v make)" \\
           CMAKE_EXECUTABLE="$(command -v cmake)" \\
           NASM_EXECUTABLE="$(command -v nasm)" \\
           PKG_CONFIG="$(command -v pkg-config)" \\
           HOST_NPROC="$(nproc)" \\
           LLVM_MINGW_HOME="${llvm_mingw}" \\
           LLVM_MINGW_REL="${llvm_mingw_rel}" \\
           xv_llvm_mingw="${xv_llvm_mingw}" \\
           llvm_mingw_rel="${llvm_mingw_rel}" \\
           xv_aarch64_gnu="${xv_aarch64_gnu}" \\
           xv_armeabi_gnu="${xv_armeabi_gnu}" \\
           xv_x86_gnu="${xv_x86_gnu}" \\
           xv_x64_gnu="${xv_x64_gnu}" \\
           xv_x64_mingw="${xv_x64_mingw%%-*}" \\
           xv_x86_mingw="${xv_x86_mingw%%-*}"
           
           
	EOF
}

check_llvm_mingw(){
    if [ -z "${LLVM_MINGW_HOME}" ] || [ ! -d "${LLVM_MINGW_HOME}" ]; then
        find_llvm_mingw
        if [ -z ${llvm_mingw} ];then
            install_llvm_mingw
        else
            echo -e "${CC0}  ${b} LLVM-MINGW${C0}\t\t$xv_llvm_mingw (found at ~/${LLVM_MINGW_HOME#"$HOME"/})"
            export LLVM_MINGW_HOME=${llvm_mingw}
        fi
    else
        local latest_rel=$(git ls-remote --tags --refs --sort="v:refname" 'https://github.com/mstorsjo/llvm-mingw.git' 2>/dev/null | tail -n1 | sed 's/.*\///')
        #if [ "${latest_rel}" != "${llvm_mingw_rel}" ];then
        #    local d=$(pwd)
        #    echo -ne "${CC0}  ${b} LLVM-MINGW${C0}\t\t$xv_llvm_mingw release ${llvm_mingw_rel} upgrading to ${latest_rel}..."
        #    cd $LLVM_MINGW_HOME; cd ..
        #    rm -rf $LLVM_MINGW_HOME
        #    install_llvm_mingw $(pwd)
        #    echo -e "\b\b\b${CC1} done (release ${llvm_mingw_rel})${C0}"
        #    cd $d
        #else
            echo -e "${CC0}  ${b} LLVM-MINGW${C0}\t\t$xv_llvm_mingw release ${llvm_mingw_rel} (latest ${latest_rel})"
        #fi
    fi
}

find_llvm_mingw(){
    echo -ne "searching... "
    llvm_mingw=$(find ~ -name "aarch64-w64-mingw32-clang")
    [ -f "$llvm_mingw" ] && {
        xv_llvm_mingw="$(${llvm_mingw} --version | grep -oP '\d*\.\d*.\d* (?=\()')"
        llvm_mingw=$(dirname "${llvm_mingw%/*}")
        echo -ne " found $xv_llvm_mingw at $llvm_mingw "
        [ -d "$llvm_mingw" ] && return 0
    }
    unset llvm_mingw
    echo -ne "not found"
}

install_llvm_mingw(){
    echo -ne "installing... "
    [ -z $1 ] && d=~ || d=$1
    if [ -d "$d" ];then
        local od=$(pwd)
        cd $d
        [ -d "llvm-mingw" ] && rm -rf "llvm-mingw"
        export llvm_mingw_rel=$(git ls-remote --tags --refs --sort="v:refname" 'https://github.com/mstorsjo/llvm-mingw.git' 2>/dev/null | tail -n1 | sed 's/.*\///')
        wget_untar "https://github.com/mstorsjo/llvm-mingw/releases/download/${llvm_mingw_rel}/llvm-mingw-${llvm_mingw_rel}-ucrt-ubuntu-18.04-$(uname -m).tar.xz" "llvm-mingw"
        export LLVM_MINGW_HOME="$(pwd)/llvm-mingw"
        export xv_llvm_mingw=$(./llvm-mingw/bin/aarch64-w64-mingw32-clang --version | grep -oP '\d*\.\d*.\d* (?=\()')
        cd $od
    fi
}

banner 'Setup Utility'

if [ "$1" == "--ndk" ]; then
    rm -rf ${ANDROID_NDK_HOME}
    installNdk $(getAndroidNdkLatestDownloadUrl)
    exit 0
fi

case $(uname -m) in
    x86_64)
        echo -e "\n${CC1}${b} Toolchains${C0}"
        #ANDROID NDK
        check_android_ndk
        check_llvm_mingw
        # https://github.com/llvm/llvm-project/releases/download/llvmorg-13.0.0/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz

        #MINGW
        #check4Pkg 'MinGW-w64' 'x86_64-w64-mingw32-gcc' 'mingw-w64'
        #check4Pkg 'MinGW-w64' 'x86_64-w64-mingw32-gcc' 'mingw-w64'

        #CROSS-ARCH-GNU
        check4Pkg 'i686-GNU' 'i686-linux-gnu-gcc' 'gcc-i686-linux-gnu' 'g++-i686-linux-gnu'
        check4Pkg 'Aarch64-GNU' 'aarch64-linux-gnu-gcc' 'gcc-aarch64-linux-gnu' 'g++-aarch64-linux-gnu' 'libstdc++-11-dev-arm64-cross'
        check4Pkg 'Armhf-GNU' 'arm-linux-gnueabihf-gcc' 'gcc-arm-linux-gnueabihf' 'g++-arm-linux-gnueabihf' 'libstdc++6-armhf-cross'
        ;;
    aarch64)
        check_llvm_mingw
        ;;
esac



echo -e "\n${CC1}${b} Build tools${C0}"
#MAKE
check4Pkg 'Make   ' 'make' 'make'
#CMAKE
check4Pkg 'Cmake  ' 'cmake' 'cmake'
check4Pkg 'CCmake ' 'ccmake' 'cmake-curses-gui'
# Build Essential
check4Pkg --pkg 'BuildTools' 'build-essential'
# GNU Autotools
check4Pkg 'Automake ' 'automake' 'automake'
check4Pkg 'Autoconf ' 'autoconf' 'autoconf'
check4Pkg 'Autogen  ' 'autogen' 'autogen'
check4Pkg 'Autopoint' 'autopoint' 'autopoint'
check4Pkg 'Libtool  ' 'libtool' 'libtool-bin'
check4Pkg 'M4       ' 'm4' 'm4'

check4Pkg 'NASM     ' 'nasm' 'nasm'
check4Pkg 'YASM     ' 'yasm' 'yasm'
check4Pkg 'PkgConfig' 'pkg-config' 'pkg-config'

echo -e "\n${CC1}${b} Repository tools${C0}"
check4Pkg 'Git      ' 'git' 'git'
check4Pkg 'Subversion' 'svn' 'subversion'
check4Pkg 'LZip     ' 'lzip' 'lzip'
check4Pkg 'Unzip    ' 'unzip' 'unzip'

echo -e "\n${CC1}${b} Other tools${C0}"
check4Pkg --pkg 'Gperf    ' 'gperf'
check4Pkg --pkg 'Bison    ' 'bison'
check4Pkg --pkg 'Texinfo  ' 'texinfo'
check4Pkg --pkg 'Patch    ' 'patch'
check4Pkg --pkg 'Jq       ' 'jq'

if $ndk_requestupdate; then
    echo -e "\n\n  Update NDK to latest version? Type 'Yes' to proceed. "; read r
    [ "${r}" == "Yes" ] && clear && installNdk
fi

echo -ne "\n  ${CC0}Writing config... "

writeConfig .config

echo -e "Done${C0}\n"

