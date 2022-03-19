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
    for i in 1:length(larger_arr)
        mulitplied_row = smaller_arr * larger_arr[i]
        # Insert the multiplied row into the convolution matrix
        conv_matrix[CartesianIndex.(i, i:length(mulitplied_row)+i-1)] .= mulitplied_row
    end

    convolution = sum(conv_matrix, dims=1)  # Find sum of columns
    return convolution
end


""" Returns the product of 2 matrices.
Pre: The number of columns in matrix1 must equal the number of rows in matrix2 (throws
DimensionMismatch if not).
Post: The resulting matrix will have the same number of rows as matrix1 and the same number of
columns as matrix2.
"""
function matrixMultiply(matrix1, matrix2)
    # Handle the case when 1 matrix is empty and the other has a length of 1, or when both matrices
    # are emtpy.
    if length(matrix1) == 0 && length(matrix2) == 1 ||
            length(matrix1) == 1 && length(matrix2) == 0 ||
            length(matrix1) == 0 && length(matrix2) == 0
        return reshape([], 0, 0)
    elseif size(matrix1, 2) != size(matrix2, 1)
        throw(DimensionMismatch("The number of columns in matrix1 must equal the number of rows in matrix2"))
    end

    resultMatrix = zeros(size(matrix1, 1), size(matrix2, 2))
    for row in 1:size(matrix1, 1)
        for column in 1:size(matrix2, 2)
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
