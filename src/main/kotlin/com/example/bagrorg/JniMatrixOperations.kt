package com.example.bagrorg

import java.lang.RuntimeException

object JniMatrixOperations {
    var libPath : String = "NO_PATH"
    fun load() {
        if(libPath == "NO_PATH") throw RuntimeException("No lib path")
        System.load(libPath)
    }
    external fun add(dest: IntArray, src1: IntArray, src2 : IntArray)
    external fun sum(src : IntArray) : Int
}