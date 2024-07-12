# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
def preorder(root,low,high,ar):
    if not root:
        return 
    #logic 
    if root.val >= low and root.val <= high:
        ar.append(root.val)
    preorder(root.left,low,high,ar)
    preorder(root.right,low,high,ar)
class Solution:
    def rangeSumBST(self, root: Optional[TreeNode], low: int, high: int) -> int:
        ar = []
        preorder(root,low,high,ar) 
        s = sum(ar)
        return s   