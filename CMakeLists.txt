cmake_minimum_required(VERSION 3.2)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
project(divis)

set(SOURCE_FILES main.cpp)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

add_subdirectory(src)
include_directories(include)
include_directories(src)

add_executable(divis ${SOURCE_FILES})
target_link_libraries(divis divisible)

install(TARGETS divis DESTINATION bin)

