project(cuda_gtest_plugin_examples)
cmake_minimum_required(VERSION 2.8)

set( CUDA_ARCH "sm_35" CACHE STRING "CUDA architecture to compile for" )
set( GTEST_HOME $ENV{GTEST_HOME} CACHE FILEPATH "Path to gtest root directory (assumes libgtest.a is placed in $GTEST_HOME/build)" )

if( GTEST_HOME STREQUAL "" )
    include( googletest.cmake )
else()
    include_directories( ${GTEST_HOME}/googletest/include/gtest )
    link_directories( ${GTEST_HOME}/build )
endif()

find_package(CUDA)

add_executable( cuda_gtest_example_host main.cc example_gtest_plugin_host.cc )
target_link_libraries(cuda_gtest_example_host pthread)
target_link_libraries(cuda_gtest_example_host libgtest.a)

set( CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS} -arch=${CUDA_ARCH}" )
 
cuda_add_executable( cuda_gtest_example_cuda main.cc example_gtest_plugin.cu)
target_link_libraries(cuda_gtest_example_cuda pthread)
target_link_libraries(cuda_gtest_example_cuda libgtest.a)

