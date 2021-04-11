# MatrixCUDA

This is a little example of how I see implementation of matrix operations in Kotlin using CUDA and JNI.
## Explanation
In this project I implemented `add` and `sum` function for vectors. 
 - `VectorOperations` is an interface that holds matrix/vector operations.
 - `GPUMatrixOperations` is an object that appeals to `JniMatrixOperations`. `JniMatrixOperations` contains external funcs, that will use C++ code with JNI.
 After Kotlin explanation follows C++ code.
 - `matrix.cpp` implements `add` function from `JniMatrixOperations`. It appeals to CUDA code.
 - `add` function, that calls in `matrix.cpp`, is an intermediary between C++ code and CUDA code. `add` function allocating memory on the device and calls `kernelAdd` function which performed on a device.
 - similarly with `sum` function
 ## About CUDA
 In CUDA code you can see `WARP_SIZE` and `WORK_GROUP_SIZE` defines. I set `WARP_SIZE` to 32 because most if not all Nvidia cards have warp size equal to 32.
 128 for group size because a lot of experiments shows that it is a good constant for this parameter. Maybe it can be upgraded.
 ## Build
 In this version I have bad build system. I see build for this project like this: inside Gradle build I have a task to build CMake in `src/main/cpp`. After this, CMake compile a `.dll/.so` file in some directory and give this path information for Gradle. At the end, Gradle give information about library location into args of main (or somehow in another way) and main will give this information to `GPUMatrixOperations` which will set this path to `JniMatrixOperations`.
 Now it is not like this. Firstly, you will need to start CMake build by yourself. Notice that CMake will require JNI and CUDA installed on your computer (it must be set in environment PATH constants). CMake creates `.so/.dll` library that will be laoded in JVM for `JniMatrixOperations`, so you need to add to args of main at the first position your location of `.so/.dll` file.
 After this manipulations you will be able to build Kotlin code as usual and run it.
