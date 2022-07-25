using Test

include("../src/LWJuliaDSP.jl")
using .LWJuliaDSP


@testset "Convolution" begin
    a1 = [1, 5, 0, 3]
    a2 = [5, -3, -2, 5]
    a3 = [100, 200]

    @testset "Arrays of length 1" begin
        @test LWJuliaDSP.convolve([1], [1]) == reshape([1], 1, 1)
        @test LWJuliaDSP.convolve([100], [13]) == reshape([1300], 1, 1)
        @test LWJuliaDSP.convolve([90], [100]) == reshape([9000], 1, 1)
    end
    
    @testset "Commutative property" begin
        @test LWJuliaDSP.convolve(a1, a2) == [5 22 -17 10 16 -6 15]
        @test LWJuliaDSP.convolve(a2, a1) == [5 22 -17 10 16 -6 15]        
    end

    @testset "Arrays are different sizes" begin
        @test LWJuliaDSP.convolve([1, 8, 6], [78]) == [78 624 468]
        @test LWJuliaDSP.convolve([1, 2], [1, 2, 3]) == [1 4 7 6]
        @test LWJuliaDSP.convolve(a1, a3) == [100  700 1000 300 600]
    end
end


@testset "Matrix multiplication" begin
    m1 = [1 2 3; 4 5 6]
    m2 = [7 8; 9 10; 11 12]
    m3 = [11 12; 4 5]
    m4 = [12 13; 1000 1000]

    @testset "0 case" begin
        @test LWJuliaDSP.matrixMultiply([], []) == reshape([], 0, 0)
        @test LWJuliaDSP.matrixMultiply([88], []) == reshape([], 0, 0)
        @test LWJuliaDSP.matrixMultiply([], [4]) == reshape([], 0, 0)
    end

    @testset "1 case" begin
        @test LWJuliaDSP.matrixMultiply([1], [3]) == reshape([3], 1, 1)
        @test LWJuliaDSP.matrixMultiply([45], [3]) == reshape([135], 1, 1)
        @test LWJuliaDSP.matrixMultiply([100], [100]) == reshape([10000], 1, 1)

    end

    @testset "Matrices are both square and the same size" begin
        @test LWJuliaDSP.matrixMultiply(m3, m4) == [12132 12143; 5048 5052]
    end

    @testset "Matrices are different sizes" begin
        @test LWJuliaDSP.matrixMultiply(m1, m2) == [58 64; 139 154]
    end
end
