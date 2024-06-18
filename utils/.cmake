#!/bin/bash

# script env variables

# cmake_toolchain_file

# cmake_static
# cmake_shared
# cmake_nin

# cmake_definitions[]
# cmake_cxx_flags_release[]
# cmake_c_flags_release[]
# cmake_include_directories[]
# WFLAGS

cmake_clang_toolchain(){
	export cmake_toolchain_file="${dir_build}/${arch}.cmake"
	cat <<-EOF >${cmake_toolchain_file}
		set(CMAKE_SYSTEM_NAME "${PLATFORM}")
		set(CMAKE_SYSTEM_PROCESSOR "${cmake_system_processor}")
		set(CMAKE_C_COMPILER ${CC})
		set(CMAKE_CXX_COMPILER ${CXX})
		set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
		set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
		set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
		set(CMAKE_FIND_ROOT_PATH ${cmake_findrootpath})
		EOF
}

: "${cmake_fulltoolchain:=true}"

cmake_build_toolchainfile(){
	export cmake_toolchain_file="${dir_build}/${arch}.cmake"
	cat <<-EOF >${cmake_toolchain_file}
		set(CMAKE_SYSTEM_NAME "${PLATFORM}")
		set(CMAKE_SYSTEM_PROCESSOR "${cmake_system_processor}")
		set(CMAKE_C_COMPILER ${CC})
		set(CMAKE_CXX_COMPILER ${CXX})
		set(CMAKE_ASM_NASM_COMPILER ${ASM_NASM})
		EOF
	$cmake_fulltoolchain && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_AR ${AR} CACHE FILEPATH Archiver)
		set(CMAKE_RANLIB ${RANLIB} CACHE FILEPATH Indexer)
		set(CMAKE_C_COMPILER_AR "${AR}")
		set(CMAKE_CXX_COMPILER_AR "${AR}")
		set(CMAKE_C_COMPILER_RANLIB "${RANLIB}")
		set(CMAKE_CXX_COMPILER_RANLIB "${RANLIB}")
		set(CMAKE_OBJDUMP "${OBJDUMP}")
		set(CMAKE_OBJCOPY "${OBJCOPY}")
		set(CMAKE_READELF "${READELF}")
		set(CMAKE_STRIP "${STRIP}")
		set(CMAKE_ADDR2LINE "${ADDR2LINE}")
		set(CMAKE_LINKER "${LD}")
		set(CMAKE_NM "${NM}")
		set(CMAKE_POSITION_INDEPENDENT_CODE 1)
		EOF
	$host_cross && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
		set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
		set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
		set(CMAKE_FIND_ROOT_PATH ${cmake_findrootpath})
		EOF

	$host_x86 && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_C_COMPILER_ARG1 "-m32")
		set(CMAKE_CXX_COMPILER_ARG1 "-m32")
		EOF
	
  $build_shared && NDK_STL="shared" || NDK_STL="static"
	$host_ndk && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_ANDROID_NDK OFF)
		set(ANDROID_ABI ${ABI})
		set(ANDROID_PLATFORM ${API})
		set(ANDROID_NDK ${ANDROID_NDK_HOME})
		set(ANDROID_STL c++_${NDK_STL})
		set(ZLIB_INCLUDE_DIRS ${SYSROOT}/usr/include)
		set(ZLIB_LIBRARIES ${SYSROOT}/usr/lib/${arch})
		set(ZLIB_VERSION_STRING 1.2.11)
		include(${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake)
		EOF
	
	#mingw_stdlibs='-lwsock32 -lws2_32 -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32'
	mingw_stdlibs='-static-libgcc -static-libstdc++ -lwsock32 -lws2_32'
	mingw_exelink='-Wl,-Bstatic'
	#mingw_exelink='-static-libgcc -static-libstdc++ -Wl,-pdb='
	$host_mingw && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_COMPILER_IS_MINGW ON)
		set(CMAKE_FIND_ROOT_PATH \${CMAKE_FIND_ROOT_PATH} ${LLVM_MINGW_HOME}/generic-w64-mingw32 ${LLVM_MINGW_HOME}/${arch}-w64-mingw32/bin)
		set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "${LLVM_MINGW_HOME}/${arch}/include/c++/v1;${LLVM_MINGW_HOME}/lib/clang/*/include;${LLVM_MINGW_HOME}/${arch}/include")
		set(CMAKE_RC_COMPILER ${CROSS_PREFIX}windres)
		set(CMAKE_MC_COMPILER ${CROSS_PREFIX}windmc)
		set(CMAKE_CXX_STANDARD_LIBRARIES "${mingw_stdlibs} \${CMAKE_CXX_STANDARD_LIBRARIES}")
		#set(CMAKE_EXE_LINKER_FLAGS "${mingw_exelink} \${CMAKE_EXE_LINKER_FLAGS}")
		set(CMAKE_FIND_LIBRARY_PREFIXES "lib" "")
		set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll" ".dll.a" ".lib" ".a")
		EOF
	#cmake_addcpack
  	test -n "${cmake_definitions}" && echo "add_definitions("${cmake_definitions[@]}")" >>${cmake_toolchain_file}
	test -n "${cmake_add_link_options}" && echo "add_link_options("${cmake_add_link_options}")" >>${cmake_toolchain_file}
	test -n "${cmake_add_compile_options}" && echo "add_compile_options("${cmake_add_compile_options[@]}")" >>${cmake_toolchain_file}
	test -n "${cmake_cxx_flags_release}" && echo "set(CMAKE_CXX_FLAGS_RELEASE \""${cmake_cxx_flags_release[@]}"\" CACHE STRING \"\" FORCE)" >>${cmake_toolchain_file}
	test -n "${cmake_c_flags_release}" && echo "set(CMAKE_C_FLAGS_RELEASE \""${cmake_c_flags_release[@]}"\" CACHE STRING \"\" FORCE)" >>${cmake_toolchain_file}
	test -n "${cmake_include_directories}" && echo "include_directories("${cmake_include_directories[@]}")" >>${cmake_toolchain_file}
	test -n "${WFLAGS}" && echo "add_definitions(\"${WFLAGS}\")" >>${cmake_toolchain_file}
	
}

