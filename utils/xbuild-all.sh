#!/bin/bash
# ................................................
# X-Build util 0.4.0 2024-diasgc
# ................................................

# .common

vsh='0.3.2-main'

#b="\u25ba"
b="\u2605"
c="\u2714"

# box chars
BX0="\u2502" BX1="\u251C" BX2="\u250C" BX3="\u2514" BX4="\u252C" BX5="\u2500"
BXH="${BX1}${BX5}${BX4}${BX5}${CY1}" BXL="${BX0} ${BX1}${BX5}${CY2}" BXE="${BX0} ${BX3}${BX5}${CY1}"

# def theme colors
C0="\e[0m" CW="\e[97m"  CD="\e[90m" CW2="\e[38;5;234m" CW3="\e[38;5;238m" CW4="\e[38;5;242m"  CW5="\e[38;5;246m" CW6="\e[38;5;250m"
CR0="\e[31m" CR1="\e[91m" CR2="\e[38;5;52m" CR3="\e[38;5;88m" CR4="\e[38;5;124m" CR5="\e[38;5;160m"  CR6="\e[38;5;196m"
CY0="\e[33m" CY1="\e[93m" CY2="\e[38;5;58m" CY3="\e[38;5;94m" CY4="\e[38;5;136m" CY5="\e[38;5;178m"  CY6="\e[38;5;220m"
CG0="\e[32m" CG1="\e[92m" CG2="\e[38;5;40m" CG3="\e[38;5;46m" CG4="\e[38;5;82m" CG5="\e[38;5;118m"  CG6="\e[38;5;154m"
CC0="\e[36m" CC1="\e[96m" CC2="\e[38;5;49m" CC3="\e[38;5;85m" CC4="\e[38;5;122m" CC5="\e[38;5;123m"  CC6="\e[38;5;195m"
CB0="\e[34m" CB1="\e[94m" CB2="\e[38;5;26m" CB3="\e[38;5;69m" CB4="\e[38;5;111m" CB5="\e[38;5;152m"  CB6="\e[38;5;153m"
CM0="\e[35m" CM1="\e[95m" CM2="\e[38;5;54m" CM3="\e[38;5;91m" CM4="\e[38;5;126m" CM5="\e[38;5;162m"  CM6="\e[38;5;198m"

CO0="\e[38;5;130m" CO1="\e[38;5;166m" CO2="\e[38;5;202m" CO3="\e[38;5;208m"  CO4="\e[38;5;214m" CO5="\e[38;5;220m" CO6="\e[38;5;223m"
CF0="\e[38;5;53m"  CF1="\e[38;5;89m"  CF2="\e[38;5;125m" CF3="\e[38;5;161m"  CF4="\e[38;5;197m" CF5="\e[38;5;211m" CF6="\e[38;5;219m"
CL0="\e[38;5;34m" CL1="\e[38;5;72m" CL2="\e[38;5;114m" CL3="\e[38;5;120m"  CL4="\e[38;5;156m" CL5="\e[38;5;192m" CL6="\e[38;5;230m"

# theme colors
CT0=$CM0 CT1=$CM1 CS0=$CR0 CS1=$CR1 SSB=$C0

function trap_sigint {
  tput cnorm
  cd $(dirname $0)
  local l
  [ -f "${log_file}" ] && l="  Log available at ${log_file}\n"
  echo -e "\n\n${CY1}  Interrupted by user${C0}\n${l}\n"
  trap - SIGINT
  exit 1
}

shopt -s extglob
trap trap_sigint SIGINT

# Logger
logtime_start=
export dir_root=$(pwd)
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;95m\]\u@\e[0;95m\h\[\033[00m\]:\[\033[01;96m\]\w\[\033[00m\]\$ '


splash(){
  cat << "EOF"

THE ▀▄ ▄▀   █▀▀▄ █  █ ▀█▀ █   █▀▀▄
     ▄▀▄ ▀▀ █▀▀▄ █  █  █  █   █  █ 
    ▀   ▀   ▀▀▀  ▀▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀ 

   Cross-build scripts for ubuntu
    
EOF
}

color_vars(){
	local v
	local box=
	for c in R Y G C B M O F L; do
		for i in 0 1 2 3 4 5 6; do
			v="C${c}${i}"
			printf "$v\u2605 "
		done
		printf "\n"
	done
	echo
}

color_table(){
  local i=16
  while [ $i -lt 52 ]; do
    j=$i
    k=0
    until [ $k == 7 ]; do
      printf "\e[38;5;%dm\u25cf %03d   " ${j} ${j}
      j=$(((j+36)%256))
      k=$((k+1))
    done
    i=$((i+1))
    printf '\r\n'
  done
}

hwinfoCountCoresReadable(){
  case $(nproc) in
    "1") echo "Single-Core";;
    "2") echo "Dual-Core";;
    "4") echo "Quad-Core";;
    "6") echo "Hexa-Core";;
    "8") echo "Octa-Core";;
    *) echo "$(nproc)-Core";;
  esac
}

hwinfoProcessor(){
  local i=$(cat /proc/cpuinfo | grep -Po '^.odel.*: \K(.*)' | tail -n1)
  [ -z "$i" ] && i=$(cat /proc/cpuinfo | grep -Po '^.ardware.*: \K(.*)' | tail -n1)
  [ -z "$i" ] && i=Unknown
  echo $i
}

banner(){
    echo -ne "\n\n  ${CW}${1} for X-Build ${vsh}${C0}\n  "
    echo -ne "Running on $(uname -m) $(uname -o) "
    [ -n $(command -v lsb_release) ] && echo -ne "$(lsb_release -sd) "
    if [ -n "$(uname -r | grep 'microsoft')" ];then
        echo -ne "${CD}WSL2 "
    elif [ -n "$(uname -r | grep 'Microsoft')" ];then
        echo -ne "${CD}WSL "
    else
        echo -ne "${CD} "
    fi
    echo -e "$(uname -r)${C0}"
    echo -e "${CW}  $(hwinfoCountCoresReadable) $(hwinfoProcessor)${C0}"
}

fn_defined(){
  [ "$(type -t $1)" = 'function' ]
}

fn_undef(){
  unset -f $1
}

fn_log(){
  if [ -z "$1" ]; then
    $2
  else
    do_log "$1" $2
  fi
  unset -f $2
}

isfn_defined(){
  [ "$(type -t $1)" = 'function' ]
}

git_getversion(){
  [ -d "${1}" ] && git --git-dir=${1}/.git --work-tree=${1} describe --abbrev=0 --tags || git describe --abbrev=0 --tags
}

array_join(){
  local IFS="${1}" && shift
  echo "$@"
}

#usage: str_concat 'sep' [arg_list]
str_concat(){
  local IFS="$1" && shift
  echo "$*"
}

# usage: str_contains str1 substr2
str_contains(){
   [ -z "${1##*${2}*}" ]
}

# usage: str_starts str1 substr2
str_starts(){
   [ "${1#${2}}" != "${1}" ]
}

str_ends(){
   [ "${1%${2}}" != "${1}" ]
}

str_lowercase(){
  echo ${1} | tr '[:upper:]' '[:lower:]'
}

str_uppercase(){
  echo ${1} | tr '[:lower:]' '[:upper:]'
}

defvar(){
  local k
  while [ -n "${1}" ]; do
    k=${1%=*}
    [ -z ${k+x} ] && eval $k=${1#*=}
  done
}

pushv(){
  while [ -n "${1}" ]; do
    shell_vstack+=("$1")
    shift
  done
  return 0
}

popv(){
  if [ -z "${1}" ]; then
    local n=${#shell_vstack[@]}
    if [ $n -gt 0 ]; then
      echo ${shell_vstack[n-1]}
      unset shell_vstack[-1]
    fi
  else while [ -n "${1}" ]; do
    eval "$1"="'$(popv)'"
    shift
    done
  fi
  return 0
}

clearv(){
  unset shell_vstack
}

pushdir(){
  case $SHELL in
    *bash) pushd $1 >/dev/null 2>&1;;
    *) pushvar_f shell_dstack $1; cd $1;;
  esac
}

popdir(){
  case $SHELL in
    *bash) popd >/dev/null 2>&1;;
    *) local d=$(popvar_f shell_dstack); [ -n "$d" ] && cd $d;;
  esac
}

# usage: set_bool <condition> <value_true> <value_false>
set_bool(){
  $1 && echo $2 || echo $3
}

prt_progress_old(){
  printf "%-6s"
  while read -r ln; do
    printf "\e[6D%-6s" $(grep -oP '\d+%' <<< $ln)
  done
  printf "\e[6D"
}

prt_progress(){
  printf "%-6s"
  local sln
  while read -r ln; do
    str_contains $ln 'error: ' && printf $CR1
    sln=$(grep -oP '\d+%' <<< $ln)
    [ -n "$sln" ] && printf "\e[5D%-5s" $sln
  done
  printf "\e[6D"
}

inc_tab(){
  export indent=$((indent+2))
  export inds="${ind}┬─"
  export inde="${ind}└─"
  export ind+="│ "
  #echo "inctab: $indent $ind............"
}

dec_tab(){
  export indent=$((indent-2))
  [ ${#ind} -gt 1 ] && export ind="${ind::-2}"
  #echo "dectab: $indent $ind............"
}


# exclusive variable add substrings left var_xaddl <var> <substrings...>
# appends substrings to the left/start of var iff main doesnt contains substring
var_xaddl(){
  local v=$1; shift
    while [ -n "$1" ];do
        [ -z "${!v##*${1}*}" ] || eval $v=\"${1} ${!v}\"
        shift
    done
}

# exclusive variable add substrings right var_xaddl <var> <substrings...>
# appends substrings to the right/end of var variable iff main doesnt contains substring
var_xaddr(){
    local v=$1; shift
    while [ -n "$1" ];do
        [ -z "${!v##*${1}*}" ] || eval $v=\"${!v} ${1} \"
        shift
    done
}

var_addr(){
    local v=$1; shift; eval $v=\"${!v} $@\"
}

var_addl(){
    local v=$1; shift; eval $v=\"$@ ${!v}\"
}

# vercomp v1 v2 returns 0: v1=v2, 1: v1>v2, 2: v1<v2
vercomp () {
    test "$1" = "$2" && return 0
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
        test -z "${ver2[i]}" && ver2[i]=0
        if ((10#${ver1[i]} > 10#${ver2[i]})); then return 1; fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then return 2; fi
    done
    return 0
}

rm_quiet(){
  rm -rf $@ 2>&1 >/dev/null
}

rm_log(){
  local log=$1; shift
  [ -f "${log}" ] && [ -n "$@" ] && rm -rf $@ 2>&1 >>${log}
}

log_progress(){
  printf "%-6s"
  local sln
  IFS=$'\n'
  while read -r ln; do
    # $has_logfile && \
    printf "%-6s: %s\n" $(time_elapsed) $ln >>${logfile}
    str_contains $ln 'error: ' && printf $CR1
    sln=$(grep -oP '\d+%' <<< $ln)
    [ -n "$sln" ] && printf "\e[5D%-5s" $sln
  done
  printf "\e[6D"
  unset IFS
}

# usage: log <logfile> [--noerr|--progress] <label> <commands....>
log(){
  local noerr=false
  local progress=false
  while $(str_starts $1 '--');do
    case $1 in
      --noerr) noerr=true;;
      --progress) progress=true;;
    esac
    shift
  done
	local label=$1; shift
	echo -ne "${CD}${label}${C0}"
	echo -e "\n$(time_elapsed): $@" >> "$logfile"
  if $progress; then
	  ("$@" |& log_progress) || err "in ${act}:\n\n...\n$(tail -n5 ${logfile}${C0})"
  else
	  "$@" 2>> "$logfile" 1>> "$logfile" || err
  fi
	echo -ne "\e[${#label}D${CT0}${label}${C0} "
}

log_init(){
  export logfile=${1}
  [ -f "${1}" ] && rm -f $logfile
  export log_timestart=$(date +%s)
}

logsc(){
  echo -ne "  ${CC0} $1"
  shift
  "$@"
  echo -e " ${CC1}done${C0}"
}

logv(){
  while [ -n "${1}" ]; do
    echo "$1=${!1}" >>${logfile} 2>&1
    shift
  done
  echo >>${logfile}
}

log_end(){
  log_timestop=$(date +%s)
  local secs=$(($log_timestop-$log_timestart))
  local msg="${CT1} done ${CD}in $(secs2time ${secs})"
  [ $secs -gt 60 ] && msg="$msg (${secs}s)"
  #echo -e "$msg pkg/lib: ${pkgsize}/${libsize}kb${C0}"
  echo -e "$msg"
}

err(){
  if [ $# -gt 0 ];then
    echo -e "${CR1}  Error: ${CR0}${1}${C0}\n\n"
    if [ -f "${logfile}" ];then
      # todo
      #if [ -f ${BUILD_DIR}/CMakeFiles/CMakeError.log ];then
      #  echo -e "\n\n${BUILD_DIR}/CMakeFiles/CMakeError.log:\n" >> $logfile
      #  cat ${BUILD_DIR}/CMakeFiles/CMakeError.log >> $logfile
      #fi
      echo -ne "${CY1}${ind}Open log? [Y|n]:${C0}" && read openlog
      case $openlog in y*|Y*) nano ${logfile};; esac
    fi
  fi
  exit 1
}

time_elapsed(){
  if [ -n "${log_timestart}" ] && [ ${log_timestart} -gt 0 ];then
    local dt=$(($(date +%s) - ${log_timestart}))
    printf "+%-10s" $(date -u -d @${dt} +"%m:%S")
  else
    printf " --:-- "
  fi
}

url_dom(){
  echo "$1" | awk -F/ '{print $3}'
}

git_vendor(){
  echo "$1" | awk -F/ '{print $4}'
}

# usage: git_get_version srcdir
git_local_version(){
  local out;
  if [ -d "${1}/.git" ];then
    local d=$(pwd)
    cd ${1}
    out=$(git describe --abbrev=0 --tags 2>/dev/null)
    cd ${d}
  fi
  echo $out
}

git_remote_version(){
  echo $(git ls-remote --tags --refs --sort="v:refname" ${1} 2>/dev/null | head -n1 | sed 's/.*\///')
}

git_api_tojson(){
  local s=$(echo "$1" | sed 's/https:\/\///g; s/\// /g; s/\.git$//')
  set -- $s
  case ${1} in
    github*) echo -e "$(curl https://api.github.com/repos/${2}/${3} 2>/dev/null)";;
    gitlab*) echo -e "$(curl -XGET -H "Content-Type: application/json" "https://${1}/api/v4/projects/${2}%2F${3}" 2>/dev/null)";;
    *) echo;;
  esac
}

get_latest_release() {
  local s=$(echo "$1" | sed 's/https:\/\///g; s/\// /g; s/\.git$//')
  set -- $s
  #echo -ne "$1: $2/$3"
  case $1 in
    github*) echo -e "$(curl --silent "https://api.github.com/repos/${2}/${3}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')";;
  esac                                # Pluck JSON value
}

wget_untar(){
  local args
  case $1 in
    *.tar.lz) 
      [ -z $(command -v lzip) ] || exit 1
      args="--lzip -xv"
      ;;
    *.tar.gz|*.tgz) args="-xvz";;
    *.tar.xz) args="-xvJ";;
  esac
  [ -d "tmp" ] && rm -rf tmp
  mkdir tmp
  wget -qO- $1 2>/dev/null | tar --transform 's/^dbt2-0.37.50.3/dbt2/' $args -C tmp >/dev/null 2>&1 || exit 1
  cd tmp
  mv * $2 && mv $2 ..
  cd ..
  rm -rf tmp
}

gitlab_licence(){
  local s=$(echo "$1" | sed 's/https:\/\///g; s/\// /g; s/\.git$//')
  set -- $s
  if [ "$1" == "github.com" ];then
    echo -e "$(curl https://api.github.com/repos/${2}/${3} 2>/dev/null)"
  elif [ "${1}" != "${1#gitlab}" ];then
    local json=$(curl -XGET -H "Content-Type: application/json" "https://${1}/api/v4/projects/${2}%2F${3}" 2>/dev/null)
    local id=$(echo "$json" | jq .id)
    echo ${id} "curl --request GET https://${1}/api/v4/licence/${id}"
  else
    echo
  fi
}

