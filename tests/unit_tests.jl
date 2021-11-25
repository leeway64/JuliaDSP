using Test
using .JuliaDSP


@testset "Convolution" begin
    a1 = [1, 5, 0, 3]
    a2 = [5, -3, -2, 5]

    @testset "Arrays of length 1" begin
        @test convolve([1.0], [1.0]) == [1.0]
    end
    
    @testset "Commutative property" begin
        @test convolve(a1, a2) == [5 22 -17 10 16 -6 15]
        @test convolve(a2, a1) == [5 22 -17 10 16 -6 15]        
    end
end


@testset "Matrix multiplication" begin
    m1 = [1 2 3; 4 5 6]
    m2 = [7 8; 9 10; 11 12]
    
    @testset "0 case" begin
        @test matrixMultiply([], []) == []
    end
    
    @test matrixMultiply(m1, m2) == [58 64; 139 154]
end