cmake_shouldreplace_cmakelists(){
	test ! "x${cfg}" == "xcmake" && return 0
	test -f "${dir_config}/CMakeLists.txt" && test -z "${cmake_file}" && return 0
	test -f "${dir_root}/cmake/${lib}.cmake" && return 1
}

cmake_generate_pkgconfig_pc_in(){
	cat <<-EOF >"${dir_src}/${lib}.pc.in"
		prefix=@CMAKE_INSTALL_PREFIX@
		exec_prefix=${prefix}
		libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
		includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
		
		Name: @PROJECT_NAME@
		Description: @CMAKE_PROJECT_DESCRIPTION@
		URL: @CMAKE_PROJECT_HOMEPAGE_URL@
		Version: @PROJECT_VERSION@
		Requires: 
		Requires.private: @REQ_PRIVATE@
		Libs: -L${libdir} -l@PROJECT_NAME@
		Libs.private: @LIBS_PRIVATE@
		Cflags: -I${includedir}
		EOF
}

cmake_build_package(){

	local brk=false
	local flist=

	until $brk; do
		read l || brk=true
		flist="$(echo $l | sed 's|'${dir_install}'/||') $flist"
	done < ${dir_build}/install_manifest.txt

	# add manual pc files
	if [ -n "${pc_llib}" ]; then
		flist="lib/pkgconfig/${pc_llib//-l/lib}.pc ${flist}"
	elif [ -n "${pc_llibs}" ]; then
		for ll in $pc_llibs; do
			flist="lib/pkgconfig/${ll//-l/lib}.pc ${flist}"
		done
	fi

	# check licence files
	if [ -n "${lst_lic}" ]; then
		[ -d "${dir_install}/share/doc/${lib}" ] || mkdir -p "${dir_install}/share/doc/${lib}"
		for f in ${lst_lic}; do
			if [ ! -f "${dir_install}/share/doc/${lib}/${f}" ]; then
				cp ${dir_src}/${f} "${dir_install}/share/doc/${lib}/"
				flist="share/doc/${lib}/${f} ${flist}"
			fi
		done
	fi

	# no flist, return
	[ -z "${flist}" ] && return 0

	# sort flist
	flist=$(echo ${flist} | xargs -n1 | sort | xargs)

	pushdir ${dir_install}

	local v=$(pkg-config ${dir_install_pc}/${pkg}.pc --modversion)
	v=$(version_parse $v)
	local sfx=
	$build_shared || sfx='-static'
	$build_static || sfx='-shared'
	local fn="${lib}${sfx}_${v}_${arch}"

	case ${pkg_fmt} in
		tbz)
		fn="${fn}.tar.bz2"
		tar -cvjSf "${fn}" ${flist}
		;;
		zip)
		fn="${fn}.zip"
		zip -r "${fn}" ${flist}
		;;
		*)
		fn="${fn}.tar.gz"
		tar -czvf "${fn}" ${flist}
		;;
	esac
	[ -d "${dir_pkgdist}" ] || mkdir -p ${dir_pkgdist}
	mv "${fn}" ${dir_pkgdist}/${fn}

	if [ -z "$(cat ${dir_root}/${lib}.sh | grep '# Filelist')" ]; then
		echo -e "\n\n# Filelist\n# --------" >> ${dir_root}/${lib}.sh
		echo "# ${flist}" | sed 's| |\n# |g' >> ${dir_root}/${lib}.sh
	fi
	popdir
}