github_json_desc(){
  echo "${1}" | jq .description | sed 's/"//g'
}

github_jq(){
  echo "${1}" | jq "${2}" | sed 's/"//g'
}

#usage: arch_fromid out_arm64 out_arm out_x86 out_x64
arch_fromid(){
  local xid=$(expr "$cpu_id" % 4)
  local args=("$@")
  echo "${args[${xid}]}"
}

#usage: arch_fromid out_android out_linux out_windows
os_fromid(){
  local xid=$(expr "$cpu_id" / 4 % 3)
  local args=("$@")
  echo "${args[${xid}]}"
}

load_hostfeats(){
  case $host_cpuid in
    0) arch="${arch_list[0]}"; host_arm=true; host_arm64=true; LIBSDIR+="${ldir_list[0]}";;
    1) arch="${arch_list[1]}"; host_arm=true; host_arm32=true; LIBSDIR+="${ldir_list[1]}";;
    2) arch="${arch_list[2]}"; host_x86=true; LIBSDIR+="${ldir_list[2]}";;
    3) arch="${arch_list[3]}"; host_x64=true; host_cross=false; LIBSDIR+="${ldir_list[3]}";;
  esac
}

format_pathlist(){
  local sep=$2
  local prf=$3
  local out=
  for a in $1; do
    out+="${prf}${a}${sep}"
  done
  echo "${out}"
}

# usage: patch_fromremote <base_url> patch1,...,...
patch_fromremote(){
  local baseUrl=$1; shift
  while [ -n "$1" ]; do
    wget -qO- ${baseUrl}/$1 | patch
    shift
  done
}

# usage: wget_source <src-url> <dst-dir>
wget_source(){
    local fn=$(basename $1) || doErr "Invalid source url '$1'"
    [ -z "$2" ] && local dn=$(pwd) || local dn=$2
    case $fn in
      *.zip);;
      *.tar.lz|*.tlz) args="--lzip -xv";;
      *.tar.gz|*.tgz) args="-xvz";;
      *.tar.xz|*.txz) args="-xvJ";;
    esac
}

# usage: wget_pkg_termux <lib-name> <aarch64|arm|i686|x86_64> <dst-dir>
wget_pkg_termux(){
  [ -z "$1" ] || [ -z "$2" ] || [ ! -d "$3" ] && return 1
  echo -ne "searching for ${1}"
  local rname=$(wget -qO- http://termux.net/dists/stable/main/binary-${2}/ | grep -o ${1}_.*\.${2}\.deb\" | tail -n1)
  [ -z "${rname}" ] && echo -e " ${CR0}not found: aborting" && return 1
  rname=${rname:0:-1}
  echo -ne "${CY0}:found $rname"
  local od=$(pwd); cd ${3}
  [ -d "tmp" ] && rm -rf tmp
  mkdir -p tmp && cd tmp
  local url="http://termux.net/dists/stable/main/binary-${2}/${rname}"
  echo -ne " >download"
  wget -q $url
  [ ! -f "$rname" ] && echo -e "${CR1}:fail to download $url\n${C0}" && return 1
  echo -ne " >extract"
  ar -x $rname && tar -x -f data.tar.xz
  echo -ne " >fix paths"
  sed -i "s;/data/data/com.termux/files/usr;${3};g" data/data/com.termux/files/usr/lib/pkgconfig/*.pc 2>/dev/null
  cp -rf data/data/com.termux/files/usr/* ..
  cd .. && rm -rf tmp
  echo -e "${CG1} :done${C0}"
  cd $od
  return 0
}

#usage wget_pkg_debian [--list] <pkg-name> <filename-prefix> <arm64|armhf|armel|i386|amd64> dst-dir
wget_pkg_debian(){
  local lst=false
  local p_arch
  [ "$1" == "--list" ] && lst=true && shift
  case $3 in
    aarch64*) p_arch="arm64";;
    arm*hf)   p_arch="armhf";;
    arm*eabi) p_arch="armel";;
    i686*)    p_arch="i386";;
    x86_64*)  p_arch="amd64";;
    *) echo -e "${CR0} unknown $3${C0}"; return 1;;
  esac
  [ "${1::3}" == "lib" ] && local ldir=${1::4} || local ldir=${1::1}
  local url="http://ftp.debian.org/debian/pool/main/${ldir}/${1}/"
  echo $url
  if $lst; then
    local uris=$(curl -l ${url} 2>/dev/null | grep -o \>${2}_.*_${p_arch}.deb)
    for u in $uris; do
      echo ${url}${u:1}
    done
  else
    local od=$(pwd)
    if [ ! -d "$4" ];then
      mkdir -p $4 || return 1
    fi
    cd $4
    [ -d "tmp" ] && rm -rf tmp
    mkdir -p tmp && cd tmp
    local u=$(curl -l $url 2>/dev/null | grep -o \>${2}_.*_${p_arch}.deb | tail -n1)
    url="${url}${u:1}"
    echo $url
    wget -q $url
    ar -x $(basename ${url}) && tar -x -f data.tar.xz
    mv usr/lib/${3}/* usr/lib && rm -rf usr/lib/${3}
    sed -i "s|lib/${3}|lib|g;s|/usr|${4}|g" usr/lib/pkgconfig/*.pc 2>/dev/null
    cp -rf usr/* ..
    cd .. && rm -rf tmp
    echo -e "${CG1} :done${C0}"
    cd $od
  fi
}

libname_2_packagename(){
  if [ -n $(command -v apt) ]; then
    pkglist=$(apt-cache search --names-only ${lib})
  fi
}

list_pkgs(){
  local pd="${dir_root}/builds"
  case $1 in
    *-android*) wget -q "https://sourceforge.net/projects/packages-${1}/rss?path=/" -O - | grep -Po '<title><!\[CDATA\[.*</title>' | grep -Po '/.*tar.gz' | sed 's|/||'> ${pd}/$1_pkglist.txt;;
    *) return 1;;
  esac
}

get_link_pkg(){
  local pd="${dir_root}/builds"
  #[ -f "${pd}/${arch}_pkglist.txt" ] || list_pkgs ${arch}
  #local fn=$(cat "${pd}/${arch}_pkglist.txt" | grep "${lib}.*${arch}.tar.gz" | tail -n1)
  [ -z "${fn}" ] && [ -n "${dev_vrs}" ] && fn="${lib}_${dev_vrs}_${arch}.tar.gz"
  [ -n "${fn}" ] && echo "https://sourceforge.net/projects/packages-${arch}/files/${fn}"
  return 0
}

version_parse(){
  local IFS='.|-|_'
  export arrv=()
  for f in $1; do
    if [ ${#arrv[@]} -lt 3 ]; then
      f=$(echo $f | grep -o '[0-9]*')
    fi
    if [ -n "$f" ]; then
      arrv+=($f)
    fi
  done
  echo "${arrv[@]:0:3}" | sed 's/ /./g'
}

git_version_local(){
  if [ -d "${1}/.git" ]; then
    version_parse "$(git --git-dir="${1}/.git" describe --match=?[0-9]* 2>/dev/null || git --git-dir="${1}.git" describe 2>/dev/null)"
  fi
  return 0
}

git_version_remote(){
  version_parse "$(git_vremote $1)"
}

vrs_exclude='alpha|beta'
git_vremote(){
  local lgit=$(git ls-remote $src)
  local v=$(echo "${lgit}" | grep -oP '\d+\.\d+\.\d+.*' | grep -vP $vrs_exclude | tail -n1)
  [ -z "${v}" ] && v=$(echo "${lgit}" | grep -oP '\d+\.\d+.*' | grep -vP $vrs_exclude | tail -n1)
  if [ -n "${v}" ]; then
    echo "${v}"
  fi
  return 0
  awk -v vv="${lgit}" ss="${src}" -f - << 'EOF'
BEGIN {
  FS = "[ /^]+"
  while ("echo " vv "| sort -Vk2" | getline) {
    if (!sha)
      sha = substr($0, 1, 7)
    tag = $3
  }
  while ("curl -s " ss "/releases/tag/" tag | getline)
    if ($3 ~ "commits")
      com = $2
  printf com ? "%s-%s-g%s\n" : "%s\n", tag, com, sha
}
EOF
}

get_patch(){
  local match=$(grep -oP "(?<=^<<').*?(?=')" $1)
  local out
  if [ -n "${match}" ]; then
    out=${match}
    local block=$(awk '/^<<.'"$match"'./{flag=1; next} /^'"$match"'/{flag=0} flag' $1)
    out+="\n${block}"
  fi
  echo ${out}
}

test_c0(){
  #set -x
  local wdir="${dir_src}/${1}"
  if [ -d "${wdir}" ]; then
    local od="$(pwd)"
    cd $wdir
    echo -e "${2}" > testfile.c
    [ -n "$(command -v clang)" ] && cc=clang || cc=gcc
    $cc -c testfile.c && $cc -o testfile testfile.o && rm *.o
    ./testfile
    cd $od
  fi
  #set +x
  return 0
}

c_printf(){
  #set -x
  local wdir="${dir_src}/${1}"
  if [ -d "${wdir}" ]; then
    local od="$(pwd)"
    cd $wdir
    local hfile=$2
    local printf_expr=$3
    local cc
    if [ ! -f "testfile" ]; then
      cat <<-testfile >>testfile.c
				#include <stdio.h>
				#include "${hfile}"
				int main(){
				  printf(${printf_expr});
				}
				testfile
      [ -n "$(command -v clang)" ] && cc=clang || cc=gcc
      $cc -c testfile.c && $cc -o testfile testfile.o && rm *.o
    fi
    ./testfile
    cd $od
  fi
  #set +x
  return 0
}

# .language
# .homepage
# .size
# .licence.key
# .licence.name
# .licence.spdx_id

# end .common

apt_install(){
	while [ "$1" != "" ];do
		#echo -ne "  ${CT0}install $1${C0}"
		#echo -n " "
		stty size | {
		read y x
		echo -ne "${CY1}"
		tput sc
		tput cup "$((y - 1))" 0
		$sudo apt -qq install $1 -y >/dev/null 2>&1
		echo -ne "${C0}"
		tput rc
		}
		#echo -ne "${C0} ok"
		shift
	done
}

# unused
aptInstallBr(){
  while [ -n "$1" ];do
    echo -ne "${CD}${ind}${CT0}install $1${C0} "
    $sudo apt -qq install $1 -y >/dev/null 2>&1
    echo -e "${C0}ok ${CT1}done${C0} $(apt-cache show $1 | grep Version)"
    shift
  done
}

config_guess(){
  if [ -f "${dir_config}/meson.build" ]; then
    build_system="meson"
    cfg="meson"
  elif [ -f "${dir_config}/CMakeLists.txt" ]; then
    build_system="cmake"
    cfg="cmake"
  elif [ -n "$(ls ${dir_config}/configure.* 2>/dev/null)" ]; then
    build_system="automake"
    cfg='ac'
    if [ -f "${dir_config}/autogen.sh" ]; then
      cfg_cmd="${dir_config}/autogen.sh"
    elif [ -f "${dir_config}/bootstrap.sh" ]; then
      cfg_cmd="${dir_config}/bootstrap.sh"
    elif [ -f "${dir_config}/bootstrap" ]; then
      cfg_cmd="${dir_config}/bootstrap"
    elif [ ! -f "${dir_config}/configure" ]; then
      cfg_cmd="autoreconf -fiv ${dir_config}/bootstrap"
    else
      return 1
    fi
  else
    return 1
  fi
  return 0
}

# usage create_pkgconfig_file <pkg>.pc [llibds][INSTALL_DIR]
create_pkgconfig_file(){
	[ -z "${1}" ] && pc_file=${lib} || pc_file=${1}
	[ -z "${2}" ] && pc_llib="-l${pc_file}" || pc_llib=${2}
	[ -z "${3}" ] && pc_prefix=${dir_install} || pc_prefix=${3}
	[ "${pc_llib}" == "null" ] && pc_llib=''
	[ -z "$pc_libdir" ] && pc_libdir="/lib"
	[ -z "$pc_incdir" ] && pc_incdir="/include"
	[ -z "$pc_cflags" ] && pc_cflags="-I\${includedir}"
	[ -z "$pc_libs" ] && pc_libs="-L\${libdir}"
	[ -z "$pc_url" ] && pc_url=$(dirname $src)
	fn_defined 'get_version' && get_version && pc_vrs=$vrs
	[ -z "$pc_vrs" ] && {
	[ -d "${dir_src}/.git" ] && pc_vrs=$(git_getversion ${dir_src}) || pc_vrs=$vrs
	}
	cat <<-EOF >${dir_install_pc}/${pc_file}.pc
		prefix=${pc_prefix}
		exec_prefix=\${prefix}
		libdir=\${exec_prefix}${pc_libdir}
		includedir=\${prefix}${pc_incdir}

		Name: ${lib}
		Description: ${dsc}
		URL: ${pc_url}
		Version: ${pc_vrs}
		Requires: ${pc_requires}
		Requires.private: ${pc_requiresprivate}
		Libs: ${pc_libs} ${pc_llib}
		Libs.private: ${pc_libsprivate}
		Cflags: ${pc_cflags}

		EOF
	pc_filelist="${pc_file}.pc ${pc_filelist}"
	unset pc_libdir pc_incdir pc_cflags pc_libs pc_url
}

build_packages_getdistdir(){
	[ -f "${dir_install_pc}/${pkg}.pc" ] && vrs=$(pkg-config ${dir_install_pc}/${pkg}.pc --modversion)
	[ -z "$vrs" ] && set_git_version
	echo "${dir_root}/packages/${lib}_${vrs}_${arch}"
}

build_packages_filelist(){
	local scfile="${dir_root}/${lib}.sh"
	if [ -z "$(cat $scfile | grep '# Filelist')" ]; then
		echo -e "\n\n# Filelist\n# --------" >> $scfile
		find ./ -type f | sed 's|^./|# |g' >> $scfile
	fi
}


build_packages_bin(){
	set -x
	local xb_distdir=$(build_packages_getdistdir)
	if fn_defined 'create_package'; then
		fn_log 'pack' create_package ${xb_distdir}
	else
		if fn_defined 'build_make_package'; then
			fn_log 'pack' build_make_package ${xb_distdir}
		elif [ "$MAKE_EXECUTABLE" = "ninja" ];then
			DESTDIR=${xb_distdir} ninja -C ${dir_build} install
		else
			[ -z "$mkd" ] && mkd="DESTDIR=${xb_distdir} install"
			${MAKE_EXECUTABLE} $mkd
			fi
			[ -z "$mkd_suffix" ] && mkd_suffix=${dir_install}
			pushdir "${xb_distdir}${mkd_suffix}"

			# dont forget licence files
			if [ -n "${lst_lic}" ]; then
			[ -d "share/doc/${lib}" ] || mkdir -p "share/doc/${lib}"
			for f in ${lst_lic}; do
				[ -f "share/doc/${lib}/$f" ] || cp ${dir_src}/${f} "share/doc/${lib}/"
			done
		fi
		
		# also include .pc manually-built file
		if fn_defined 'build_pkgconfig_file' || [ -n "$pc_llib" ]; then
			local xb_pkgd=$(pwd)/lib/pkgconfig
			[ ! -d "${xb_pkgd}" ] && mkdir -p $xb_pkgd
			if [ -n "${pc_filelist}" ]; then
				for pp in ${pc_filelist}; do
					cp ${dir_install_pc}/${pp} ${xb_pkgd}/
				done
			else
				cp ${dir_install_pc}/${pkg}.pc ${xb_pkgd}/
			fi
			fn_undef build_pkgconfig_file
		fi

		if fn_defined 'on_editpack'; then
			fn_log 'edit' on_editpack
		fi

		build_packages_filelist
		case $pkg_fmt in
			tgz) tar -czvf "${xb_distdir}.tar.gz" *;;
			tbz) tar -cvjSf "${xb_distdir}.tar.bz2" *;;
			zip) zip -r "${xb_distdir}.zip" *;;
		esac
		rm -rf ${xb_distdir}
		popdir
	fi
	set +x
}

#usage xbuild --new <github_url>
generate_script(){
	#set -x
	test -z "$1" && return 0
	local giturl=$1
	local srcname=${giturl/\.git/}
	local libname="${srcname##*/}"
	libname="${libname,,}"
	case ${libname} in *.git) libname=${libname/\.git/};; esac
	local scriptname="${dir_root}/${libname}.sh"
	cp "${dir_root}/utils/script.template" ${scriptname}
	chmod +x "${scriptname}"
	sed -i 's,@src@,'${giturl}',g;s,@lib@,'${libname}',g' ${scriptname}
	case $giturl in
		*github*)
			local json=$(github_json $srcname)
			local libdesc=$(cat ${json} | jq .description | xargs)
			local lic=$(cat ${json} | jq .license.name | xargs)
			test -n "${libdesc}" && libdesc=${libdesc%%\. *} && sed -i 's/@desc@/'"${libdesc}"'/g' ${scriptname}
			test -n "${lic}" && sed -i 's/@lic@/'"${lic}"'/g' ${scriptname};;
	esac
	#set +x
}

