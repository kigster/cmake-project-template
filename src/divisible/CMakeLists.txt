cmake_minimum_required(VERSION 3.2)
project(divisible C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(SOURCE_FILES divisible.h divisible.cpp)

add_library(divisible SHARED STATIC ${SOURCE_FILES})

install(TARGETS divisible DESTINATION lib)
install(FILES divisible.h DESTINATION include/divisible)
