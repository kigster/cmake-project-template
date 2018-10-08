#!/usr/bin/env bash
#
# © 2018 Konstantin Gredeskoul, All Rights Reserved.
# MIT License
#
# WARNING: This BASH script is completely optional. You don't need it to build this project.
#
# If you choose to run this script to build the project, run:
#
#     $ ./run.sh
#
# It will clean, build and run the tests.
#
#

( [[ -n ${ZSH_EVAL_CONTEXT} && ${ZSH_EVAL_CONTEXT} =~ :file$ ]] || \
  [[ -n $BASH_VERSION && $0 != "$BASH_SOURCE" ]]) && _s_=1 || _s_=0

export _s_
export ProjectRoot=$(pwd)
export BuildDir="${ProjectRoot}/build/run"
export BashLibRoot="${ProjectRoot}/.bash"
export LibBashRepo="https://github.com/kigster/lib-bash"

# We are using an awesome BASH library `lib-bash` for prettifying the output, and
# running commands through their LibRun framework.
divider::lib-bash() {
  [[ ! -d ${BashLibRoot} ]] && git clone ${LibBashRepo} ${BashLibRoot} 1>/dev/null
  if [[ -f ${BashLibRoot}/lib/Loader.bash ]]; then
    cd ${BashLibRoot}
    [[ -f lib/Loader.bash ]] && source lib/Loader.bash
    cd ${ProjectRoot}
  else
    printf "\nERROR: unable to find lib-bash library from ${LibBashRepo}!\n"
    exit 1
  fi

  export LibRun__ShowCommandOutput__Default=${False}
  export LibRun__AbortOnError__Default=${True}
}

divider::header() {
  h1::purple "Fractional Division With Remainder: A CMake Project Template with Tests"
  local OIFC=${IFC}
  IFS="|" read -r -a gcc_info <<< "$(gcc --version 2>&1 | tr '\n' '|')"
  export IFC=${OIFC}
  h1 "${bldylw}GCC" "${gcc_info[1]}" "${gcc_info[2]}" "${gcc_info[3]}" "${gcc_info[4]}"
  h1 "${bldylw}GIT:    ${bldblu}$(git --version)"
  h1 "${bldylw}CMAKE:  ${bldblu}$(cmake --version | tr '\n' ' ')"
}

divider::setup() {
  hl::subtle "Creating Build Folder..."
  run "mkdir -p build/run"
}

divider::clean() {
  hl::subtle "Cleaning output folders..."
  run 'rm -rf bin/* include/* lib/*'
}

divider::build() {
  run "cd build/run"
  run "cmake ../.. "
  run "make -j 12"
  run "make install | egrep -v 'gmock|gtest'"
  run "cd ${ProjectRoot}"
}

divider::tests() {
  if [[ -f bin/divider_tests ]]; then
    export LibRun__ShowCommandOutput=${True}
    run "bin/divider_tests"
  else
    printf "${bldred}Can't find installed executable ${bldylw}bin/divider_tests.${clr}\n"
    exit 2
  fi
}

divider::examples() {
  [[ ! -f bin/divider ]] && {
    error "You don't have the cmpiled binary yet".
    exit 3
  }

  export LibRun__ShowCommandOutput=${True}
  export LibRun__ShowCommandOutput__Default=${True}
  hr
  run "bin/divider 11 7"
  hr
  run "bin/divider 1298798375 94759o387"
  hr
  run "bin/divider 78 17"
  hr

}

main() {
  divider::lib-bash
  divider::header
  divider::setup
  divider::build
  divider::tests
  divider::examples
}

(( $_s_ )) || main