# usage github_latest_release <user/repo>
github_latest_release(){
	echo $(curl --silent "https://api.github.com/repos/$1/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
}

github_latest_tgz(){
	echo "https://github.com/intel/libvpl/archive/refs/tags/v2.10.1.tar.gz://github.com/intel/libvpl.git"

}

github_repo_id(){
	local paths=( ${1//\// } )
	paths[3]=${paths[3]/\.git/}
	echo "${paths[2]}/${paths[3]}"
}

github_json(){
	local paths=( ${1//\// } )
	local url=
	case ${paths[1]} in 
		github.com) url="https://api.github.com/repos/${paths[2]}/${paths[3]}";;
		*) echo;;
	esac
	local json=${dir_root}/builds/${libname}.info
	wget -q $url -O ${json}
	echo ${json}
}

github_description(){
	local paths=( ${1//\// } )
	local url=
	case ${paths[1]} in 
		github.com) url="https://api.github.com/repos/${paths[2]}/${paths[3]}";;
		*) return 0
	esac
	local json=${dir_root}/builds/${libname}.info
	test -f ${json} || wget -q $url -O ${json}
	 echo $(cat ${json} | jq .description | xargs)
}

package_showinfo(){
	$banner || return 0
	local dp=
	local vs=
	local longdesc=$(package_longdesc)
	[ -z "$(echo $longdesc | xargs 2>/dev/null)" ] && unset longdesc

	# Main Description
	[ -n "${dsc}" ] && echo -e "\n${CD}${inds}${CW}\e[1m${lib^^} - ${C0}${dsc}\e[0m"
	[ -n "${longdesc}" ] && echo -e "${CD}${longdesc}" | sed 's|\*|\u2605|g; s|\..\..|. |g' # sed 's|^|'${ind}|g'

	# see links
	echo -e "${CD}${ind}${CD}"
	echo -e "${CD}${ind}${CD}see log   : \e[4m${log_file}\e[24m${C0}"
	echo -e "${CD}${ind}${CD}    script: \e[4m${0}\e[24m${C0}"
	echo -e "${CD}${ind}${CD}    source: \e[4m${dir_src}\e[24m${C0}"
	echo -e "${CD}${ind}${CD}    build : \e[4m${root_dir}/builds/${arch}\e[24m${C0}"
	echo -e "${CD}${ind}${CD}"

	# Licence
	echo -ne "${CD}${ind}${CT0}Licence ${C0}$lic "

	# Build Tools
	if [ -n "${tls}" ]; then
		echo -ne "${CT0}build deps: "
		tput sc; echo -ne "${CD}$tls "; tput rc
		for t in ${tls}; do
		if [ -z $(command -v ${t}) ];then
			apt_install ${t} || {
			echo -ne "${CR1}${t} ${C0}" && doErr "Unable to install ${t}, aborting..."
			}
			echo -ne "${CW}${t} "
		fi
		shift
		done
	fi

	# Build Deps
	[ -n "${dep}" ] && dp="${dp}${CT0}lib deps: ${C0}$dep"

	if str_contains $src "git"; then
		local vgit=$(git_version_remote $src | head -n1)
		if [ -d ${dir_src} ];then
		local vrep=$(git_version_local ${dir_src} | head -n1)
		vs="${CT0}vrs: ${C0}$vrep "
		if str_contains $vgit $vrs; then
			vs+=" updated"
		else
			vs+=" ${CT0}latest: ${CT1}${vgit}${C0}"
		fi
		else
		vs="${CT0}vrs: ${C0}${vgit}"
		fi
	fi
	echo -e " ${vs} ${C0}"
	return 0
}

package_longdesc(){
	if [ -n "${apt}" ]; then
		echo -e $(apt-cache show ${apt} 2>/dev/null | \
		grep -E "Description-..^|^ " | \
		sed $'s/\*/\u2605/g' | \
		sed '/^ *This package contains.*\./d') | fold -s -w120 | sed 's/^/'"${ind}"'/g'
	fi
	return 0
}


clearAll(){
	if [ -z "$lib" ];then
		read -p 'Clear all data? (Builds, Sources and Logs) [Y|n] ' ca
		case $ca in Y|y) rm -rf builds sources && clear;;esac
	else
		rm -rf sources/$lib
		[ -n "$arch" ] && rm -rf builds/$arch/$lib builds/$arch/$lib.log
	fi
}

checkPkg(){
	local pf="${dir_install_pc}/${pkg}.pc"
	[ -f "$pf" ] && echo $pf
	return 0
}

list_tarball(){
	local lf=$(ls -1 ${dir_pkgdist}/${lib}*${arch}.tar.gz 2>/dev/null | tail -n1)
	if [ -z "${lf}" ] || [ ! -f "${lf}" ]; then
		return 1
	fi
	tar -ztvf ${lf} | grep -e "[^/]$"
	return 0
}

# USAGE: create_patch [b64] <rel_path_oldfile> [<rel_path_newfile>]
create_patch(){  
	local od=$(pwd); cd ${dir_src} || return 1
	local b64=false
	[ "${1}" == "b64" ] && b64=true && shift
	case $# in
		0) return 1;;
		1) touch "${1}_"
		   $b64 && diff -Naur "${1}_" "${1}" >"${1}.patch" || diff -Naur "${1}_" "${1}" | base64 -w 72 >"${1}.patch"
		   ;;
		*) $b64 && diff -Naur "${1}" "${2}" >"${2}.patch" || diff -Naur "${1}" "${2}" | base64 -w 72 >"${2}.patch"
		   ;;
	esac
	cd $od
}

hwinfoCountCores(){
	echo $(nproc)
	# or cat /proc/cpuinfo | grep -Po -c 'model name\s+: \K(.*)'
}

hwinfoCountCoresReadable(){
	case $(nproc) in
		"1") echo "Single-Core";;
		"2") echo "Dual-Core";;
		"4") echo "Quad-Core";;
		"6") echo "Hexa-Core";;
		"8") echo "Octa-Core";;
		*) echo "$n-Core";;
	esac
}

hwinfoProcessor(){
	cat /proc/cpuinfo | grep -Po 'model name\s+: \K(.*)' | head -n1
}

prompt_remove(){
	while [ -n "${1}" ]; do
		echo -ne "\n  Are you sure you want do remove ${CY1}$(basename $1)?${C0} Type 'Yes' to proceed: "; read q
		if [ "${q}" == "Yes" ]; then
		echo -ne "  > Removing $1... " && rm -rf $1 2>/dev/null && echo -e " ${CG1}done${C0}" || echo -e "${CR1} Fail${C0}"
		else
		break
		fi
		shift
	done
	echo
}


patch_check_patchdir(){
  test $patch_skip && return 0
  local patch_list=( $(ls -1 ${dir_patches}/${lib}*.patch 2>/dev/null) )
  if [ -n "${patch_list[@]}" ]; then
    pushd ${dir_src} 2>&1 >/dev/null
    for p in ${patch_list[@]}; do
      patch -p0 <${p} 2>&1 >${log_file}
    done
    popd 2>&1 >/dev/null
  fi
  return 0
}

patch_check_xbpatch(){
	pushdir ${dir_root}
	local matches=( $(grep -oP "(?<=^<<').*?(?=')" $0) )
	if [ ${#matches[@]} -gt 0 ]; then
		for match in ${matches[@]}; do
			echo -ne "${CC2}${match} ${C0}"
			local block=$(awk '/^<<.'${match}'./{flag=1; next} /^'{$match}'/{flag=0} flag' $0)
			case $match in
				XB_CREATE_CMAKELISTS|CMakeLists.txt)
					echo "${block}" >${dir_src}/CMakeLists.txt
					echo -e "\ncreate CMakeLists.txt: \n$block" >>${log_file}
					;;
				XB_PATCH) pushdir ${dir_src}
					patch -p0 <<<$(echo "${block}") 2>&1 >${log_file}
					echo -e "\npatch found: \n$block" >>${log_file}
					popdir
					;;
				XB64_PATCH) pushdir ${dir_src}
					patch -p0 <<<$(echo "${block}" | base64 -d) 2>&1 >${log_file}
					popdir
					;;
				LZS_PATCH) pushdir ${dir_src}
					patch -p0 <<<$(echo "${block}" | ${dir_root}/utils/lz-string -d -) 2>&1 >${log_file}
					popdir
					;;
				*) echo -e "\nUnknown block name ${match} with this contents (ignoring):\n$block" >>${log_file}
					;;
			esac
		done
	fi
	popdir
	return 0
}

# usage libname.sh --patch a [sources/libname/]path/to/newfile [sources/libname/]path/to/oldfile
patch_append(){
	local newfile=${1}
	local oldfile
	str_starts "${newfile}" "sources/${lib}/" && newfile="${newfile//sources\/${lib}\//}"
	[ -f "sources/${lib}/${newfile}" ] || doErr "unable to find file sources/${lib}/${newfile}"
	shift
	cd sources/${lib}
	if [ -z "${1}" ]; then
		oldfile="${newfile::-3}old"
		touch sources/${lib}/${oldfile}
	else
		oldfile=${1}
		str_starts "${oldfile}" "sources/${lib}/" && newfile="${oldfile//sources\/${lib}\//}"
		[ -f "${oldfile}" ] || doErr "unable to find file sources/${lib}/${oldfile}"
	fi
	diff -Naur ${oldfile} ${newfile} | sed "s|${oldfile}|${newfile}|" >>${dir_root}/sources/${lib}/xbuild.patch
	cd ../..
	echo -e "\n  ${CC1}Patch file updated at:${C0} $(pwd)/sources/${lib}/xbuild.patch\n\n"
}

patch_embed(){
	if [ ! -f "sources/${lib}/xbuild.patch" ]; then
		doErr "No sources/${lib}/xbuild.patch file to embed"
	fi
	hdr="STR_PATCH"
	case $1 in
		xb64|XB64) echo -e "\n<<'XB64_PATCH'" >>${0}
				cat "sources/${lib}/xbuild.patch" | base64 -w 90 >>${0}
				echo -e "XB64_PATCH" >>${0}
				;;
		lzs|LZS)   echo -e "\n<<'LZS_PATCH'" >>${0}
				cat "sources/${lib}/xbuild.patch" | utils/lz-string -c -w 90 - >>${0}
				echo -e "LZS_PATCH" >>${0}
				;;
	esac
}

patch_get(){
	matches=( $(grep -oP "(?<=^<<').*?(?=')" $0) )
	if [ ${#matches[@]} -gt 0 ]; then
		for match in ${matches[@]}; do
			block=$(awk '/^<<.'"$match"'./{flag=1; next} /^'"$match"'/{flag=0} flag' $0)
			case $match in
				XB64_PATCH) echo "${block}" | base64 -d;;
				LZS_PATCH)  echo "${block}" | utils/lz-string -d -;;
			esac
		done
	fi
	return 0;
}

create_diff(){
	local b64=false
	local newfile=${1}
	local oldfile
	[ -f "sources/${lib}/${newfile}" ] || doErr "unable to find file sources/${lib}/${newfile}"
	shift
	pushdir sources/${lib}
	if [ -z "${1}" ]; then
		oldfile="${newfile::-3}old"
		touch sources/${lib}/${oldfile}
	else
		oldfile=${1}
		[ -f "${oldfile}" ] || doErr "unable to find file sources/${lib}/${oldfile}"
	fi
	if $b64; then
		diff -Naur ${oldfile} ${newfile} | sed "s|${oldfile}|${newfile}|" | base64 -w 90 >>"${newfile}.patch"
	else
		diff -Naur ${oldfile} ${newfile} | sed "s|${oldfile}|${newfile}|" >"${newfile}.patch"
	fi
	echo -e "\n  ${CC1}Done${C0}\n"
	read -p "Open file? y|n: " yn
	case $yn in y|Y) nano "${newfile}.patch";; esac
	popdir
}

request_cmd(){
	local c1=$1
	local c2=$2
	test -z "${c2}" && c2=${c1}
	test -z $(command -v ${c1}) && apt_install ${c2}
	return 0
}


set_break(){
    case $1 in
        git)    break_on_git=true;;
        patch)  break_on_patch=true;;
        config) break_on_config=true;;
        build)  break_on_build=true;;
        make)   break_on_make=true;;
    esac
    return 0
}

menu_tune(){
	case $1 in
		smd855)   CPPFLAGS+=" -mtune=cortex-a76.cortex-a55";;
		smd865)   CPPFLAGS+=" -mtune=cortex-a77.cortex-a55";;
		smd888)   CPPFLAGS+=" -mtune=cortex-a78.cortex-a55";;
		cortex-*) CPPFLAGS+=" -mtune=$1";;
	esac
}

menu_clear(){
	while [ -n "$1" ];do
		case $1 in
			source|srclib)   prompt_remove ${dir_src};;
			allsources|sources)  prompt_remove ${dir_sources};;
			builds)   prompt_remove ${dir_install};;
			packages) prompt_remove ${dir_pkgdist};;
			wipe*)    prompt_remove ${dir_pkgdist} ${dir_install} ${dir_sources};;
		esac
		shift
	done
	return 0
}

prt_hmenu(){
	echo -e "\n${1}\n"
	shift
	local a
	local b
	while [ -n "$1" ]; do
		a="$1"; shift
		b="$1"; shift
		printf "  ${CC0}%-20s: ${C0}%s\n" "$a" "$b"
	done
	echo
}

menu_get(){
	local pkgfile="${dir_install_pc}/${pkg}.pc"
	[ -f "${pkgfile}" ] && local has_pc=true
	case $1 in
		help)		prt_hmenu "${CW}usage: $0 --get ${CC0}<opt>" \
					'cflags' 'get pkg-config --cflags' 'ldflags' 'get pkg-config --libs' 'ldstatic' 'get pkg-config --libs --static' \
					'pc-ver' 'get package version' 'pc-path|pc' 'get pkg-config file path' 'pc-name' 'get pkg-config file name without .pc' \
					'prefix' 'get prefix / install dir' 'libname' 'get the libname' 'aptname' 'get the debian package name' 'var <variable>' \
					'get <variable> value' 'vrs_remote' 'get git remote latest version' 'vrs_tag' 'get git remote latest tag' 'vrs_tags' \
					'get git remote tag list' 'vrs_local' 'get git local version' 'options|opts' 'show build options' 'log' 'edit (nano) log file' \
					'patch' 'show decoded patch included in the script'
					;;
		cflags)     [ -f "${pkgfile}" ] && echo "$(pkg-config ${pkgfile} --cflags)";;
		ldflags)    [ -f "${pkgfile}" ] && echo "$(pkg-config ${pkgfile} --libs)";;
		ldstatic)   [ -f "${pkgfile}" ] && echo "$(pkg-config ${pkgfile} --libs --static)";;
		pc-ver)     [ -f "${pkgfile}" ] && echo "$(pkg-config ${pkgfile} --modversion)";;
		pc-path|pc) echo "${pkgfile}";;
		pc-name)    echo "${pkg}";;
		prefix)     echo "${dir_install}";;
		libname)    echo "${lib}";;
		aptname)    echo "${apt}";;
		var)        shift; echo "${!1}";;
		vrs_latest) echo $(github_latest_tgz); exit 0;;
		vrs_remote) fn_defined 'vremote' && version_parse "$(vremote)" || git_version_remote $src;;
		vrs_taglist)git ls-remote --tags --refs --sort="v:refname" $src | tail -n1 | sed 's/.*\///';;
		vrs_tags)   git ls-remote --tags --sort="v:refname" $src | grep -oP 'tags/.*\d+\.\d+\.\d+.*';;
		vrs_local)  git_version_local $dir_src;;
		opt*)       showOpts "$(pwd)/sources/$lib"; exit 0;;
		log)        [ -f "${dir_install}/${lib}.log" ] && nano ${dir_install}/${lib}.log;;
		patch)      patch_get; exit 0;;
		vrs_git)    git ls-remote $src | grep 'refs/tags/' | sed 's/^.*refs\/tags\///g' | tail -n1;;
		vrs_git_n)  git ls-remote $src | grep 'refs/tags/' | sed 's/^.*refs\/tags\///g' | tail -n1 | sed 's/[a-zA-Z\-\^\{\}]//g';;
	esac
}

