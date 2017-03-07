cmake_minimum_required(VERSION 2.8)
enable_testing()

find_package(Threads REQUIRED)

include(ExternalProject)

ExternalProject_Add(
    googletest
    URL https://github.com/google/googletest/archive/release-1.8.0.zip
    PREFIX googletest 
    CMAKE_ARGS 
        -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_C_COMPILER_ARG1=${CMAKE_C_COMPILER_ARG1}
        -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER} -DCMAKE_CXX_COMPILER_ARG1=${CMAKE_CXX_COMPILER_ARG1}
    INSTALL_COMMAND ""
)

link_directories( ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest-build/googlemock/gtest )

add_library(gtest IMPORTED STATIC GLOBAL)
add_library(gtest_main IMPORTED STATIC GLOBAL)
add_dependencies(gtest googletest)
add_dependencies(gtest_main googletest)

include_directories("${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/include")

