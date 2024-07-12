def partition(ar,left,right): 
    pass

def qsort(ar,left,right):    
    if left >= right: 
        return 
    #logic 
    pivot_index = partition(ar, left, right) 
    qsort(ar,left,pivot_index-1) 
    qsort(ar,pivot_index+1,right) 

def solve():
    #ar = [5, 3, 4, 2, 1]
    ar = [80,45,60,40,30,10,67,88,23]
    print('Before sort',ar)
    qsort(ar)
    print('After sort',ar)

solve()