menu_git(){
	local b=false
	[ -z "${lib}" ] && return 0
	[ -z "${src}" ] && return 0
	case $1 in
		help)       prt_hmenu "${CW}usage: $0 --git ${CC0}<opt>" \
					'tar*' 'list current tarball contents' 'branches' 'list all local git available branches' \
					'tags' 'list all local git available branches' \
					'env' 'list toolchain environment variables' 'deps' 'list packages that depend on '${lib}''
					;;
		clone)      str_contains $src 'git' || return 0
					[ -d "sources/${lib}" ] && rm -rf sources/${lib}
					git clone $src sources/${lib}
					;;
	esac
	return 0
}


menu_list(){
	local b=false
	[ -n "${arch}" ] && [ -n "${lib}" ] && b=true
	case $1 in
		help)       prt_hmenu "${CW}usage: $0 --list ${CC0}<opt>" \
					'tar*' 'list current tarball contents' 'branches' 'list all local git available branches' \
					'tags' 'list all local git available branches' \
					'env' 'list toolchain environment variables' 'deps' 'list packages that depend on '${lib}''
					;;
		tar*)       $b && list_tarball;;
		branches)   [ -d "${dir_src}/.git" ] && git --git-dir="${dir_src}/.git" branch -a;;
		opt*)       showOpts "$(pwd)/sources/$lib"; exit 0;;
		tags)       [ -d "${dir_src}/.git" ] && git --git-dir="${dir_src}/.git" tag --list;;
		env)        $b && loadToolchain && print_vars CC CXX LD AS AR NM RANLIB STRIP ADDR2LINE OBJCOPY OBJDUMP READELF SIZE STRINGS WINDRES GCOV;;
		deps)       for f in ${dir_root}/*.sh; do
					[ -n "$(cat $f | grep -oP 'dep=.*'${lib}'.*')" ] && echo $(basename $f) | sed 's|\.sh||'
					done
					;;
	esac
	return 0
}

menu_goto(){
	case $1 in
		src|source) pushd ${dir_src};;
		bin)        pushd ${dir_install_bin};;
		lib)        pushd ${dir_install_lib};;
		include)    pushd ${dir_install_include};;
		pkgconfig)  pushd ${dir_install_pc};;
		*)          exit 0;;
	esac
#bash
}

utils_get_latest_release(){
	if fn_defined 'latest_release'; then
		echo $(latest_release)
	elif [ -z "${src}" ]; then
		echo "Unknown source ${src}"
	else
		local paths=( ${src//\// } )
		paths[3]=${paths[3]/\.git/}
		case ${paths[1]} in
			github.com) github_latest_release "${paths[2]}/${paths[3]}"
				;;
			*) echo $(git ls-remote --tags --sort "v:refname" $src | tail -n1 | rev | awk -v FS='/' '{print $1}' | rev)
				;;
		esac
	fi
}


# unused

ndk_assert_h_sys_soundcard(){
	[ "$host_os" == "android" ] && \
		[ ! -f "$SYSROOT/usr/include/sys/soundcard.h" ] && \
		echo "#include <linux/soundcard.h>" >"$SYSROOT/usr/include/sys/soundcard.h" 
	return 0
}
set_ndk_api(){
	API=${1}
	loadToolchain
}
downloadP(){
	tput sc && echo -ne "\e[$(tput lines);0H${CY1}"
	# wget --progress=dot $url 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
	wget --progress=dot $1 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\r%4s %s eta:%s  ",$2,$1,$4)}'
	tput rc
	echo "${C0} ok "
}
checkUrl(){
	wget -S --spider $1 2>&1 | grep -q "HTTP/1.[0-9] 200 OK" && echo SUCCESS || echo FAIL
}
checkCmd(){
	[ -z "$(command -v $1)"] $sudo apt -qq install $1 -y >/dev/null 2>&1
}
err_call(){
	echo -e "$(
		cat <<-EOM
			\n${CW}tcutils $vrs
			${C0}Cannot be called directly. Missing vars lib arch or src
			\n
			EOM
	)"
	exit 1  
}
prtPrc(){
	local v=$(grep "%")
}
cmakeClean(){
	pushdir $1
	rm -rf CMakeFiles CMakeCache.txt
	popdir
}
makeClean(){
	pushdir $1
	make clean
	popdir
}
setCMake(){
	printf "SET($2 $3)\n\n" >> $1
}

# .cmake

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

cmake_test_1=false

cmake_build_toolchainfile(){
	export cmake_toolchain_file="${dir_build}/${arch}.cmake"
	cat <<-EOF >${cmake_toolchain_file}
		set(CMAKE_SYSTEM_NAME "${PLATFORM}")
		set(CMAKE_SYSTEM_PROCESSOR "${cmake_system_processor}")
		set(CMAKE_C_COMPILER ${CC})
		set(CMAKE_CXX_COMPILER ${CXX})
		set(CMAKE_ASM_NASM_COMPILER ${YASM})
		EOF
	$cmake_test_1 && cat <<-EOF >>${cmake_toolchain_file}
		set(CMAKE_AR ${AR} CACHE FILEPATH Archiver)
		set(CMAKE_RANLIB ${RANLIB} CACHE FILEPATH Indexer)
		set(CMAKE_C_COMPILER_AR "${AR}")
		set(CMAKE_CXX_COMPILER_AR "${AR}")
		set(CMAKE_C_COMPILER_RANLIB "${RANLIB}")
		set(CMAKE_CXX_COMPILER_RANLIB "${RANLIB}")
		set(CMAKE_ASM_NASM_COMPILER "${ASM_NASM}")
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
	test -n "${cmake_add_compile_options}" && echo "add_compile_options("${cmake_add_compile_options}")" >>${cmake_toolchain_file}
	test -n "${cmake_cxx_flags_release}" && echo "set(CMAKE_CXX_FLAGS_RELEASE \""${cmake_cxx_flags_release[@]}"\" CACHE STRING \"\" FORCE)" >>${cmake_toolchain_file}
	test -n "${cmake_c_flags_release}" && echo "set(CMAKE_C_FLAGS_RELEASE \""${cmake_c_flags_release[@]}"\" CACHE STRING \"\" FORCE)" >>${cmake_toolchain_file}
	test -n "${cmake_include_directories}" && echo "cmake_include_directories("${cmake_include_directories[@]}")" >>${cmake_toolchain_file}
	test -n "${WFLAGS}" && echo "add_definitions(\"${WFLAGS}\")" >>${cmake_toolchain_file}
	
}

cmake_shouldreplace_cmakelists(){
	test ! "x${cfg}" == "xcmake" && return 0
	test -f "${dir_config}/CMakeLists.txt" && test -z "${cmake_cmakelists}" && return 0
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
	elif [ -n "${cmake_cmakelists}" ]; then
		cp ${dir_root}/cmake/${cmake_cmakelists} ${dir_src}/CMakeLists.txt
	fi
	return 0
}

cmake_configure(){
	: "${cfg_cmd:=${CMAKE_EXECUTABLE}}"
	[ -z "${cmake_toolchain_file}" ] && cmake_create_toolchain ${dir_build}
	[ -f "${cmake_toolchain_file}" ] && CTC="-DCMAKE_TOOLCHAIN_FILE=${cmake_toolchain_file}"

	if [ -n "${cmake_static}" ]; then
		arr=(${cmake_static//|/ })
		case ${#arr[@]} in
			1) $build_static && CSH="-D${arr[0]}=ON" || CSH="-D${arr[0]}=OFF";;
			2) $build_static && CSH="-D${arr[0]}" || CSH="-D${arr[1]}";;
		esac
	fi

	#if [ -z "${cmake_shared}" ]; then
	#	$build_shared && CSH+=' -DBUILD_SHARED_LIBS=ON' || CSH+=' -DBUILD_SHARED_LIBS=OFF'
	#else
  if [ -n "${cmake_shared}" ]; then
		arr=(${cmake_shared//|/ })
		case ${#arr[@]} in
			1) $build_shared && CSH+=" -D${arr[0]}=ON" || CSH+=" -D${arr[0]}=OFF";;
			2) $build_shared && CSH+=" -D${arr[1]}" || CSH+=" -D${arr[0]}";;
		esac
	fi

	if [ -n "${cmake_bin}" ]; then
		arr=(${cmake_bin//|/ })
		case ${#arr[@]} in
			1) $build_bin && CBN="-D${arr[0]}=ON" || CBN="-D${arr[0]}=OFF";;
			2) $build_bin && CBN="-D${arr[1]}" || CBN="-D${arr[0]}";;
		esac
	fi

	[ -n "${cmake_config}" ] && CFG="${cmake_config} ${CFG}"
	#MAKE_EXECUTABLE=cmake
	#mkf='--build . --target install --config Release'
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



# end .cmake
function trap_sigint {
	tput cnorm -- normal
	cd $(dirname $0)
	echo -e "\n\n${CY1}  Interrupted by user${C0}\n  Log available at \e[4m${log_file}\e[24m\n\n"
}

function init {
	[ -f ".config" ] && source .config
	if [ ! -f ".config" ] || test `expr $(date +%s) - $config_lastupdate` -gt $((config_timeout * timeout_days)); then
		./x-setup
		source .config || doErr 'Unable to initialize config file'
	fi
	export is_init=true
}

# first load .common functions and error trap
if [ -z ${vsh+x} ];then
	source .common
	source ./utils/.utils
	source ./utils/.cmake
	set -o pipefail
	if [ "${1}" == "--debug" ];then
		shift
		set -x
		debug=true
	fi
	trap err ERR
fi

clangv=-15

sudo=$(command -v sudo)

export HOST_NPROC=$(nproc)
# defvar debug=false
: "${host_native:=false}"
: "${debug:=false}"
: "${nodev:=false}"
: "${is_init:=false}"
: "${pkg:=${lib}}"
: "${apt:=${lib}}"
: "${ac_nohost:=false}"
: "${disable_shared:=false}"
: "${ac_nosysroot:=false}"
: "${ac_nopic:=false}"
: "${banner:=true}"
: "${req_update_deps:=false}"
: "${update:=false}"
: "${build_dist:=true}"
: "${dep_build:=--static}"
: "${build_strip:=false}"
: "${build_cpack:=false}"
: "${API:=29}"
: "${def_build_sys:=meson}"
: "${inline:=false}"
: "${build_pkgdl:=false}"
: "${config_timeout:=86400}"
: "${indent:=0}"
: "${ind:=}"
: "${vnd:=}"
: "${ac_reconf:=true}"
: "${cmake_build_type:=Release}"

ndk_testtc=true

$req_update_deps && update=true
pkg_fmt="tgz"
timeout_days=3

cmake_toolchain_file=
mingw_posix_suffix=
update=false
retry=false
use_llvm_mingw=true
use_clang=true

break_on_git=false
break_on_patch=false
break_on_config=false
break_on_build=false
break_on_make=false


skip_pc=false
skip_dl=false
skip_cpack=true

# default build static, no shared, no executables
build_shared=false
build_static=true
build_bin=false
build_man=false

build_usepkgflags=false
git_stable=false
ndkcmake=false

build_package=true
only_repo=false
pc_filelist=

shell_dstack=

logtime_start=0
logtime_end=0


export CPPFLAGS=
export target_trip=

export dir_sources="${dir_root}/sources" \
       dir_cmake="${dir_root}/cmake" \
       dir_patches="${dir_root}/patches"

if [ -z "${src_dir}" ];then
	export dir_src=${dir_sources}/${lib}
else
	export dir_src=${dir_sources}/${src_dir}
fi
export dir_pkgdist="${dir_root}/packages"

[ -d "${dir_sources}" ] || mkdir -p ${dir_sources}

xv_x86_mingw="10"

! $is_init && init








main(){

	# exit if missing vars lib arch or src
	if [ -z "${lib}" ]; then
		echo -e "\n\n\t${CB1}  Toolchain is loadad.\n\tNow exiting...\n\n${C0}"
		return 0
	fi

	inc_tab

	if [ -z "${lic}" ] || [ -z "${dsc}" ];then
		gitjson=$(git_api_tojson $src)
		if [ -n "${gitjson}" ];then
			#echo -ne "${CY1}${b}${C0}"
			: "${lic:=$(echo "$gitjson" | jq .licence)}"
			: "${dsc:=$(echo "$gitjson" | jq .description)}"
		fi
	fi

	# show package info
	export log_file="${dir_install}/${lib}.log"

	if [ -z "$(check_install pc)" ]; then
		package_showinfo
	elif $update || $retry; then
		package_showinfo
	else
		end_script    
	fi
}



# Variables
# mki: rule for install 'make $mkinstall' (default: install)
# mkc: rule for clean 'make $mkclean' (default: clean)
# mkf: additional rule for make
# no_host  : while using autotools, no host will be set for cross-compile if no_host is not empty

gitjson=

start(){

	fn_defined 'on_config' && on_config

	if $build_pkgdl; then
		local lnk=$(get_link_pkg ${arch} ${lib})
		if [ -n "${lnk}" ]; then
			wget_pkg_tgz ${lnk} ${dir_install}
			$skip_pc || logver "${dir_install_pc}/${pkg}.pc"
			end_script
			exit 0
		fi
	fi

	# check whether to update source of main lib and dependencies
	if $update; then
		[ -d "${dir_src}" ] && rm -rf "${dir_src}" 2>/dev/null
		! $req_update_deps && update=false
	else
		! $retry && [ -f "${dir_install_pc}/${pkg}.pc" ] && exit
	fi

	# Reset LOGFILE
	[ -f "${log_file}" ] && rm -f ${log_file}

	# Create INSTALL_DIR and PKGCONFIG DIR
	mkdir -p ${dir_install_pc} ${dir_install}/share/pkgconfig
	export PKG_CONFIG_LIBDIR="${dir_install_pc}:${dir_install}/share/pkgconfig:${PKG_CONFIG_LIBDIR}"
	export PKG_CONFIG_PATH=

	# check build tools
	check_tools $tls

	local ovrs=$vrs
	local ocsh=$CSH
	local ocbn=$CBN
	unset vrs CSH CBN

	build_dependencies $dep

	vrs=$ovrs
	CSH=$ocsh
	CBN=$ocbn7

	log_start $arch ${eta}s

	local bss=
	
	$build_static && bss="${SSB}[static]" || bss="${CD}[static]"
	$build_shared && bss="${bss}${SSB}[shared]" || bss="${bss}${CD}[shared]"
	$build_bin && echo -ne "${bss}${SSB}[bin]${C0} " || echo -ne "${bss}${CD}[bin]${C0} "
	
	fn_defined 'on_build_bin' && unset CBN && on_build_bin 
	fn_defined 'on_build_static' && unset CSH && on_build_static
	fn_defined 'on_build_shared' && unset CSH && on_build_shared 
	
	cd ${dir_sources}


	if [ ! ${retry} ]; then
		if [ "${dir_build}" != "${dir_src}" ] && [[ "${dir_build}" != "${dir_config}" ]]; then
			rm -rf ${dir_build}
		fi
	fi

	local req_src_config=false
	local req_src_patch=false

	# get source
	if [ ! -d ${dir_src} ];then
		if ! $skip_dl; then
			# test internet connection...
			wget -q --spider http://google.com
			[ ! $? -eq 0 ] && doErr 'No Internet Connection. Aborting...'
			# check whether to custom get source
			if fn_defined 'source_get'; then
				fn_log 'get' source_get
				unset sty
			elif [ -n "${git}" ]; then
				src=$git
				sty="git"
			elif [ -n "${svn}" ]; then
				src=$svn
				sty="svn"
			fi
			if [ -n "${sty}" ]; then
				case $sty in
					git)           git_clone $src $lib $src_opt;;
					tgz|txz|tlz)   wget_tarxx $src $lib;;
					svn)           svn_clone $src $lib;;
					hg)            hg_clone $src $lib;;
					*)             doErr "unknown sty=$sty for $src";;
				esac
			else
				case $src in
					*.tar.*|*.tgz) wget_tarxx $src $lib;;
					*.git|*git.*)  git_clone $src $lib $src_opt;;
					*svn.*)        svn_clone $src $lib;;
					*)             doErr "Unknown source type for $src";;
				esac
			fi
		fi

		req_src_config=true

		$break_on_git && end_script

		test "x${cfg}" == "xcmake" && cmake_check_cmakefiles

		if fn_defined 'patch_source'; then
			fn_log 'patch' patch_source
		else
			fn_log '' patch_check_patchdir
		fi

	fi

	cd ${dir_src}
	if [ -n "${bra}" ]; then
		do_log "${bra}" git checkout ${bra}
	fi

	case $src in *git*) echo -ne "${CT0}[$(git describe --tags 2>/dev/null)]${CD} ";; esac
	
	case ${target_trip[3]} in
		android) fn_defined 'on_config_ndk'   && fn_log '' on_config_ndk;;
		gnu)     fn_defined 'on_config_gnu'   && fn_log '' on_config_gnu;;
		mingw32) fn_defined 'on_config_mingw' && fn_log '' on_config_mingw;;
	esac

	if $host_arm; then 
		fn_defined 'on_config_arm' && fn_log '' on_config_arm
	else
		fn_defined 'on_config_x86x' && fn_log '' on_config_x86x
	fi

	# default dir_config is dir_src
	: "${dir_config:=${dir_src}}"
	# check if defined custom dir_config location (config_dir)
	[ -n "${config_dir+x}" ] && dir_config="${dir_src}/${config_dir}"

	cd ${dir_config}

	if [ -z "${cfg}" ]; then
		config_guess
	fi

	if $req_src_config; then
		# check whether to custom config source
		if fn_defined 'source_config'; then
			fn_log 'config' source_config
		elif [ -n "${cfg_cmd}" ];then
			do_log 'config' ${cfg_cmd}
			unset cfg_cmd
		else case $cfg in
			ab)		[ -f "${dir_config}/boostrap" ] && do_log 'bootstrap' ${dir_config}/boostrap
					[ -f "${dir_config}/boostrap.sh" ] && do_log 'bootstrap' ${dir_config}/boostrap.sh
					;;
			ag) 	doAutogen ${dir_config} --noconfigure;;
			ar) 	doAutoreconf ${dir_config};;
			am)		if [ ! -f "${dir_config}/configure" ];then
						if [ -f "${dir_config}/autogen.sh" ];then
							doAutogen ${dir_config} --noconfigure
						else
							doAutoreconf ${dir_config}
						fi
					fi
					;;
			esac
		fi
		req_src_patch=true
	fi

	if $req_src_patch; then
		# check if has auto patch embeded in source: depracated
		patch_check_xbpatch
		# check if has patch function in source
		if fn_defined 'source_patch'; then
			fn_log 'patch' source_patch
		fi
		if [ -n "${cmake_cmakelists}" ]; then
			local fcmake="${dir_root}/cmake/$cmake_cmakelists"
			if [ -f "${fcmake}" ]; then
				local fcmake_dst="${dir_src}/CMakeLists.txt"
				cp -f "${fcmake}" "${fcmake_dst}" || doErr "Unable to copy ${fcmake} to ${fcmake_dst}"
				unset cmakelists_ext
			fi
		fi
	fi

	$break_on_patch && end_script

	if [ -z "${dir_build}" ];then
		case ${build_system} in
			cmake|meson|automake) dir_build="${dir_config}/build_${arch}"
				[ -d "${dir_build}" ] && rm -rf ${dir_build} 2>/dev/null
				;;
			*) dir_build=${dir_config};;
		esac
	fi

	[ -d "${dir_build}" ] || mkdir -p "${dir_build}"
	cd ${dir_build}

	log_vars dir_src dep PKG_CONFIG_LIBDIR
	log_vars API CC CXX LD AS AR NM RANLIB STRIP

	if fn_defined 'build_all'; then
		fn_log 'build' build_all
		end_script
	fi

	if fn_defined 'build_prepare'; then
		fn_log 'prepare' build_prepare
	fi

	if fn_defined 'build_clean'; then
		fn_log 'clean' build_clean
	elif [ -f "Makefile" ]; then
		mkc=$(make_findtarget "distclean" "clean")
		[ -n "${mkc}" ] && do_quietly 'clean' ${MAKE_EXECUTABLE} $mkc
	fi

	local arr
	if fn_defined 'build_config'; then
		build_config
		unset -f build_config
	else case $build_system in
		cmake)
			cmake_configure
			cfg_cmd=${CMAKE_EXECUTABLE}
			: "${cmake_bdir:=${dir_config}}"
			cfg_args+=("${cmake_bdir}" "-DCMAKE_INSTALL_PREFIX=${dir_install}" "-DCMAKE_BUILD_TYPE=${cmake_build_type}" "${CTC}" "${CFG}" "${CSH}" "${CBN}" "${CPACK}" -Wno-dev)
			do_log "${build_system}" ${cfg_cmd} ${cfg_args[@]}
			case $cfg in ccm|ccmake) tput sc; ccmake ..; tput rc;; esac
			;;

		automake) # use autotools and configure executable to create makefile
			ac_configure
			cfg_cmd="${dir_config}/configure"
			cfg_args+=("--prefix=${dir_install}" "${CFG}" "${CSH}" "${CBN}")
			do_log "${build_system}" ${cfg_cmd} ${cfg_args[@]}
			;;

		meson)
			meson_configure
			cfg_cmd='meson'
			cfg_args+=('setup' '--buildtype=release' "--cross-file=${cfg_file}" "--prefix=${dir_install}" "${CFG}" "${CSH}" "${CBN}")
			do_log "${build_system}" ${cfg_cmd} ${cfg_args[@]}
			#do_log 'meson' meson setup --buildtype=release --cross-file=${cfg_file} --prefix=${dir_install} ${CFG} ${CSH} ${CBN}
			;;

		make)
			: "${mkf:=$CFG}"
			MAKE_EXECUTABLE=make
			;;
		bazel)
			cfg_cmd='bazel'
			do_log "${build_system}" ${cfg_cmd} ${cfg_args[@]}
			;;
		*)	if [ -n "${cfg_cmd}" ]; then
				do_log 'config' ${cfg_cmd} ${cfg_args[@]}
			else
				doErr "cfg ${cfg} unknown or cfg_cmd not defined. Use build_config to custom configure makefile"
			fi
			;;
		esac
	fi

	$break_on_config && end_script

	if fn_defined 'before_make'; then
		fn_log 'preparing' before_make
	fi

	[ -n "${WFLAGS}" ] && CPPFLAGS+=" ${WFLAGS}"

	if [ -z "${static_ldflag}" ];then
		static_ldflag='-static'
		# set -all-static flags at make time (see: https://stackoverflow.com/questions/20068947/how-to-static-link-linux-software-that-uses-configure)
		# $build_static && [[ "$LDFLAGS" != *"-all-static"* ]] && LDFLAGS="-all-static $LDFLAGS"
		$host_clang && static_ldflag="-all${static_ldflag}"
	fi

	$host_clang && $build_static && LDFLAGS="-static $LDFLAGS"

	log_vars CFLAGS CXXFLAGS WFLAGS CPPFLAGS LDFLAGS LIBS

	[ -z "${mki}" ] && mki="install"
	: "${skip_make:=false}"

	if fn_defined 'on_make'; then
		fn_log 'make' on_make
	elif ! $skip_make; then
		do_progress 'make' ${MAKE_EXECUTABLE} ${mkf} -j${HOST_NPROC} || err
		unset skip_make
	fi

	$break_on_make && end_script
	


	if fn_defined 'before_install'; then
		fn_log 'preparing' before_install
	fi

	# strip libs
	if ! $host_mingw; then
		if fn_defined 'on_strip'; then
			fn_log 'strip' on_strip
		elif $build_strip; then
			do_log 'strip' doStrip
		fi
	fi

	if fn_defined 'on_install'; then
		fn_log 'install' on_install
	else
		cd $dir_build
		do_log 'install' ${MAKE_EXECUTABLE} ${mki}
	fi

	# check whether to create pkg-config .pc file
	if ! $skip_pc; then
		if fn_defined 'get_version'; then
			vrs=$(get_version)
		fi
		if fn_defined 'on_create_pc'; then
			fn_log 'pkgconfig' on_create_pc
		elif [ -n "$pc_llib" ]; then
			do_log 'pkgconfig' create_pkgconfig_file $pkg $pc_llib
		elif [ -n "${pc_llibs}" ]; then
			local p
			for f in ${pc_llibs}; do
				[ "${f::2}" == "-l" ] && p="${f:2}" || p="$f"
				create_pkgconfig_file $p $f
			done
		fi
	fi

	local pcfile=${dir_install_pc}/${pkg}.pc
	if [ ! -f "$pcfile" ] && [ -f "${dir_install}/share/pkgconfig/${lib}.pc" ]; then
		pcfile=${dir_install}/share/pkgconfig/${lib}.pc
	fi

	if $build_cpack; then
		if [ -z "${CPACK}" ]; then
			if fn_defined 'on_pack'; then
				fn_log 'pack' on_pack
			elif $build_package; then
				if [ -f "${dir_build}/install_manifest.txt" ]; then
					do_log 'cpack' cmake_build_package
				else
					do_log 'pack' build_packages_bin
				fi
			fi
		else
			cd ${dir_build}
			vrs=$(pkg-config ${pcfile} --modversion)
			do_log 'cpack' cpack -G DEB -P "${lib}_${vrs}_${arch}"
		fi
	fi

	cd ${dir_src}

	$skip_pc || logver "${pcfile}"

	fn_defined 'on_end' && fn_log 'end' on_end

	local pcvrs=$(pkg-config --modversion ${pcfile})
	local scrpt=${dir_root}/$(basename "$0")
	test -n "${pcvrs}" && sed -i "s/dev_vrs='.*'/dev_vrs='"${pcvrs}"'/g" ${scrpt}

	end_script
}	

# see https://mesonbuild.com/Commands.html for command line options
meson_configure(){
	export cfg_file="${dir_config}/${arch}.meson"
	test -f "${cfg_file}"  && rm ${cfg_file}
	$host_clang || LD="bfd"
	if [ -n "${meson_bin}" ]; then
		arr=(${meson_bin//|/ })
		case ${#arr[@]} in
			1) $build_bin && CBN="-D${arr[0]}=true" || CBN="-D${arr[0]}=false";;
			2) $build_bin && CBN="-D${arr[1]}" || CBN="-D${arr[0]}";;
		esac
	fi
	meson_create_toolchain ${cfg_file}
	MAKE_EXECUTABLE=ninja
	$build_static && meson_cfg+=' --prefer-static'
	[ -n "${meson_cfg}" ] && CFG="${meson_cfg} ${CFG}"
}

ac_configure() {
	$ac_reconf && autoreconf -fi 2>/dev/null >>${log_file}
	#[ -z "${mki+x}" ] && mki=$(make_findtarget "install-strip" "install")
	[ -z "$exec_config" ] && exec_config='configure' # default config executable
	[ -n "${ac_config}" ] && CFG=${ac_config}

	local opt_list="$(${dir_config}/${exec_config} --help | grep -P '^[[:space:]]+\-\-')"

	# find static build option
	if $build_static && [ -n "$(echo "${opt_list}" | grep '\-\-enable-static')" ]; then
		build_type="--enable-static"
	fi
	# find shared build option
	if $build_shared && [ -n "$(echo "${opt_list}" | grep '\-\-enable-shared')" ]; then
		build_type+=" --enable-shared"
	fi

	if [ -n "${ac_bin}" ]; then
		arr=(${ac_bin//|/ })
		case ${#arr[@]} in
			1) $build_bin && CBN="${arr[0]}=1" || CBN="${arr[0]}=0";;
			2) $build_bin && CBN="${arr[1]}" || CBN="${arr[0]}";;
		esac
	fi

	if [ -n "${ac_opts}" ]; then
		for opt in $(echo ${ac_opts}); do
			case $opt in
				--update-config_sub)
					local fpath=$(find ${dir_src} -name 'config.sub')
					test -f "${fpath}" && cp -f /usr/share/automake*/config.sub ${fpath}
					;;
				--update-config_guess)
					local fpath=$(find ${dir_src} -name 'config.guess')
					test -f "${fpath}" && cp -f /usr/share/automake*/config.guess ${fpath}
					;;
				--no-sysroot)
					ac_nosysroot=true
					;;
				--no-pic)
					ac_nopic=true
					;;
				--no-host)
					ac_nohost=true
					;;
			esac
		done
	fi

	if ! $ac_nohost && $host_cross && [ -n "$(echo "${opt_list}" | grep '\-\-host')" ]; then
		$host_cross && CFG+=" --host=${arch}"
	fi

	if ! $ac_nosysroot; then
		if [ -n "$(echo "${opt_list}" | grep '\-\-with-sysroot')" ]; then
			CFG+=" --with-sysroot=${SYSROOT}"
		elif [ -n "$(echo "${opt_list}" | grep '\-\-sysroot')" ]; then
			CFG+=" --sysroot=${SYSROOT}"
		fi
	fi

	if ! $ac_nopic && ! $host_mingw && [ -n "$(echo "${opt_list}" | grep '\-\-with-pic')" ]; then
		CFG+=" --with-pic"
	fi
	MAKE_EXECUTABLE=make
}

