using Printf


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
    convolution = sum(conv_matrix, dims=1)
    return convolution  # Find sum of columns
end


function matrixMultiply(matrix1, matrix2)

end

convolve([1,5,0,3],[5,-3,-2,5])
