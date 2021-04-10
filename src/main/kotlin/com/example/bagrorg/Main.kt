package com.example.bagrorg

fun main() {
    var vector = Vector(5, IntArray(5){ 0 })
    var vector2 = Vector(5, IntArray(5){ it + 1 })
    var vector3 = Vector(5, IntArray(5){ it + 1 })
    GPUMatrixOperations.add(vector2, vector3)
    println(vector)
}