cmake_check_cmakefiles(){
	if [ -f "${dir_root}/cmake/${lib}.cmake" ]; then
		test -f "${dir_src}/CMakeLists.txt" && mv ${dir_src}/CMakeLists.txt ${dir_src}/CMakeLists.orig
		cp ${dir_root}/cmake/${lib}.cmake ${dir_src}/CMakeLists.txt
	elif [ -n "${cmake_file}" ]; then
		cp ${dir_root}/cmake/${cmake_file} ${dir_src}/CMakeLists.txt
	fi
	return 0
}

#1=cmake_key 2=$build_key_bool 
cmake_readkey(){
	local arr
	local ret
	if [ -n "${!1}" ]; then
		arr=(${!cfg_static//|/ })
		case ${#arr[@]} in
			1) ${!2} && ret="-D${arr[0]}=ON" || ret="-D${arr[0]}=OFF";;
			2) ${!2} && ret="-D${arr[0]}" || ret="-D${arr[1]}";;
		esac
	fi
	echo "${ret}"
}

cmake_include_directories(){
	printf "include_directories($@)" >>${cmake_toolchain_file}
}

# SYNTAX: cmake_install_ext [./cmake/]src [sources/lib/]dstpath
cmake_install_ext(){
    local src
    local dst
    test -f "$1" && src=$1 || src="${dir_sources}/../cmake/$1"
    test -f "$src" || do_log "$1 dir does not exists"
    test -z "$2" && dst=${dir_src}/$2 || dst=$2
    test -f "$dst" || dst="${dir_src}/$dst"
    test -f "$dst" || do_log "$dst does not exists"
    cp -f ${src} ${dst}
}

cmake_create_cmakelists(){
    cmake_install_ext $1 ${dir_src}/CMakeLists.txt
}

cmake_addcpack(){
	[ -z "${vnd}" ] && str_contains $src 'git' && vnd=$(git_vendor $src) || vnd=$lib
	local u_email=$(git config --list | grep -oP '(?<=^user.email=).*$')
	local u_name=$(git config --list | grep -oP '(?<=^user.name=).*$')
	local f_lic=$(echo "$lst_lic" | awk '{print $1}')
	[ -z "${vrs}" ] && vrs=$(git describe --git-dir=${dir_src}/.git --abbrev=0 --tags 2>/dev/null)
	[ -z "${vrs}" ] && vrs='0.0.0'
	export CPACK="-DCPACK_RESOURCE_FILE_LICENSE=${dir_src}/${f_lic} -DCPACK_PACKAGE_VERSION=\${CMAKE_PROJECT_VERSION} -DCPACK_PACKAGE_FILE_NAME=\${CMAKE_PROJECT_NAME}_\${CMAKE_PROJECT_VERSION}_${arch}"
	cat <<-EOF >>${cmake_toolchain_file}
		set(CPACK_PACKAGE_NAME "${lib}")
		set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${dsc}")
		set(CPACK_PACKAGE_VENDOR "${vnd}")
		set(CPACK_VERBATIM_VARIABLES YES)
		set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
		set(CPACK_OUTPUT_FILE_PREFIX "${dir_pkgdist}")
		set(CPACK_PACKAGING_INSTALL_PREFIX "${dir_install}")
		set(CPACK_PACKAGE_CONTACT "${u_email}")
		set(CPACK_DEBIAN_PACKAGE_MAINTAINER "${u_name}")
		#set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
		# package name for deb
		# if set, then instead of some-application-0.9.2-Linux.deb
		# you'll get some-application_0.9.2_amd64.deb (note the underscores too)
		set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
		# if you want every group to have its own package,
		# although the same happens if this is not sent (so it defaults to ONE_PER_GROUP)
		# and CPACK_DEB_COMPONENT_INSTALL is set to YES
		set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)#ONE_PER_GROUP)
		# without this you won't be able to pack only specified component
		set(CPACK_DEB_COMPONENT_INSTALL YES)
		include(CPack)
		EOF
}