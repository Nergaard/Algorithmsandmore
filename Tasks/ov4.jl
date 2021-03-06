function counting_sort_letters(A, position)
    #Finding the largest number in the list
    K = []
    for i = 1 : length(A)
        stringy = A[i]
        numby = []
        for t = 1 : length(stringy)
            append!(numby, (Int64(stringy[t])-(Int64('a'))+1))
        end
        append!(K, [numby])
    end

    currentmax = K[1][position]
    for i = 0 : length(K)-1
        i += 1
        if currentmax < K[i][position]
            currentmax = K[i][position]
        end
    end

    #Creating an empty array with as many indecies as the length of the list
    emptyarray = []
    for i = 1 : currentmax
        append!(emptyarray, 0)
    end

    #Counting how many occurences there is of each number up to the largest number
    for i = 1 : length(K)
        emptyarray[K[i][position]]+=1
        i += 1
    end
    countarray = emptyarray

    for i = 2 : length(countarray)
        countarray[i] = countarray[i] + countarray[i-1]
    end

    B = []
    j = length(K)
    for i = 1 : j
        append!(B, " ")
    end
    while j > 0
        B[countarray[K[j][position]]] = K[j]
        countarray[K[j][position]] -= 1
        j -= 1
    end

    S = []
    stringy = ""
    for i = 1 : length(B)
        numby = B[i]
        stringy = ""
        cornum = 0
        for t = 1 : length(numby)
            cornum = numby[t] +96
            stringy *= Char(cornum)
        end
        append!(S, [stringy])
    end
    return S
end



A = ["ccc","cba","ca","ab","abc","azb"]

print(counting_sort_letters(A, 2))
