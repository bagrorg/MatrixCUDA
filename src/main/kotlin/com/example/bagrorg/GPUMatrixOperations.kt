package com.example.bagrorg

import java.lang.RuntimeException

object GPUMatrixOperations : MatrixOperations {
    fun setLib(path: String) {
        JniMatrixOperations.libPath = path
        JniMatrixOperations.load()
    }

    override fun add(src1: Vector, src2: Vector) : Vector {
        if (src1.n != src2.n) throw RuntimeException("Inappropriate vector sizes")

        var dest = Vector(src1.n, IntArray(src1.n) { 0 })
        JniMatrixOperations.add(dest.vec, src1.vec, src2.vec)

        return dest
    }

    override fun sum(src: Vector) = JniMatrixOperations.sum(src.vec)
}