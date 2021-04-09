cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(jnitest LANGUAGES CXX CUDA)

set(JAVA_AWT_LIBRARY NotNeeded)
set(JAVA_AWT_INCLUDE_PATH NotNeeded)
find_package(JNI REQUIRED)

add_library(matrix SHARED
        matrix.cpp
        kernelCUDA/kernel.cu
        kernelCUDA/kernel.cuh
        )

target_compile_features(matrix PUBLIC cxx_std_11)
set_target_properties( matrix
        PROPERTIES CUDA_SEPARABLE_COMPILATION ON)