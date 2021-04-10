#include "com_example_bagrorg_JniMatrixOperations.h"
#include <iostream>
#include <stdexcept>
#include "kernelCUDA/kernel.cuh"

JNIEXPORT void JNICALL Java_com_example_bagrorg_JniMatrixOperations_add (JNIEnv *env, jobject obj, jintArray dest, jintArray src1, jintArray src2) {
    int *dst = (int *) env->GetPrimitiveArrayCritical(dest, NULL);
    int *s1 = (int *) env->GetPrimitiveArrayCritical(src1, NULL);
    int *s2 = (int *) env->GetPrimitiveArrayCritical(src2, NULL);

    int n = env->GetArrayLength(src1);


    add(dst, s1, s2, n);

    env->ReleasePrimitiveArrayCritical(dest, dst, 0);
    env->ReleasePrimitiveArrayCritical(src1, s1, 0);
    env->ReleasePrimitiveArrayCritical(src2, s2, 0);
}

JNIEXPORT jint JNICALL Java_com_example_bagrorg_JniMatrixOperations_sum (JNIEnv *env, jobject obj, jintArray src) {
    int *s = (int *) env->GetPrimitiveArrayCritical(src, NULL);
    int n = env->GetArrayLength(src);
    int d = 0;

    sum(&d, s, n);

    env->ReleasePrimitiveArrayCritical(src, s, 0);

    return d;
}