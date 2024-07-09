def isort(ar): 
    N = len(ar) 
    for I in range(1,N): 
        target = ar[I]
        J = I - 1 
        while J >= 0 and target < ar[J]:
            J = J - 1
            ar[J+1] = ar[J] #shift right, run parallel wrt finding the pos of el 
        ar[J] = target 


def solve():
    #ar = [5, 3, 4, 2, 1]
    ar = [80,45,60,40,30,10,67,88,23]
    print('Before sort',ar)
    isort(ar)
    print('After sort',ar)

solve()

#mistake is there, we will fix tomorrow and continue