doStrip(){
	local libdir
	for dd in $(find ${dir_build} \( -name "*.a" -o -name "*.so" \));do
		${STRIP} --strip-unneeded $dd
	done
}

end_script(){
	log_end
	# check if parent process is shell script
	local parent=$(ps -o comm= $PPID)
	[ "${parent: -3}" == ".sh" ] || echo -e "\n${CT1}::Done${C0}\n"
	$debug && set +x
	unset	dir_config dir_build dir_src \
			CSH CBN exec_config vrs vnd \
			ac_nohost ac_nopic ac_nosysroot ac_opts ac_reconf \
			req_pcforlibs mkc mki mingw_posix \
			cfg_args LIBS CFLAGS CXXFLAGS LDFLAGS WFLAGS
	dec_tab
	echo
	exit 0
}

make_findtarget(){
	${MAKE_EXECUTABLE} ${1} -n 2>>${log_file}
	if test $? -eq 2 ; then
		echo "${2}"; echo "make: target ${1} not found, setting default ${2} target." >>${log_file}
	else
		echo "${1}"; echo "make: target ${1} found." >>${log_file}
	fi
}

check_install(){
	local ext=''
	case $1 in
		# check includes
		inc*)
			for h in $lst_inc; do 
				test -z "$(ls ${dir_install}/include/$h 2>/dev/null)" && echo && return 0
			done
			echo 1
			return 0
			;;
		# check libs
		static*) ext='\.a';;
		shared*) $host_mingw && ext='\.dll*' || ext='\.so*';;
		lib*) ext='.*';;
		# check bin
		bin)
			for h in $lst_bin; do 
				test -z "$(ls "${dir_install}/bin/${h}" 2>/dev/null)" && echo && return 0
			done
			echo 1
			return 0
			;;
		# check pkgconfig
		pc|pkgconfig)
			[ -z "${lst_pc}" ] && echo && return 0
			for h in $lst_pc; do 
				test -z "$(ls "${dir_install}/lib/pkgconfig/${h}" 2>/dev/null)" && echo && return 0
			done
			echo 1
			return 0
			;;
	esac
	if [ -n "${ext}" ];then
		for h in $lst_lib; do
		echo "listing ${dir_install}/lib/${h}${ext}"
		test -z "$(ls ${dir_install}/lib/${h}.* | grep ''${ext}'' 2>/dev/null)" && echo && return 0
		done
		echo 1
		return 0
	fi
	echo
	return 0
}


