#include "com_example_bagrorg_JniMatrixOperations.h"
#include <iostream>
#include <stdexcept>
#include "kernelCUDA/kernel.cuh"

JNIEXPORT void JNICALL Java_com_example_bagrorg_JniMatrixOperations_add(JNIEnv *env, jobject obj, jintArray dest, jintArray src1, jintArray src2) {
    int *dst = (int *) env->GetPrimitiveArrayCritical(dest, NULL);
    int *s1 = (int *) env->GetPrimitiveArrayCritical(src1, NULL);
    int *s2 = (int *) env->GetPrimitiveArrayCritical(src2, NULL);

    int n1 = env->GetArrayLength(src1);
    int n2 = env->GetArrayLength(src2);
    if (n1 != n2) throw std::runtime_error("arrays have different sizes");

    add(dst, s1, s2, n1);

    env->ReleasePrimitiveArrayCritical(dest, dst, 0);
    env->ReleasePrimitiveArrayCritical(src1, s1, 0);
    env->ReleasePrimitiveArrayCritical(src2, s2, 0);
}
