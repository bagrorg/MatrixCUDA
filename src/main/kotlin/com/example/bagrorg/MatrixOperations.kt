package com.example.bagrorg

data class Vector(val n: Int, val vec: IntArray)

interface MatrixOperations {
    fun add(src1: Vector, src2: Vector) : Vector
    fun sum(src : Vector) : Int
}
