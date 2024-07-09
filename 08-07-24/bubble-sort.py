def bsort(ar):
    N = len(ar) 

    while True:
        # pass 
        isSwapped = False 
        for I in range(0,N-1):
            #N-1 is index of last element, N-2 index of one ele bef last ele 
            if ar[I] > ar[I+1]: #ar[I+1] < ar[I]
                #swap 
                ar[I], ar[I+1] = ar[I+1], ar[I] 
                isSwapped = True 

        if not isSwapped:
            break 
            #stop the procedure to proceed further for bsort 
        N -= 1

def solve():
    #ar = [5, 3, 4, 2, 1]
    ar = [80,45,60,40,30,10,67,88,23]
    print('Before sort',ar)
    bsort(ar)
    print('After sort',ar)

solve()