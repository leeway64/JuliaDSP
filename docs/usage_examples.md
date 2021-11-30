# Usage Examples

To use JuliaDSP, make sure to include the following lines at the top of the file:

```julia
include("../scripts/JuliaDSP.jl")
using .JuliaDSP
```

## Convolution

```julia
a1 = [1, 5, 0, 3]
a2 = [5, -3, -2, 5]
println(JuliaDSP.convolve(a1, a2))
```

Which prints out:

```julia
[5 22 -17 10 16 -6 15]
```

## Matrix Multiplication

```julia
m1 = [1 2 3; 4 5 6]
m2 = [7 8; 9 10; 11 12]
println(JuliaDSP.matrixMultiply(m1, m2))
```

Which results in:

```julia
[58 64; 139 154]
```
