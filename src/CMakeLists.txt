cmake_minimum_required(VERSION 3.2)
project(divis)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set(SOURCE_FILES main.cpp)

add_subdirectory(divisible)
include_directories(include)
include_directories(divisible)

add_executable(divis ${SOURCE_FILES})
target_link_libraries(divis divisible)

install(TARGETS divis DESTINATION bin)

