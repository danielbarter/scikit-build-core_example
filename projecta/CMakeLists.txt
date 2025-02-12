cmake_minimum_required(VERSION 3.10)
project(a)

set(CMAKE_CXX_STANDARD 17)

find_package(pybind11 CONFIG REQUIRED)

set(LIBA_SOURCES liba/src/a.cxx)
set(PYA_SOURCES pya/pya.cxx)
set(LIBA_HEADERS liba/include)

add_library(liba SHARED ${LIBA_SOURCES})
target_include_directories(liba PRIVATE ${LIBA_HEADERS})

pybind11_add_module(_a ${PYA_SOURCES})
