package com.example.bagrorg

object JniMatrixOperations {
    init {
        System.load("H:\\Tmp\\MatrixCUDA\\src\\main\\cpp\\build\\Debug\\matrix.dll")
    }
    external fun add(dest: IntArray, src1: IntArray, src2 : IntArray)
    external fun sum(src : IntArray) : Int
}
