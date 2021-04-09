package com.example.bagrorg

object GPUMatrixOperations : VectorOperations {
    override fun add(dest: Vector, src1: Vector, src2 : Vector) = JniMatrixOperations.add(dest.vec, src1.vec, src2.vec)
}