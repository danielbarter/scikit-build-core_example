cmake_minimum_required(VERSION 3.10)
project(a)

set(CMAKE_CXX_STANDARD 17)

set(LIBA_SOURCES liba/src/a.cxx)
set(LIBA_HEADERS liba/include)

add_library(liba SHARED ${LIBA_SOURCES})
target_include_directories(liba PRIVATE ${LIBA_HEADERS})
