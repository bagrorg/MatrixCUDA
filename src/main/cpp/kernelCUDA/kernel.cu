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
    
        addKernel<<<(arraySize + WORK_GROUP_SIZE - 1) / WORK_GROUP_SIZE, WORK_GROUP_SIZE>>>(device_c, device_a, device_b, arraySize);
    
        cudaMemcpy(dest, device_c, arraySize * sizeof(int), cudaMemcpyDeviceToHost);
 
        cudaFree(device_a);
        cudaFree(device_b);
        cudaFree(device_c);
}

__global__ void sumKernel(long int* dest, const int* src, size_t arraySize) {
        int globInd = blockIdx.x * blockDim.x + threadIdx.x;
        int localInd = threadIdx.x;
        __local__ int* localPart[WORK_GROUP_SIZE];

        if (globInd >= n) localPart[localInd] = 0;
        else localPart[localInd] = src[globInd];

        for (unsigned int length = WORK_GROUP_SIZE / 2; len > 0; len /= 2) {
            if (localInd < len) localPart[localInd] = localPart[localInd] + localPart[localInd + len];
            if (len > WARP_SIZE)  __syncthreads();
            else if (localInd >= len) return;
        }

        if (localInd == 0) *dest += localPart[0];
}

__host__ void sum(long int* dest, const int* src, size_t arraySize) {
        int *device_arr;
        long int *res;
        cudaMalloc((void **) &device_arr, arraySize * sizeof(int));
        cudaMalloc((void **) &res, sizeof(long int));

        cudaMemcpy(device_arr, src, arraySize * sizeof(int), cudaMemcpyHostToDevice);
        cudaMemcpy(res, dest, sizeof(long int), cudaMemcpyHostToDevice);

        sumKernel<<<(arraySize + WORK_GROUP_SIZE - 1) / WORK_GROUP_SIZE, WORK_GROUP_SIZE>>>(res, device_arr, arraySize);

        cudaMemcpy(dest, res, sizeof(long int), cudaMemcpyDeviceToHost);

        cudaFree(device_arr);
        cudaFree(res);
}