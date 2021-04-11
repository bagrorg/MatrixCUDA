package com.example.bagrorg

fun main(args: Array<String>) {
    if(args.isNotEmpty()) GPUMatrixOperations.setLib(args[0])

    var vector : Vector
    var vector2 = Vector(5000, IntArray(5000){ it + 1 })
    var vector3 = Vector(5000, IntArray(5000){ it + 1 })


    vector = GPUMatrixOperations.add(vector2, vector3)
    println(vector)

    val summ = GPUMatrixOperations.sum(vector)
    println(summ)
}