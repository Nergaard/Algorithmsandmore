function counting_sort_length(A)
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

    I = []
    for i = 1 : length(A)
        if length(A[i])>0
            append!(I,length(A[i])+1)
        else
            append!(I,1)
        end
    end

    N = []
    for i = 1 : length(K)
        F = [I[i]]
        for j = 1 : length(K[i])
            append!(F, K[i][j])
        end
        append!(N, [F])
    end

    currentmax = N[1][1]
    for i = 0 : length(N)-1
        i += 1
        if currentmax < N[i][1]
            currentmax = N[i][1]
        end
    end

    #Creating an empty array with as many indecies as the length of the list
    emptyarray = []
    for i = 1 : currentmax
        append!(emptyarray, 0)
    end

    #Counting how many occurences there is of each number up to the largest number
    for i = 1 : length(N)
        emptyarray[N[i][1]]+=1
        i += 1
    end
    countarray = emptyarray

    for i = 2 : length(countarray)
        countarray[i] = countarray[i] + countarray[i-1]
    end

    ncount = countarray


    B = []
    j = length(N)
    for i = 1 : j
        append!(B, " ")
    end
    while j > 0 && N[j][1] != 0
        B[ncount[N[j][1]]] = N[j]
        ncount[N[j][1]] -= 1
        j -= 1
    end

    S = []
    stringy = ""
    for i = 1 : length(B)
        numby = B[i]
        stringy = ""
        cornum = 0
        for t = 2 : length(numby)
            cornum = numby[t] +96
            stringy *= Char(cornum)
        end
        append!(S, [stringy])
    end
    return S
end

A  =["bbbb", "aa","sdhfdsjhsadjhahjsdfa", "aaaa", "ccc", "fffffffff", "sadfasdfregsdfsdfa","a", ""]

print(counting_sort_length(A))
