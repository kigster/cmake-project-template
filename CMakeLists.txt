cmake_minimum_required(VERSION 3.2)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
project(divisible)

set(SOURCE_FILES main.cpp)
set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

add_subdirectory(src)
include_directories(include)

add_executable(divisible ${SOURCE_FILES})
target_link_libraries(divisible divisiblelib)

install(TARGETS divisible DESTINATION bin)

