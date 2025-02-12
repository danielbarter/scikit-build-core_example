cmake_minimum_required(VERSION 3.15)
project(a)

set(CMAKE_CXX_STANDARD 17)

set(PYBIND11_FINDPYTHON ON)
find_package(Python COMPONENTS Interpreter Development.Module REQUIRED)
find_package(pybind11 CONFIG REQUIRED)

set(LIBA_SOURCES liba/src/a.cxx)
set(PYA_SOURCES pya/pya.cxx)
set(LIBA_HEADERS liba/include)
set(LIBA_HEADERS_INSTALL liba/include/a)

add_library(a SHARED ${LIBA_SOURCES})
target_include_directories(a PRIVATE ${LIBA_HEADERS})

# install shared libraries into virtual environment lib directory
# need to tell python where this is at runtime
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VIRTUAL_ENV/lib
install(TARGETS a DESTINATION ${SKBUILD_DATA_DIR}/lib)

# install headers
# these get installed into virtual environment include directory
install(DIRECTORY ${LIBA_HEADERS_INSTALL} DESTINATION ${SKBUILD_DATA_DIR}/include)

pybind11_add_module(_a ${PYA_SOURCES})
target_include_directories(_a PRIVATE ${LIBA_HEADERS})
target_link_libraries(_a PRIVATE a)

# install the bindings in site_packages/project_name
install(TARGETS _a DESTINATION ${SKBUILD_PROJECT_NAME})

# install config.make file into virtual environment cmake directory
# the file is empty, but importing it populates a_DIR, which points to
# the cmake file. from there we can get the headers and libraries
# in adjacent projects
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$VIRTUAL_ENV/cmake
install(FILES a-config.cmake DESTINATION ${SKBUILD_DATA_DIR}/cmake)
