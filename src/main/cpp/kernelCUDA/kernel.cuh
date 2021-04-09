#ifndef KERNEL_CUH
#define KERNEL_CUH

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void addKernel(int* c, const int* a, const int* b, size_t arraySize);
__host__ void add(int* dest, const int* src1, const int* src2, size_t arraySize);

#endif