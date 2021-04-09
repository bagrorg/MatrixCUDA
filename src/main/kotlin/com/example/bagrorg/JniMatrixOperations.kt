package com.example.bagrorg

object JniMatrixOperations {
    init {
        System.load("../cpp/cmake-build-debug/libmatrix.so")
    }
    external fun add(dest: IntArray, src1: IntArray, src2 : IntArray)
}