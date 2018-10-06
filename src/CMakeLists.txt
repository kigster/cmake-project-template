cmake_minimum_required(VERSION 3.2)
project(divider)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -O3")

add_subdirectory(division)

set(SOURCE_FILES main.cpp)

add_executable(divider ${SOURCE_FILES})
target_link_libraries(divider division)
install(TARGETS divider DESTINATION bin)
