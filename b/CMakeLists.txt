cmake_minimum_required(VERSION 3.10)
project(b)

find_package(a CONFIG REQUIRED)

get_cmake_property(VAR_LIST VARIABLES)
foreach(var ${VAR_LIST})
  message(STATUS "${var} = ${${var}}")
endforeach()

set(CMAKE_CXX_STANDARD 17)

set(EXECB_SOURCES b.cpp)

add_executable(b ${EXECB_SOURCES})
target_link_libraries(b PRIVATE ${a_DIR}/../lib/liba.so)
target_include_directories(b PRIVATE ${a_DIR}/../include)
