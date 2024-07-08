def ternary_serach(ar,target,left,right): #   
    if left <= right:
        mid1 = left + ((right - left ) // 3)    # 0 + 3 = 3
        mid2 = right - ((right - left ) // 3)   # 9 - 3 = 6

        if target == ar[mid1]:
            return mid1 
        elif target == ar[mid2]:
            return mid2 
        else:   # reduce the search range | left list | mid list | right list 
            if target < ar[mid1]:
                return ternary_serach(ar,target,left,mid1-1)
            elif target > ar[mid2]:
                return ternary_serach(ar,target,mid2+1,right)
            else:
                return ternary_serach(ar,target,mid1+1,mid2-1)
    return -1 #not found element

def solve():
    N = 10 # number of elements 
    ar = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]# list
    target = 18 #2 #12 #17 #3 #11
    index = ternary_serach(ar, target,0,N-1)
    print(index)

solve()