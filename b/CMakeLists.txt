cmake_minimum_required(VERSION 3.10)
project(b)

find_package(a CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 17)

set(EXECB_SOURCES b.cpp)

add_executable(b ${EXECB_SOURCES})
target_link_libraries(b PRIVATE a)

