def ssort(ar):
    N = len(ar)
    for I in range(0,N-1):  #select every el 
        min_index = I 
        #one pass 
        for J in range(I+1,N): #compare the slected element with next elements 
            if ar[J] < ar[min_index]:
                min_index = J 
        if min_index != I:  
            ar[I],ar[min_index] = ar[min_index],ar[I] #selected element is sorted 
    

def solve():
    #ar = [5, 3, 4, 2, 1]
    ar = [80,45,60,40,30,10,67,88,23]
    print('Before sort',ar)
    ssort(ar)
    print('After sort',ar)

solve()