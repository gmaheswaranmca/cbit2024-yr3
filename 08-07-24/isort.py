def isort(ar): 
    N = len(ar) 
    for I in range(1,N): 
        target = ar[I]
        tindex = I 
        sindex = I - 1 
        
        while sindex >= 0 and ar[sindex] > target:            
            ar[sindex+1] = ar[sindex]
            sindex -= 1
            tindex -= 1        
        if tindex != I:
            ar[tindex] = target 

def solve():
    #ar = [5, 3, 4, 2, 1]
    ar = [80,45,60,40,30,10,67,88,23]
    print('Before sort',ar)
    isort(ar)
    print('After sort',ar)

solve()

#mistake is there, we will fix tomorrow and continue

'''
Time complexity: O(N) for best case, O(N^2) for worst/average cases
Space complexity: O(1)


def isort(ar): 
    N = len(ar) 
    for I in range(1,N): #unsorted list I..N-1, sorted list: 0..I-1 where I=1..N-1
        target = ar[I]
        tindex = I # index at which target will be inserted : target index
        sindex = I - 1 #end index of sorted list : sorted index [reverse iteration : I-1 till 0]

        #reverse iteration for sorted list 
        #if you find place for the target, change the tindex
        #shift right if there is the place/room for the target 
        #ar[sindex] > target is cond for place for target
        #sindex >= 0 for reverse iteration
        while sindex >= 0 and ar[sindex] > target:
            #shift right, vacate the place for target
            ar[sindex+1] = ar[sindex]
            sindex -= 1
            tindex -= 1
        #place the target
        if tindex != I:
            ar[tindex] = target 

'''