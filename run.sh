#!/usr/bin/env bash

if [[ -f .bash_colors ]]; then
  source .bash_colors
else
  echo "Please run this script from the top level folder of the project!"
  exit 1
fi 

set -e

root=$(pwd)

br
h1 "CMake Project Template — Automated Build Starting"
br
p "Cleaning output folders..."
exe "rm -rf bin/* include/* lib/*"

printf "${bldgrn}Build Environment Versions:${clr}\n"
printf "${bldylw}   GCC : \n${bldblk}%s${clr}\n" "$(gcc --version)"
printf "${bldylw}   git : ${bldblk}%s${clr}\n" "$(git --version)"
printf "${bldylw} CMake : ${bldblk}%s${clr}\n" "$(cmake --version)"
printf "${bldylw}  Make : ${bldblk}%s${clr}\n" "$(make -version)"

exe "git submodule update --init --recursive"
exe "mkdir -p build/run && cd build/run"

printf ${clr}
exe "cmake ../.. && make -j 12 && make install | egrep -v 'gmock|gtest'"

cd ${root}

[[ -f bin/divider_tests ]] || {
    printf "${bldred}Can't find installed executable ${bldylw}bin/divider_tests.${clr}\n"
    exit 1
}

exe bin/divider_tests
exe bin/divider 11 7

