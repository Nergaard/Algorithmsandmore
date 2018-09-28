function cumulative(weights)
    rows, cols = size(weights)
    for i = 1 : rows -1
        for j = 1 : cols
            min = weights[i, j]
            if j > 1
                if weights[i,j-1] < min
                    min = weights[i,j-1]
                end
            end
            if j < cols
                if weights[i,j+1] < min
                    min = weights[i, j+1]
                end
            end
            weights[i+1, j] = min + weights[i+1, j]
        end
    end
    return weights
end


function back_track(path_weights)
    startindex = 1
    short_path = []
    rows, cols = size(path_weights)
    min = path_weights[rows,1]
    for j = 2 : cols
        if path_weights[rows,j]< min
            min = path_weights[rows, j]
            startindex = j
        end
    end
    append!(short_path,[tuple(rows, startindex)])
    i = rows -1
    index = [0,0]
    while i> 0
        index[1] = i
        index[2]= startindex
            min = path_weights[i, startindex]
            if startindex -1 > 0
                if path_weights[i, (startindex -1)] <= min
                    min = path_weights[i,(startindex-1)]
                    index[1] = i
                    index[2]= startindex-1
                end
            end
            if startindex + 1< cols+1
                if path_weights[i,(startindex+1)] < min
                    min = path_weights[i, (startindex+1)]
                    index[1] = i
                    index[2]= startindex+1
                end
            end
            startindex = index[2]
            t = tuple(index[1],index[2])
            append!(short_path, [t])
            i -= 1
        end
        return short_path
end




matrix =[3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9;
           6  1  7 3 9]

path_weights = [3  6  8  6  3;
               10 9  11 10 6;
               13 19 13 7  12;
               23 17 10 8  9;
               23 11 15 11 17]


print(cumulative(matrix))
print(back_track(path_weights))
