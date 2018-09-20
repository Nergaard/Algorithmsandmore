function counting_sort_letters(K, P)
    #Finding the largest number in the list
    A =  K
    for i = 1 : length(K)
        stringy = K[i]
        append!(K[i], Int64(stringy[P]))
    end
    return A

    currentmax = A[1]
    for i = 0 : length(A)-1
        i += 1
        if currentmax < A[i]
            currentmax = A[i]
        end
    end

    #Creating an empty array with as many indecies as the largest number
    emptyarray = []
    for i = 1 : currentmax
        append!(emptyarray, 0)
    end

    #Counting how many occurences there is of each number up to the largest number
    for i = 1 : length(A)
        emptyarray[A[i]]+=1
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
        countarray[A[j]] -= 1
        j -= 1
    end

    return countarray, B
end



A = ["ccc","cba","ca","ab","abc"]

print(counting_sort_letters(A, 2))
