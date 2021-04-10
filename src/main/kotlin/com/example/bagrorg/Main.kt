package com.example.bagrorg

fun main() {
    var vector = Vector(5000, IntArray(5000){ 0 })
    var vector2 = Vector(5000, IntArray(5000){ it + 1 })
    var vector3 = Vector(5000, IntArray(5000){ it + 1 })
    GPUMatrixOperations.add(vector2, vector3)
    println(vector)

    val summ = GPUMatrixOperations.sum(vector)
    println(vector)
}