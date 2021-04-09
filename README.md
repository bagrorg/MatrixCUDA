# MatrixCUDA

This is a little example of how I see implementation of matrix operations in Kotlin using CUDA and JNI.
## Explanation
In this project I implemented `add` function for vectors. 
 - `VectorOperations` is an interface that holds matrix/vector operations.
 - `GPUMatrixOperations` is an object that appeals to `JniMatrixOperations`. `JniMatrixOperations` contains external fun, that will use C++ code with JNI.
 After Kotlin explanation follows C++ code.
 - `matrix.cpp` implements `add` function from `JniMatrixOperations`. It appeals to CUDA code.
 - `add` function, that calls in `matrix.cpp`, is an intermediary between C++ code and CUDA code. `add` function allocating memory on the device and calls `kernelAdd` function which performed on a device.
 
 ## Build
 Now build has bad implementation. First you need run `cmake .` in `src/main/cpp` folder. Notice that CMake uses your PATH variables in environment settings. You need `CUDA Toolkit` and `JDK installed`.
 Now it is not automated (will be in next updates). After you compiled cpp/cuda code, CMake creates `.so/.dll` library that will be laoded in JVM for `JniMatrixOperations`.
 After this manipulations you will be able to build Kotlin code as usual and run it.
