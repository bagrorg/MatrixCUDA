#include "kernel.cuh"

__global__ void addKernel(int* dest, const int* src1, const int* src2, size_t n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
        dest[i] = src1[i] + src2[i];
}

__host__ void add(int* dest, const int* src1, const int* src2, size_t arraySize) {
        int *device_a, *device_b, *device_c;

        cudaMalloc((void **) &device_a, arraySize * sizeof(int));
        cudaMalloc((void **) &device_b, arraySize * sizeof(int));
        cudaMalloc((void **) &device_c, arraySize * sizeof(int));
    
    
        cudaMemcpy(device_a, src1, arraySize * sizeof(int), cudaMemcpyHostToDevice);
        cudaMemcpy(device_b, src2, arraySize * sizeof(int), cudaMemcpyHostToDevice);
    
        addKernel<<<(arraySize + 127) / 128, 128>>>(device_c, device_a, device_b, arraySize);
    
        cudaMemcpy(dest, device_c, arraySize * sizeof(int), cudaMemcpyDeviceToHost);
 
        cudaFree(device_a);
        cudaFree(device_b);
        cudaFree(device_c);
}