build_dependencies(){
	local pkgfile=
	local o_csh
	local o_cbh
	local cf
	local ldir
	while [ -n "${1}" ]; do
		[ -f "./${1}.sh" ] || doErr "no script file ${1}.sh.\n  Aborting..."
		pkgfile=$(./${1}.sh ${arch} --get pc)
		libname=$(./${1}.sh --get libname)
		if [ ! -f "${pkgfile}" ]; then
			o_csh=$CSH
			o_cbh=$CBH
			$build_pkgdl && local dl="--dl" || local dl=''
			unset CSH CBH
			
			./${1}.sh ${arch} ${dep_build} ${dl}
			
			CSH=$o_csh
			CBH=$o_cbh
		fi
		if [ -f "${pkgfile}" ]; then
			local cmi=$(./${1}.sh ${arch} --get cmake_include)
			[ -n "$cmi" ] && cmake_includes="$cmi $cmake_includes"
			ldir="$(dirname ${pkgfile})"
			str_contains $PKG_CONFIG_LIBDIR ${ldir} || PKG_CONFIG_LIBDIR="${ldir}:${PKG_CONFIG_LIBDIR}"
		fi
		shift
	done
}


#usage: meson_create_toolchain <out.meson.file>
meson_create_toolchain(){
	case $arch in
		aarch*)  cpu1="aarch64" cpu2="aarch64";;
		arm*)    cpu1="arm"     cpu2="arm";;
		i686*)   cpu1="x86"     cpu2="i686";;
		x86_64*) cpu1="x86_64"  cpu2="x86_64";;
	esac
	cmake_create_toolchain ${dir_build}

	cat <<-EOF >${1}
		[binaries]
		c = '${CC}'
		c_ld = '${LD}'
		cpp = '${CXX}'
		cpp_ld = '${LD}'
		ar = '${AR}'
		as = '${AS}'
		pkg-config = '$(command -v pkg-config)'
		addr2line = '${ADDR2LINE}'
		objcopy = '${OBJCOPY}'
		objdump = '${OBJDUMP}'
		ranlib = '${RANLIB}'
		readelf = '${READELF}'
		size = '${SIZE}'
		strings = '${STRINGS}'
		strip = '${STRIP}'
		windres = '${WINDRES}'

		[properties]
		needs_exe_wrapper = true
		cmake_toolchain_file = '${cmake_toolchain_file}'

		[host_machine]
		system = '$(str_lowercase ${PLATFORM})'
		cpu_family = '${cpu1}'
		endian = 'little'
		cpu = '${cpu2}'

		[target_machine]
		system = '$(str_lowercase ${PLATFORM})'
		cpu_family = '${cpu1}'
		endian = 'little'
		cpu = '${cpu2}'
		EOF

	echo -e "\nMeson file:(${1})\n\n" >>${log_file} 2>&1
	cat ${1} >>${log_file} 2>&1
}

# usage cmake_create_toolchain <dir>
cmake_create_toolchain(){
	cmake_build_toolchainfile
}

cargo_create_toolchain(){
cat <<-EOF >>cargo-config.toml
	[target.aarch64-linux-android]
	ar = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar"
	linker = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android${API}-clang"

	[target.arm-linux-androideabi]
	ar = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar"
	linker = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/armv7a-linux-androideabi${API}-clang"

	[target.i686-linux-android]
	ar = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar"
	linker = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/i686-linux-android${API}-clang"

	[target.x86_64-linux-android]
	ar = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-ar"
	linker = "${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin/x86_64-linux-android${API}-clang"
	EOF
}

# usage: check_tool_dependency <exe-name> <pkg-name>. returns path of exe-name
check_tool_dependency(){
	local nm
	local pk
	if [ -n "$1" ];then
		nm=$1
		[ -n "$2" ] && pk=$2 || pk=$1
		[ -z $(command -v $nm) ] && apt_install $pk
		nm=$(command -v $nm)
	fi
	echo $nm
}


check_tools(){
	while [ -n "$1" ]; do
		toolname=$1
		toolpkg=$1
		case $1 in
			rust )      installRust && continue;;
			libtool )   toolname=libtoolize;;
			texinfo )   toolname=makeinfo;;
			autotools ) autotools_check && continue;;
		* ) ;;
		esac
		request_cmd ${toolname} ${toolpkg}
		shift
	done
}

# usage: chkTools tools...
autotools_check(){
	if [ -z $(command -v automake) ];then
		tput sc
		$sudo apt -qq install automake autogen autoconf m4 libtool-bin -y >/dev/null 2>&1 
		tput rc
	fi
}

# make args...
do_make(){
	make $@ 2>&1 | tee -a ${log_file} | grep -Eo "\[.+%\]" 
}

secs2time(){
	[ $(($1/60%60)) -eq 0 ] && printf '%ds' $(($1%60)) || printf '%dm %ds' $(($1/60%60)) $(($1%60))
}

log_start(){
	logtime_start=$(date +%s)
	#echo -ne "$CC1  $@: "
	if ! $inline; then
		echo -ne "${CD}${inde}${C0}$(date '+%H:%M')"
		[ $eta ] && echo -ne "-${CW}$(date '+%H:%M' --date="$eta seconds")"
		printf " ${CT1}%-10s ${CT1}%-21s${CD} " ${lib} ${arch}
	fi
	echo $(date) > ${log_file}
}

log_end(){
	if ! $inline && [ -n "${logtime_start}" ]; then
		logtime_end=$(date +%s)
		#local pkgsize=$(du -sk ${dir_install} | cut -f1)
		#local libsize=$(du -sk ${dir_install}/lib | cut -f1)
		local secs=$(($logtime_end-$logtime_start))
		local msg="${CT1} done ${CD}in $(secs2time ${secs})"
		[ $secs -gt 60 ] && msg="$msg (${secs}s)"
		#echo -e "$msg pkg/lib: ${pkgsize}/${libsize}kb${C0}"
		echo -e "$msg"
	fi
}

log(){
	echo -ne "$CD$@$C0"
}

logf(){
	echo -e "\n$(date +"%T"): $@" >> "${log_file}"
}

log_vars(){
	local t;
	while [ -n "$1" ]; do
		echo "$1=${!1}" >>${log_file} 2>&1
		shift
	done
	echo >>${log_file}
}

print_vars(){
	while [ -n "$1" ]; do
		printf "${CC0}%-20s: ${C0}%s\n" "  ${1}" ${!1}
		shift
	done
}

doErr(){
	echo -e "${CR1}  Error: ${CR0}${1}${C0}\n\n"
	if [ -f ${log_file} ];then
		if [ -f ${dir_build}/CMakeFiles/CMakeError.log ];then
		echo -e "\n\n${dir_build}/CMakeFiles/CMakeError.log:\n" >> ${log_file}
		cat ${dir_build}/CMakeFiles/CMakeError.log >> ${log_file}
		fi
		echo -ne "${CD}${ind}${CY1}Open log? [Y|n]:${C0}" && read openlog
		[ "$openlog" != "n" ] && nano ${log_file}
	fi
	exit 1
}

err(){
	if [ -n "${logtime_start}" ]; then
		logtime_end=$(date +%s)
		echo -e "${CR1} fail ${CR0}[$(secs2time $(($logtime_end-$logtime_start)))]${C0}\n"
	fi
	if [ -f ${log_file} ];then
		if [ -f ${dir_build}/CMakeFiles/CMakeError.log ];then
		echo -e "\n\n${dir_build}/CMakeFiles/CMakeError.log:\n" >> ${log_file}
		cat ${dir_build}/CMakeFiles/CMakeError.log >> ${log_file}
		fi
		echo -ne "${CD}${ind}${CY1}Open log? [Y|n]:${C0}" && read openlog
		[ "$openlog" != "n" ] && nano ${log_file}
	fi
	echo
	exit 1
}

log_this() {
	echo -e "\n$(date +"%T"): $@" >> "${log_file}"
	"$@" 2>> "${log_file}" 1>> "${log_file}" || err
	logok
}


do_quietly(){
	local var=$1; shift
	echo -ne "${CD}${var}${C0}"
	echo -e "\n$(date +"%T"): $@" >> "${log_file}"
	"$@" >/dev/null 2>&1
	logok $var
}

do_log() {
	local var=$1; shift
	echo -ne "${CD}${var}${C0}"
	log_this $@
	logok $var
}

do_progress() {
	local var=$1; shift
	echo -ne "${CD}${var}"
	echo -e "\n$(date +"%T"): $@" >> "${log_file}"
	("$@" |& tee -a ${log_file} | topct) || doErr "in ${var}:\n\n...\n$(tail -n5 ${log_file})${C0}"
	logok $var
}

logok() {
	echo -ne "\e[${#1}D${CT0}${1}${C0} "
}

# usage logver /path/to/pkgconfigfile.pc
logver() {
	if [ -f $1 ];then
		echo -ne "${CT1}version $(pkg-config --modversion $1)${C0}"
	else
		echo -ne "${CS0} missing ${1} ${C0}"
	fi
}

inline_ccmake(){
	tput sc; ccmake $@; tput rc
}

isBottomRow(){
	test "$(echo "lines"|tput -S)" == "$(IFS=';' read -sdR -p $'\e[6n' ROW COL && echo "${ROW#*[}")" && echo 1 || echo 0
}

# usage: do_git giturl [libname]
do_git(){
	do_log 'git' git clone $1 $2
	cd $2
	if [ -n "${bra}" ]; then
		do_log ${bra} git checkout ${bra}
	elif [ -n "${vrs}" ]; then
		do_log ${vrs} git checkout tags/${vrs}
	fi
	if [ -n "${sub}" ];then
		do_log 'sub' git ${sub}
	fi
	cd ..
}

prt_git_progress(){
	tput civis
	printf "%-8s"
	local s0
	local s1
	local n1=0
	while read -r ln; do
		if ! [ "${ln%\'...}" == "${ln}" ]; then
		printf "\e[7D"
		printf "%-40s\e[40D"
		s1=${ln#*\'}
		s1=${s1##*/}
		s1=${s1%\'...}
		printf "\e[${n1}D"
		n1=${#s1}
		[ $n1 -gt 0 ] && printf " %-${n1}s" $s1
		printf "%-6s"
		else
		s0=$(grep -oP '\d+%' <<< $ln)
		[ -n "$s0" ] && printf "\e[5D%-5s" $s0
		fi
	done
	[ $n1 -gt 0 ] && printf "\e[${n1}D"
	printf "\e[7D"
	tput cnorm
}

topct(){
	local sln
	local grp
	tput civis
	printf "build_system: %10s; make: %7s" ${build_system} ${MAKE_EXECUTABLE} >>${log_file}
	if [ "${build_system}" == "cmake" ] && [ "$(basename ${MAKE_EXECUTABLE})" == "make" ]; then
		printf "%-6s"
		while read -r ln; do
			str_contains "${ln}" 'error: ' && printf $CR1
			sln=$(grep -oP '\d+%' <<< $ln)
			[ -n "$sln" ] && printf "\e[5D%-5s" $sln
		done
		printf "\e[6D"
	elif [ "$(basename ${MAKE_EXECUTABLE})" == "ninja" ]; then
		printf "%-12s"
		while read -r ln; do
			str_contains $ln 'error: ' && printf $CR1
			sln=$(grep -oP '\[\d+/\d+\]' <<< $ln)
			[ -n "$sln" ] && printf "\e[11D%-11s" $sln
		done
		printf "\e[12D"
	else
		printf "%-6s"
		while read -r ln; do
			sln+="." # ·
			[ ${#sln} -eq 5 ] && sln=''
			[ -n "$sln" ] && printf "\e[5D%-5s" $sln
		done
		printf "\e[6D"
	fi
	tput cnorm
}

git_clone(){
	local var="git"
	echo -ne "${CD}${var}"
	logf git clone --progress --verbose $src $lib $src_opt
	git clone --progress --verbose $src $lib $src_opt |& tr '\r' '\n' | prt_git_progress
	logok $var
	test -d "$lib" && cd $lib || err
	if [ -n "${bra}" ]; then
		do_log ${bra} git checkout ${bra}
		unset bra
	elif [ -n "${vrs}" ]; then
		do_log ${vrs} git checkout tags/${vrs}
	fi
	if [ -n "${sub}" ];then
		do_log 'sub' git ${sub}
	fi
	cd ..
}

svn_clone(){
	request_cmd svn subversion || err
	#[ $(command -v svn) ] || apt_install subversion || err
	do_log 'svn' svn checkout $1 $2
}

hg_clone(){
	request_cmd hg mercurial || err
	#[ $(command -v hg) ] || apt_install mercurial || err
	do_log 'clone' hg clone $1 $2
}

set_git_version(){
	pushdir ${dir_src}
	local v=$(git describe --abbrev=0 --tags 2>/dev/null)
	[ -n "$v" ] && export vrs=$v
	popdir
}

github_latest_tgz(){
	case $src in
		*github.*)
			local dst=$(echo $src | sed -e 's|\.git||g')
			local url=$(curl -ILs -o /dev/null -w %{url_effective} "${dst}/releases/latest")
			local file=$(curl -s $url | grep -Po '(?<=>)[^<]*' | grep -Po '.*tar.gz$')
			echo "${url}/${file}"
		;;
		*gitlab.*|*code.videolan.org*)
			local dst=$(echo $src | sed -e 's|\.git||g')
			local v=$(git_remote_version $src)
			echo "$dst/-/archive/${v}/${lib}-${v}.tar.gz"
		;;
		*.googlesource.*)
			local tag=$(git -c 'versionsort.suffix=-' ls-remote --refs --sort='v:refname' $src | tail -n1 | cut -f1)
			echo "$src/+archive/${tag}.tar.gz"
		;;
	esac
}


# usage: wget_tarxx type url libname
wget_tarxx(){
	local tag="get"
	local args=
	echo -ne "${CD}${tag}${C0}"
	echo "$(date): $@" >> "${log_file}"

	if [ -z "${sty}" ]; then
		case $src in
			*.tar.lz)        request_cmd 'lzip' && args='--lzip -xv';;
			*.tar.gz|*.tgz)  args="-xvz";;
			*.tar.xz)        args="-xvJ";;
			*.tar.bz2)       args="-xvj";;
		esac
	else
		case $sty in
			tgz)       args="-xvz";;
			txz)       args="-xvJ";;
			tbz|tbz2)  args="-xvj";;
			tlz)       args="--lzip -xv";;
		esac
	fi
	
	test -z "$args" && doErr "unknown compressed file format for $(basename ${src})"

	[ -d "tmp" ] && rm -rf tmp
	mkdir tmp
	wget -qO- $1 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' $args -C tmp >/dev/null 2>&1 || err
	cd tmp
	local nf=(*)
	if [ ${#nf[@]} -gt 2 ]; then
		[ -d "../${2}" ] && rm -rf "../${2}"
		mkdir ../${2}
		mv * ../${2}
	else
		mv * $2 && mv $2 ..
	fi
	cd ..
	rm -rf tmp

	#if [ ! -f "${2}" ];then
	#  local fname=$(basename $src | sed -E 's/[0-9\.-_].*//')
	#  mv ${fname}* $2
	#fi
	logok $tag
}

wget_pkg_tgz(){
	local tag="$(basename ${1})"
	tag="pkg: ${tag//_${arch}.tag.gz/}"
	printf "${CD}%s${C0}" ${tag}
	printf "\n\n$(date): wget/untar %-50s to %s" $1 $2 >>${log_file}
	wget -qO- ${1} 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz -C ${2} >>${log_file} 2>&1 || err
	echo -e "\n\n" >>${log_file}
	logok $tag
}

# Usage: wget_targz src_url dest_dir
wget_targz(){
	pushd $(dirname $2)
	wget -qO- $1 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' -xvz -C $2 >/dev/null 2>&1 || err
	popd
}

wget_tar(){
	local tag="source"
	local args=
	echo -ne "${CD}${tag}${C0}"
	echo -e "\n\n$@\n----------------------------------------\n" >> "${log_file}"
	echo "$(date): $@" >> "${log_file}"
	case $sty in
		tlz|tar_lz) 
		test -z $(command -v lzip) && apt_install lzip
		ags="--lzip -xv"
		;;
		tgz|tar_gz) args="-xvz";;
		txz|tar_xz) args="-xvJ";;
	esac
	wget -qO- $src 2>>${log_file} | tar --transform 's/^dbt2-0.37.50.3/dbt2/' $args >/dev/null 2>&1 || err
	mv ${1}* ${lib}
	echo -e "----------------------------------------\n" >> "${log_file}"
	logok $tag
}

