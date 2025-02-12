cmake_minimum_required(VERSION 3.15)
project(a)

if (DEFINED SKBUILD_PROJECT_NAME)
  set(LIB_INSTALL_DIR ${SKBUILD_DATA_DIR}/lib)
  set(HEADER_INSTALL_DIR ${SKBUILD_DATA_DIR}/include)
  set(BINDINGS_INSTALL_DIR ${SKBUILD_PROJECT_NAME})
  set(CMAKE_CONFIG_INSTALL_DIR ${SKBUILD_DATA_DIR}/cmake)
else()
  set(LIB_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/lib)
  set(HEADER_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}}/include)
  set(BINDINGS_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/lib})
  set(CMAKE_CONFIG_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}}/cmake)
endif()

# prints out all the variables.
# useful for debugging
# get_cmake_property(VAR_LIST VARIABLES)
# foreach(var ${VAR_LIST})
#   message(STATUS "${var} = ${${var}}")
# endforeach()

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
install(TARGETS a DESTINATION ${LIB_INSTALL_DIR})

# install headers
# these get installed into virtual environment include directory
install(DIRECTORY ${LIBA_HEADERS_INSTALL} DESTINATION ${HEADER_INSTALL_DIR})

pybind11_add_module(_a ${PYA_SOURCES})
target_include_directories(_a PRIVATE ${LIBA_HEADERS})
target_link_libraries(_a PRIVATE a)

# install the bindings in site_packages/project_name
install(TARGETS _a DESTINATION ${BINDINGS_INSTALL_DIR})

# install config.make file into virtual environment cmake directory
# the file is empty, but importing it populates a_DIR, which points to
# the cmake file. from there we can get the headers and libraries
# in adjacent projects
# export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$VIRTUAL_ENV/cmake
install(FILES a-config.cmake DESTINATION ${CMAKE_CONFIG_INSTALL_DIR})
