function counting_sort_letters(K, P)
    #Finding the largest number in the list
    A = []
    for i = 1 : length(K)
        stringy = K[i]
        numby = []
        for t = 1 : length(stringy)
            append!(numby, (Int64(stringy[t])-(Int64('a'))+1))
        end
        append!(A, [numby])
    end
    return A



    currentmax = A[1][P]
    for i = 0 : length(A)-1
        i += 1
        if currentmax < A[i][P]
            currentmax = A[i][P]
        end
    end

    #Creating an empty array with as many indecies as the largest number
    emptyarray = []
    for i = 1 : currentmax
        append!(emptyarray, 0)
    end

    #Counting how many occurences there is of each number up to the largest number
    for i = 1 : length(A)
        emptyarray[A[i][P]]+=1
        i += 1
    end
    countarray = emptyarray

    for i = 2 : length(countarray)
        countarray[i] = countarray[i] + countarray[i-1]
    end

    B = []
    j = length(A)
    for i = 1 : j
        append!(B, " ")
    end
    while j > 0
        B[countarray[A[j]]] = A[j]
        countarray[A[j][P]] -= 1
        j -= 1
    end
end



A = ["ccc","cba","ca","ab","abc"]

print(counting_sort_letters(A, 2))
