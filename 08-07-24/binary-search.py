def binary_search(ar, target): # find the index of target 
    N = len(ar)
    left, right = 0, N-1

    while left <= right:
        mid = (left + right) // 2 
        if target == ar[mid]: 
            return mid 
        elif target < ar[mid]:
            right = mid - 1 
        else:
            left = mid + 1

    return -1 

def solve():
    N = 8 # number of elements 
    ar = [1, 3, 5, 7, 9, 10, 12, 15]# list
    target = 11 #3 #12
    index = binary_search(ar, target)
    print(index)

solve()