getZip(){
	[ -z $(command -v unzip) ] && apt_install unzip
	log download
	wget $1 -O tmp.zip || err
	log extract unzip tmp.zip
	rm tmp.zip
	logok
}




clean(){
	echo -ne "${CT0}\n\tcleaning...\n"
	rm -rf builds/$arch/$lib builds/$arch/$lib.log
	pushdir sources/$lib
	[ -f Makefile ] && make clean
	popdir
	echo -e "$C0\tdone"
	clear
}



showOpts(){
	if [ -d "$1" ];then
		local od=$(pwd)
		local bdir=$(pwd)/builds
		cd "${1}/${config_dir}"
		[ -f CMakeLists.txt ] && ${CMAKE_EXECUTABLE} -LA | awk '{if(f)print} /-- Cache values/{f=1}' >${od}/builds/${lib}_cmake.opts && nano "${od}/builds/${lib}_cmake.opts"
		[ -f configure ] && ./configure --help >${od}/builds/${lib}_aconf.opts && nano "${od}/builds/${lib}_aconf.opts"
		cd $od
	else
		echo -e "${CD}${ind}${CR0}no configuration file found in ${CR1}${1}${CD}\n\n"
	fi
}



doAutogen(){
	[ $1 ] || doErr "missing arg in doAutogen: usage doAutogen <AUTOGEN_DIR>"
	local var="autogen"
	echo -ne "${CD}${var}${C0}"
	pushdir $1
	shift
	case $1 in
		--noerr ) ./autogen.sh >>${log_file} 2>&1;;
		--noconfigure ) NOCONFIGURE=1 log_this ./autogen.sh;;
		* ) log_this ./autogen.sh;;
	esac
	popdir
	logok $var
}

doAutoreconf(){
	local d=${1}
	local var="autoreconf"
	local od=$(pwd)
	[ -z "${d}" ] && d=${dir_config}
	echo -ne "${CD}${var}${C0}"
	cd $d
	log_this autoreconf -fi
	cd $od
	logok $var
}

download(){
	# bsdtar from stdin doesnt extract file +x permission
	# wget -qO- $1 | bsdtar -xvf- >/dev/null 2>&1
	echo -ne " ${CD}checking tools"
	test -z $(command -v unzip) && apt_installBr unzip
	echo -ne " ${CS0}downloading..."
	tput sc && echo -ne "\e[$(tput lines);0H${CY1}"
	wget --progress=dot $1 -O tmp.zip 2>&1 | grep --line-buffered "%" | sed -u -e "s,\.,,g" | awk '{printf("\r%4s %s eta:%s  ",$2,$1,$4)}'
	tput rc
	echo -ne "${CS0} decompressing... ${C0}"
	unzip tmp.zip >/dev/null 2>&1 && rm tmp.zip || err
}

toolchain_android(){
	PLATFORM='Android'
	[ -d "${ANDROID_NDK_HOME}" ] || doErr "No ANDROID NDK Toolchain found. Aborting."

	TOOLCHAIN="/usr/${arch}"
	SYSROOT="${TOOLCHAIN}/sysroot"
	CROSS_PREFIX="${TOOLCHAIN}/bin/"

	CC="${CROSS_PREFIX}clang"
	CXX="${CROSS_PREFIX}clang++"
	AS="${CC}"
	LD="${CROSS_PREFIX}ld"
	YASM=${CROSS_PREFIX}yasm
	ASM_NASM=${YASM}

	CMAKE_TOOLCHAIN="${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake"
	LT_SYS_LIBRARY_PATH="${TOOLCHAIN}/lib:${SYSROOT}/usr/lib/${arch}:${SYSROOT}/usr/lib/${arch}/${NDK_API}"
	PKG_CONFIG_DIR="/usr/${arch}/local/lib/pkgconfig"
	CPPFLAGS+=" -I${SYSROOT}/usr/include -I/usr/${arch}/include -I${SYSROOT}/usr/include"
	LDFLAGS="-Wl,-rpath,${LT_SYS_LIBRARY_PATH} ${LDFLAGS}"
	#test $build_static && LDFLAGS+=" -static-libstdc++ -lc++_static"

	cmake_system_processor="${target_trip[0]}${target_trip[1]}"
	$host_arm32 && cmake_system_processor="armv7-a"
	cmake_findrootpath="/usr/${arch} /usr/${arch}/lib /usr/${arch}/lib/${API} /usr/${arch}/sysroot/usr ${dir_install}"
	export NDK_API=${API}
}

toolchain_mingw32_old(){
	local ltsdir
	PLATFORM='Windows'
	AS="${CROSS_PREFIX}as"
	LD="${CROSS_PREFIX}ld"
	if [ -n "${LLVM_MINGW_HOME}" ] && $use_llvm_mingw; then
		TOOLCHAIN="${LLVM_MINGW_HOME}/bin"
		SYSROOT="${LLVM_MINGW_HOME}/${arch}"
		CROSS_PREFIX="${TOOLCHAIN}/${arch}-"
		if $use_clang; then
			CC="${CROSS_PREFIX}clang" CXX="${CC}++"
		else
			CC="${CROSS_PREFIX}gcc" CXX="${CROSS_PREFIX}g++"
		fi
		LD+=".bfd"
		LT_SYS_LIBRARY_PATH="${LLVM_MINGW_HOME}/lib/clang/${xv_llvm_mingw}"
		CPPFLAGS+=" -I${LLVM_MINGW_HOME}/${arch}/include"
		LDFLAGS="-L${LT_SYS_LIBRARY_PATH}/lib -L${SYSROOT}/lib ${LDFLAGS}"
	else
		CROSS_PREFIX="${arch}-"
		TOOLCHAIN="/usr/${arch}/bin"
		SYSROOT="/usr/${arch}"
		$mingw_posix && posix="-posix" || unset posix
		CC="${CROSS_PREFIX}gcc${posix}"
		CXX="${CROSS_PREFIX}g++${posix}"
		LT_SYS_LIBRARY_PATH="/usr/lib/gcc/${arch}/${xv_x64_mingw}"
		LDFLAGS="-L${LT_SYS_LIBRARY_PATH} ${LDFLAGS}"
	fi
	cmake_findrootpath="${SYSROOT} ${LT_SYS_LIBRARY_PATH} ${dir_install}"
	export RC=${CROSS_PREFIX}windres
}

toolchain_llvm_mingw(){
	local ltsdir
	local cargs=
	PLATFORM='Windows'

	SYSROOT="/usr/${arch}"
	TOOLCHAIN="${SYSROOT}/bin/"
	CROSS_PREFIX="${LLVM_MINGW_HOME}/bin/${arch}-"
	if $use_clang; then
		CC="${CROSS_PREFIX}clang"
		CXX="${CROSS_PREFIX}clang++"
		AS="${CC}"
		LD="${CROSS_PREFIX}ld"
	else
		CC="${CROSS_PREFIX}gcc"
		CXX="${CROSS_PREFIX}g++"
		AS="${CROSS_PREFIX}as"
		LD="${CROSS_PREFIX}ld"
	fi
	export RC=${CROSS_PREFIX}windres
	LT_SYS_LIBRARY_PATH="${LLVM_MINGW_HOME}/lib/clang/${xv_llvm_mingw}"
	CPPFLAGS+=" -I${SYSROOT}/include"
	LDFLAGS="-L${LT_SYS_LIBRARY_PATH}/lib -L${SYSROOT}/lib ${LDFLAGS}"
	YASM=yasm
	ASM_NASM=${NASM}
	NASM=${NASM}
	cmake_findrootpath="${SYSROOT} ${LT_SYS_LIBRARY_PATH} ${dir_install}"

}

toolchain_linux_old(){
	local cross
	local ltsdir
	case $arch in
		aarch64-*) cross="-cross" ltsdir=${GCC_AARCH64_REL};;
		arm-*)     cross="-cross" ltsdir=${GCC_ARMHF_REL};;
		i686-*)    cross="-cross" ltsdir=${GCC_I686_REL};;
		x86_64-*)  unset cross;   ltsdir=${GCC_X86_64_REL};;
	esac
	if [ -n "$cross" ]; then
		SYSROOT="/usr/${arch}"
		CROSS_PREFIX="${arch}-"
	else
		SYSROOT="/usr"
		CROSS_PREFIX=""
	fi
	TOOLCHAIN="${SYSROOT}/bin"
	if $use_clang; then
		CROSS_PREFIX="llvm-"
		CC="clang -target ${arch}"
		CXX="clang++ -target ${arch}"
		AS=${CC}
		LD="ld.lld"
		GNU_CLANG_VERSION_FULL="$(clang -dumpversion)"
		GNU_CLANG_VERSION_MAJOR=${GNU_CLANG_VERSION_FULL%%\.*}
		#LDFLAGS+=" -L/usr/lib/llvm-${GNU_CLANG_VERSION_MAJOR}/lib"

	else
		CC=${CROSS_PREFIX}gcc
		CXX=${CROSS_PREFIX}g++
		AS=${CROSS_PREFIX}as
		LD=${CROSS_PREFIX}ld
	fi
	ASM_NASM=nasm
	# local ltsdir=$(ls -t /usr/lib/gcc${cross}/${arch} 2>/dev/null | head -n1)
	LT_SYS_LIBRARY_PATH="${SYSROOT}/lib/gcc${cross}/${arch}/${ltsdir}"
	LDFLAGS="-Wl,-rpath,${LT_SYS_LIBRARY_PATH} ${LDFLAGS}"
	CPPFLAGS+=" -I${SYSROOT}/include -I${SYSROOT}/local/include"
	cmake_findrootpath="${SYSROOT}/${arch} ${SYSROOT}/lib/gcc${cross}/${arch}/${ltsdir} ${dir_install}"
}

toolchain_linux(){
	$host_cross && cross="-cross"
	ltsdir=$(gcc -dumpversion)
	if $use_clang; then
		SYSROOT="/usr/${arch}"
		TOOLCHAIN="${SYSROOT}/bin"
		CROSS_PREFIX="llvm-"
		CC="${TOOLCHAIN}/clang"     
		#CC="clang -target ${arch}" # -fuse-ld=lld"
		CXX="${TOOLCHAIN}/clang++"  
		#CXX="clang++ -target ${arch}" # -fuse-ld=lld"++
		AS="${CC}"
		LD="${TOOLCHAIN}/ld.lld" # --sysroot=${SYSROOT}"+
		#$build_static && LDFLAGS+=" -static"
		GNU_CLANG_VERSION_FULL="$(clang -dumpversion)"
		GNU_CLANG_VERSION_MAJOR=${GNU_CLANG_VERSION_FULL%%\.*}
		CPPFLAGS="-I$/usr/lib/clang/${GNU_CLANG_VERSION_MAJOR}/include ${CPPFLAGS}"
		LT_SYS_LIBRARY_PATH="/usr/lib/llvm-${GNU_CLANG_VERSION_MAJOR}/lib"
	else
		SYSROOT="/usr/${arch}"
		TOOLCHAIN="/usr/bin"
		CROSS_PREFIX="${TOOLCHAIN}/${arch}-"
		CC="${CROSS_PREFIX}gcc"
		CXX="${CROSS_PREFIX}g++"
		AS="${CROSS_PREFIX}as"
		LD="${CROSS_PREFIX}ld"
		LT_SYS_LIBRARY_PATH="/usr/lib/gcc${cross}/${arch}/${ltsdir}"
	fi
	ASM_NASM=nasm
	LDFLAGS="-L${SYSROOT}/lib -L${LT_SYS_LIBRARY_PATH} ${LDFLAGS}"
	CPPFLAGS=" -I${SYSROOT}/include -I${SYSROOT}/local/include ${CPPFLAGS}"
	cmake_findrootpath="${SYSROOT} ${LT_SYS_LIBRARY_PATH} ${dir_install}"
}

loadToolchain(){

	CMAKE_EXECUTABLE=cmake
	YASM=yasm
	PKG_CONFIG=pkg-config

	#reset flags

	CPPFLAGS+=" -I${dir_install_include}"
	LDFLAGS="-L${dir_install_lib}"
	cmake_system_processor="${target_trip[0]}${target_trip[1]}"

	if $host_cross; then
		case $PLATFORM in
			Android) toolchain_android;;
			Windows) toolchain_llvm_mingw;;
			Linux)   toolchain_linux;;
		esac
	else
		TOOLCHAIN=/usr/bin
		SYSROOT=/usr
		if $use_clang; then
			CROSS_PREFIX=llvm-
			CC=clang CXX=clang++ AS=${CC} LD=ld.lld
			$host_native && CPPFLAGS="-mtune=native ${CPPFLAGS}"
		else
		CROSS_PREFIX=
		CC=gcc CXX=g++ AS=as LD=ld
		$host_native && CPPFLAGS="-march=native ${CPPFLAGS}"
		fi
	fi

	AR=${CROSS_PREFIX}ar
	NM=${CROSS_PREFIX}nm

	ADDR2LINE=${CROSS_PREFIX}addr2line
	OBJCOPY=${CROSS_PREFIX}objcopy
	OBJDUMP=${CROSS_PREFIX}objdump
	RANLIB=${CROSS_PREFIX}ranlib
	READELF=${CROSS_PREFIX}readelf
	SIZE=${CROSS_PREFIX}size
	STRINGS=${CROSS_PREFIX}strings
	STRIP=${CROSS_PREFIX}strip
	WINDRES=${CROSS_PREFIX}windres
	[ -z ${GCOV+x} ] && GCOV=${CROSS_PREFIX}gcov


	#pushvar_f CFLAGS "-I$SYSROOT/usr/include -I$SYSROOT/usr/local/include"
	#pushvar_f CXXFLAGS "-I$SYSROOT/usr/include -I$SYSROOT/usr/local/include"

	# export
	export CMAKE_EXECUTABLE YASM PKG_CONFIG API \
		PLATFORM TOOLCHAIN SYSROOT CC CXX LD AS \
		ADDR2LINE AR NM OBJCOPY OBJDUMP RANLIB \
		READELF SIZE STRINGS STRIP WINDRES \
		CROSS_PREFIX LT_SYS_LIBRARY_PATH CPPFLAGS LDFLAGS
}

getMinGwVersion(){
	echo $(x86_64-w64-mingw32-gcc --version | head -n1 | grep -Eo "(GCC).+-win32" | sed 's|GCC) \(.*\)-win32|\1|')
}

errUnknownTarget(){
	if [ $arch ];then
		echo -e "\n${CD}${ind}${CR1}unknown target ${arch}${C0}\n" && exit 1
	else
		echo -e "\n${CD}${ind}${CR1}must specify a target${C0}\n" && usage && exit 1
	fi
}

showBanner(){
	if $banner; then
		echo -ne "\n\n${CW}Cross Build scripts ${vsh} for Linux${C0}\n"
		[ -n $(command -v lsb_release) ] && echo -ne "$(lsb_release -sd) "
		if [ -n "$(uname -r | grep 'microsoft')" ];then
			echo -ne "WSL2 "
		elif [ -n "$(uname -r | grep 'Microsoft')" ];then
			echo -ne "WSL "
		fi
		echo -e "$(uname -o) $(uname -m) ${C0} kernel $(uname -r)"
		echo -e "${CW}$(hwinfoCountCoresReadable) $(hwinfoProcessor)${C0}"
	fi
}

skip_options(){
	while [ -n "${1}" ] || [ -n "${1##--*}" ]; do
		case $1 in
		dl|git|src) skip_dl=true;;
		esac
		shift
	done
}

