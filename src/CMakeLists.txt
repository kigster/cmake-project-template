cmake_minimum_required(VERSION 3.2)
project(divisiblelib C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(SOURCE_FILES Divisible.h Divisible.cpp)

add_library(divisiblelib ${SOURCE_FILES})

install(TARGETS divisiblelib DESTINATION lib)
install(FILES Divisible.h DESTINATION include/divisible)
