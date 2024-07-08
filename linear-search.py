def linear_search(ar, target): # find the index of target 
    N = len(ar)
    for I in range(N): # 0 .. < N
        if ar[I] == target:
            return I 
    return -1   #Not found 

def solve():
    N = 5 # number of elements 
    ar = [5, 3, 1, 2, 4]# list
    target = 6
    index = linear_search(ar, target)
    print(index)

solve()