set_target(){
	cpu_id="${1}"
	target_trip=("${2}" "${3}" "${4}" "${5}" "${6}" "${7}" "${8}")
	arch="${2}-${4}-${5}${6}"
	CT0="${9}"
	CT1="${10}"
	CPU=${2}
	ABI=${7}
	EABI=${6}
	set_env
}

set_target_build(){
	target_trip[5]=$(uname -m)
	arch="${target_trip[5]}-${OSTYPE}"
	target_trip[0]=${target_trip[5]}
	if [ "${target_triple[0]::3}" == "arm" ]; then
		target_trip[1]="${target_triple[0]:3}"
		target_trip[0]="${target_triple[0]::3}"
	fi
	arr=(${OSTYPE//-/ })
	target_trip[2]=${arr[0]}
	target_trip[3]=${arr[1]}
	if [ -z "${target_trip[3]##*eabi*}" ] ;then
		local a2=${target_trip[3]%eabi*}
		target_trip[4]=${target_trip[3]#${a2}*}
		target_trip[3]=${a2}
	fi
	set_env
	STRIP=strip
}

set_env(){
	case ${target_trip[0]} in
		aarch64) host_arm=true;  host_arm32=false; host_arm64=true;  host_x86=false; host_x64=false; host_bits=64;;
		arm)     host_arm=true;  host_arm32=true;  host_arm64=true;  host_x86=false; host_x64=false; host_bits=32;;
		i686)    host_arm=false; host_arm32=false; host_arm64=false; host_x86=true;  host_x64=false; host_bits=32;;
		x86_64)  host_arm=false; host_arm32=false; host_arm64=false; host_x86=false; host_x64=true; host_bits=64;;
	esac
	case ${target_trip[3]} in
		android) host_sys=linux;   host_mingw=false; host_os=android; host_ndk=true;	host_gnu=false;	host_clang=true;  PLATFORM="Android"
		dir_install="/usr/${arch}/local"
		;;
		gnu)     host_sys=linux;   host_mingw=false; host_os=gnu;     host_ndk=false;	host_gnu=true;	host_clang=false; PLATFORM="Linux"
		dir_install="${dir_root}/builds/${PLATFORM,,}/${target_trip[5]}"
		;;
		mingw32) host_sys=windows; host_mingw=true;  host_os=mingw32; host_ndk=false;	host_gnu=false;	host_clang=true;  PLATFORM="Windows"
		dir_install="${dir_root}/builds/${PLATFORM,,}/${target_trip[5]}"
		;;
	esac
	#LIBSDIR="$(pwd)/builds/${PLATFORM,,}/${target_trip[5]}"
	export dir_install
	export dir_install_bin="${dir_install}/bin"
	export dir_install_include="${dir_install}/include"
	export dir_install_lib="${dir_install}/lib"
	export dir_install_pc="${dir_install_lib}/pkgconfig"
}

checkForArch(){
	case $1 in
		native)		set_target_build; host_native=true;;

		$aa64 )		set_target '0' 'aarch64' '' 'linux' 'android' '' 'arm64-v8a' '64' $CG3 $CG6;;
		$aa32 )		set_target '1' 'arm' 'v7a' 'linux' 'android' 'eabi' 'armeabi-v7a' '32' $CG2 $CG5;;
		$ax86 )		set_target '2' 'i686' '' 'linux' 'android' '' 'x86' '32' $CG0 $CG1;;
		$ax64 )		set_target '3' 'x86_64' '' 'linux' 'android' '' 'x86_64' '64' $CG0 $CG1;;

		$la64 )		set_target '4' 'aarch64' '' 'linux' 'gnu' '' 'aarch64' '64' $CM4 $CM6;;
		$la32 )		set_target '5' 'arm' '' 'linux' 'gnu' 'eabihf' 'armv7' '32' $CM4 $CM6;;
		$lx86 )		set_target '6' 'i686' '' 'linux' 'gnu' '' 'x86' '32' $CM0 $CM1;;
		$lx64 )		set_target '7' 'x86_64' '' 'linux' 'gnu' '' 'x86_64' '64' $CM0 $CM1;;

		$wa64 )		set_target '8' 'aarch64' '' 'w64' 'mingw32' '' 'arm64' '64' $CC0 $CC1;;
		$wa32 )		set_target '9' 'arm' 'v7' 'w64' 'mingw32' '' 'armv7' '32' $CC0 $CC1;;
		$wx86 )		set_target '10' 'i686' '' 'w64' 'mingw32' '' 'x86' '32' $CB0 $CB1;;
		$wx64 )		set_target '11' 'x86_64' '' 'w64' 'mingw32' '' 'x86_64' '64' $CB0 $CB1;;
	esac
}

usage(){
  printf "\n\n${CW}Usage: ${0} ${CC1}<target> ${CC1}<build-options> ${CB1}<builder-options> ${CM1}<other-options>${C0}\n\n"
  printf "${CC1}target:${CC0}   native|${CC1}[a-android|l-linux|w-windows]${CC2}[a-arm|x-x86]${CC1}[hf-armhf|7-armv7|8-armv8|86-x86|64-x64]\n"
  printf "          ${CC1}eg. aa8, lx64, wa64)\n\n"
  printf "${CC2}build:    --static* --shared | --both\n"
  printf "          --bin*|--no-bin \n\n"
  printf "${CB1}builder:  --api <api> --cmake  --ndkcmake  --ccmake\n"
  printf "          --dist --strip --dirbuild <dir> \n\n"
  printf "${CB1}compiler: --clang*|--gcc --cpus\n"
  printf "          --tune <tune> --mcpu <mcpu> --mtune <mtune> \n\n"
  printf "${CM1}source:   --git --clone --nodev --download|--dl --stable\n"
  printf "          --update --upd-all --refresh --retry --force --clear\n"
  printf "          --patch <add|make|get> --diff --opts\n\n"
  printf "${CM1}control:  --desc --get --list --checkPkg --libName --var <var> \n\n"
  printf "${CM1}other:    --skip --goto \n\n"
  printf "Example targeting android armv8 build shared libs and executable:\n\n\n  ${CW}${0} aa8 --shared --bin --no-strip --no-dist\n\n\n${C0}"
}




# main

test $# -eq 0 && usage && exit 0

aa64='@(aa64|aa8|a*64-*android|android*-a*64|arm*8*android|android*arm*8)'
aa32='@(aa32|aa7|arm-*android*|arm*7*-android*|android*arm*7*)'
ax86='@(a86|ax86|*86-*android|android*86)'
ax64='@(a64|ax64|*64-*android|android*64)'
la64='@(la8|la64|a*64-linux|arm*8*-linux|a*64-linux|a*64-*gnu|arm*8*-*gnu)'
la32='@(la7|lahf|arm*hf|arm-linux*)'
lx86='@(l86|lx86|*86-linux*|linux*32)'
lx64='@(l64|lx64|*64-linux*|linux*64|linux)'
wa64='@(wa8|a*64-w64*|a*64-*mingw*)'
wa32='@(wa7|arm*-w64*|arm*-*mingw*)'
wx86='@(w86|wx86|*86-win*|*86-*mingw*|w*32)'
wx64='@(w64|wx64|*64-win*|*64-*mingw*|windows|win|w*64)'

optVrs='@(--version|--vrs|--ver|-v)'
optDnl='@(--download|--dl|-d)'
optHelp='@(--help|-h)'

while [ $1 ];do
	case $1 in
		
		$optHelp)	showBanner; usage; exit 0;;

		native)		set_target_build; host_native=true;;

		$aa64 )		set_target '0' 'aarch64' '' 'linux' 'android' '' 'arm64-v8a' '64' $CG3 $CG6;;
		$aa32 )		set_target '1' 'arm' 'v7a' 'linux' 'android' 'eabi' 'armeabi-v7a' '32' $CG2 $CG5;;
		$ax86 )		set_target '2' 'i686' '' 'linux' 'android' '' 'x86' '32' $CG0 $CG1;;
		$ax64 )		set_target '3' 'x86_64' '' 'linux' 'android' '' 'x86_64' '64' $CG0 $CG1;;

		$la64 )		set_target '4' 'aarch64' '' 'linux' 'gnu' '' 'aarch64' '64' $CM4 $CM6;;
		$la32 )		set_target '5' 'arm' '' 'linux' 'gnu' 'eabihf' 'armv7' '32' $CM4 $CM6;;
		$lx86 )		set_target '6' 'i686' '' 'linux' 'gnu' '' 'x86' '32' $CM0 $CM1;;
		$lx64 )		set_target '7' 'x86_64' '' 'linux' 'gnu' '' 'x86_64' '64' $CM0 $CM1;;

		$wa64 )		set_target '8' 'aarch64' '' 'w64' 'mingw32' '' 'arm64' '64' $CC0 $CC1;;
		$wa32 )		set_target '9' 'arm' 'v7' 'w64' 'mingw32' '' 'armv7' '32' $CC0 $CC1;;
		$wx86 )		set_target '10' 'i686' '' 'w64' 'mingw32' '' 'x86' '32' $CB0 $CB1;;
		$wx64 )		set_target '11' 'x86_64' '' 'w64' 'mingw32' '' 'x86_64' '64' $CB0 $CB1;;

		--full)    	build_shared=true
					build_static=true
					build_bin=true
					build_dist=true
					dep_build="--full"
					;;

		--break)    shift; set_break $1;;

		$optVrs)	shift; vrs=$1;;

		--bra*)     shift; export bra=$1;;
		--shared)   build_shared=true; build_static=false;;
		--static)   build_static=true; build_shared=false;;
		--both)     build_static=true; build_shared=true;;
		--bin)      build_bin=true;;
		--no-bin)   build_bin=false;;
		--man)      build_man=true;;
		--dist)     build_dist=true;;
		--cpack)    build_cpack=true;;
		--strip)    build_strip=true;;
		--api)      shift; export API=$1;;
		--clang)    use_clang=true;;
		--gcc)      use_clang=false;;
		--tune)     shift; menu_tune $1;;
		--cpus)     loadToolchain; $CC --print-supported-cpus; exit 0;;
		--mcpu)		shift; export CPPFLAGS+=" -mcpu=${1}";;
		--mtune)	shift; export CPPFLAGS+=" -mtune=${1}";;
		--new)      shift; generate_script $@; exit 0;;

		$optDnl)	build_pkgdl=true;;

		--prefix)   shift; dir_install=$1;;
		--stable)   git_stable=true;;
		--diff)     shift; create_diff $@; exit 0;;
		--update)   update=true;;
		--upd-all)  update=true; req_update_deps=true;;
		--opts)     showOpts "$(pwd)/sources/$lib"; exit 0;;
		--checkPkg) checkPkg; exit 0;;
		--libName)  echo "${lib}"; exit 0;;
		--var)      shift; echo "$($1)"; exit 0;;
		--refresh)  update=true;;
		--retry)    retry=true;;
		--force)    [ -f "${dir_install_pc}/${pkg}.pc" ] && rm "${dir_install_pc}/${pkg}.pc" 2>/dev/null;;
		
		--clear)    shift; menu_clear $@; exit 0;;
		--desc )    echo $dsc && exit 0;;
		
		--get)      shift; menu_get $@; exit 0;;
		
		--check)    shift; check_install $@; exit 0;;

		--list)     shift; menu_list $@; exit 0;;

		--patch)    shift;
					case $1 in
						# usage libname.sh --patch a [sources/libname/]path/to/newfile [sources/libname/]path/to/oldfile
						a|add|append)       shift; patch_append $@; exit 0;;
						m|make|e|embed)     shift; patch_embed $1; exit 0;;
						g|get|show)         patch_get; exit 0;;
					esac
					;;

		--skip)     shift; skip_options $@;;

		--goto)     shift; menu_goto $@; exit 0;;

		--git)      shift; menu_git $@; exit 0;;

		--dirbuild) shift; dir_build=$1;;
		--inline)   inline=true;;
		--clone)    only_repo=true;;   
		--cmake)    cfg='cmake';;
		--ndkcmake) ndkcmake=true;;
		--ccmake)   cfg='ccm';;
		--nobanner) banner=false;;
		--nodev)    nodev=true;;
		
		--latest-release) utils_get_latest_release; exit 0;;

		* ) if fn_defined 'extraOpts'; then
				extraOpts $1
			else
				cfg_args+=("${1}")
			fi
			;;
	esac
	shift
done

fn_undef 'extraOpts'

if fn_defined 'compiler_config'; then
	compiler_config
	fn_undef 'compiler_config'
fi

[ -z "${mingw_posix}" ] && mingw_posix=false

# Set default Host

if [ -z "${target_trip}" ];then
	set_target_build
fi

# is cross-compile?
if [ "${build_arch}" == "${arch}" ]; then
	host_cross=false
else
	host_cross=true
fi

loadToolchain

if [ -z "$ISRUNNING" ]; then
	showBanner
	export ISRUNNING=1
fi
if [ -n "${sudo}" ] && ! ${sudo} -n true 2>/dev/null; then
	echo -ne "${CY1}Requesting sudo for tool install " && sudo echo -e "\e[1A\e[2K"
fi

# usage: set_buildtype_key <input> <prefix> <on-val> <off-val>
set_buildtype_key(){
	local arr=(${1//|/ })
	case ${#arr[@]} in
		0) echo "${2}${3} ${2}${4}";;
		1) ;;
	esac
	return 0
}

# check build type and set defaults if no cst0 cst1 csh0 or csh1 value provided
case $cfg in
	cm|ccm|cmake|ccmake) build_system=cmake

		[ -n "$cstk" ] && cst0="-D${cstk}=OFF" cst1="-D${cstk}=ON"
		[ -n "$cshk" ] && csh0="-D${cshk}=OFF" csh1="-D${cshk}=ON"
		
		! $build_shared && [ -z "$cst1" ] && cst1="-DBUILD_SHARED_LIBS=OFF"
		[ -z "$csh1" ] && csh1="-DBUILD_SHARED_LIBS=ON"
		
		$build_static && ! $build_shared && CSH="${cst1} ${csh0}"
		$build_shared && ! $build_static && CSH="${csh1} ${cst0}"
		$build_static && $build_shared && CSH="${cst1} ${csh1}"
		
		[ -n "$cbk" ] && cb0="-D${cbk}=OFF" cb1="-D${cbk}=ON"

		;;
	ab|am|ac|ar|ag|auto*) build_system=automake
		[ -z "$cst0" ] && cst0="--disable-static"
		[ -z "$cst1" ] && cst1="--enable-static"
		[ -z "$csh0" ] && csh0="--disable-shared"
		[ -z "$csh1" ] && csh1="--enable-shared"
		$build_static && ! $build_shared && CSH="${cst1} ${csh0}"
		$build_shared && ! $build_static && CSH="${csh1} ${cst0}"
		$build_static && $build_shared && CSH="${cst1} ${csh1}"
		[ -n "$cbk" ] && {
		case $cbk in
			--enable-*) cb0="${cbk}=0"; cb1="${cbk}=1";;
			able-*) cb0="--dis${cbk}"; cb1="--en${cbk}";;
			with-*) cb0="--without-${cbk:5}"; cb1="--${cbk}";;
			*) cb0="--enable-${cbk}=0" cb1="--enable-${cbk}=1";;
		esac
		}
		;;
	meson) build_system=meson
		test -z "${meson_static}" && meson_static="-Ddefault_library=static"
		$build_static && ! $build_shared && CSH="${meson_static}"
		test -z "${meson_shared}" && meson_shared="-Ddefault_library=shared"
		$build_shared && ! $build_static && CSH="${meson_shared}"
		$build_static && $build_shared && CSH="-Ddefault_library=both"
		;;
	mk|make) build_system=make;;
	other) build_system=other;;
	*) unset build_system;;
esac

if [ -z "${CBN}" ];then
	$build_bin && CBN="${cb1}" || CBN="${cb0}"
fi

# reset presets, we don't need them anymore
unset cst0 cst1 csh0 csh1 cb0 cb1 cstk cshk cbk

: "${MAKE_EXECUTABLE:=make}"

export arch update retry \
build_shared build_static build_bin build_system \
dir_install \
CSH CBN LIBSDIR PLATFORM CPU ABI EABI \
host_arch host_64 host_eabi host_vnd host_arm host_os \
mingw_posix MAKE_EXECUTABLE cmake_includes

main
