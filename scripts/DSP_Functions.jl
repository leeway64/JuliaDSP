""" Returns the convolution of 2 arrays, arr1 and arr2
Pre: arr1 and arr2 must not be empty.
"""
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


""" Returns the product of 2 matrices.
Pre: The number of columns in matrix1 must equal the number of rows in matrix2.
Post: The resulting matrix will have the same number of rows as matrix1 and the same number of
columns as matrix2.
"""
function matrixMultiply(matrix1, matrix2)
    matrix1Size = size(matrix1)
    matrix2Size = size(matrix2)

    if matrix1Size[2] != matrix2Size[1]
        throw(DimensionMismatch("The number of columns in matrix1 must equal the number of rows in matrix2"))
    end

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


#  Returns the dot product of array1 and array2
function dotProduct(array1, array2)
    return array1 .* array2
end


""""""
function DFT(array)

end


""""""
function IDFT(array)
    
end


# println("fsdfdsf")
# println(convolve([1],[1]))
m1 = [1 2 3; 4 5 6]
m2 = [7 8; 9 10; 11 12]
matrixMultiply(m1, m2)