cmake_minimum_required(VERSION 3.2)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

set(DIVISIBLE_INCLUDE_DIR ${PROJECT_SOURCE_DIR}/src/divisible)

add_subdirectory(src)
add_subdirectory(test)


