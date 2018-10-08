cmake_minimum_required(VERSION 3.2)
project(division C CXX)

set(SOURCE_FILES
    division.h
    division.cpp
)

add_library(division SHARED STATIC ${SOURCE_FILES})

install(TARGETS division DESTINATION ${DIVISIBLE_INSTALL_LIB_DIR})
install(FILES division.h DESTINATION ${DIVISIBLE_INSTALL_INCLUDE_DIR})
