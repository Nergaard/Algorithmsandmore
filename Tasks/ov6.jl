function cumulative(weights)
    rows, cols = size(weights)
    for i = 1 : rows -1
        for j = 1 : cols
            candidates = []
            if j > 1
                append!(candidates, weights[i,j-1])
            end
            if j< rows-1
                append!(candidates, weights[i, j+1])
            end
            append!(candidates, weights[i, j])
            algdat_sort!(candidates)
            weights[i+1, j] = minimum(candidates) + weights[i+1, j]
        end
    end
    return weights
end

matrix =[3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9;
           6  1  7 3 9]


cumulative(matrix)
