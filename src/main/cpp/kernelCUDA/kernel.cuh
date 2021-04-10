#ifndef KERNEL_CUH
#define KERNEL_CUH

#define WORK_GROUP_SIZE 128
#define WARP_SIZE 32
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void addKernel(int* c, const int* a, const int* b, size_t arraySize);
__host__ void add(int* dest, const int* src1, const int* src2, size_t arraySize);

__global__ void sumKernel(int* dest, const int* src, size_t arraySize);
__host__ void sum(int* dest, const int* src, size_t arraySize);

#endif