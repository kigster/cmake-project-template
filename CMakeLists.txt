cmake_minimum_required(VERSION 3.7)
project(cmake-tutorial)

set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES main.cpp)
add_executable(cmake-tutorial ${SOURCE_FILES})
