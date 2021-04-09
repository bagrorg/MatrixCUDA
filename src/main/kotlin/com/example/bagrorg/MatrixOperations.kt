package com.example.bagrorg

data class Vector(val n: Int, val vec: IntArray)


interface VectorOperations {
    fun add(dest : Vector, src1 : Vector, src2 : Vector)
}