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

br

printf "${bldgrn}Build Environment Versions:${clr}\n"
printf "   GCC : \n\n${bldylw}%s${clr}\n" "$(gcc --version)"
printf "   git : ${bldblu}%s${clr}\n" "$(git --version)"
printf " CMake : ${bldred}%s${clr}\n" "$(cmake --version)"

printf ${bldgrn}
exe "git submodule update --init --recursive"

exe "mkdir -p build && cd build"
printf ${bldblu}
cmake .. && make -j 12 && make install | egrep -v 'gmock|gtest'

cd ${root}

[[ -f bin/divider_tests ]] || {
    printf "${bldred}Can't find installed executable ${bldylw}bin/divider_tests.${clr}\n"
    exit 1
}

exe bin/divider_tests




