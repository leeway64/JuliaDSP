function DFT(array)

end


function IDFT(array)
    
end


function convolve(arr1, arr2)
    if length(arr1) > length(arr2)
        larger_arr = arr1
        smaller_arr = arr2
    else
        larger_arr = arr2
        smaller_arr = arr1  
    end

    number_of_columns = length(arr1) + length(arr2) - 1
    conv_matrix = zeros(length(larger_arr), number_of_columns)
    for i in 1:length(smaller_arr)
        mulitplied_row = smaller_arr * larger_arr[i]
        
        conv_matrix[CartesianIndex.(i, i:length(mulitplied_row)+i-1)] .= mulitplied_row
    end
    convolution = sum(conv_matrix, dims=1)  # Find sum of columns
    return convolution
end


function matrixMultiply(matrix1, matrix2)
    matrix1Size = size(matrix1)
    matrix2Size = size(matrix2)
    resultMatrix = zeros(matrix1Size[1], matrix2Size[2])
    for row in 1:matrix1Size[1]
        for column in 1:matrix2Size[2]
            row1 = matrix1[row, :]
            column2 = matrix2[:, column]
            resultMatrix[row, column] = sum(dotProduct(row1, column2))
        end
    end
    return resultMatrix
end


function dotProduct(array1, array2)
    return array1 .* array2
end


println(convolve([1,5,0,3],[5,-3,-2,5]))


m1 = [1 2 3; 4 5 6]
m2 = [7 8; 9 10; 11 12]
println(matrixMultiply(m1, m2))
