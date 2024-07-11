# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        #base logic and validation
        if (not preorder) or (not inorder) or (len(preorder) != len(inorder)):
            return None
        #form the root for given preorder and inorder
        val = preorder[0]
        root = TreeNode(val)
        #find the index of the root inorder list 
        inorder_index = inorder.index(val)
        #get the left and right tree's inorder and preoder traversal lists
        left_preorder,right_preorder = preorder[1:inorder_index+1], preorder[inorder_index+1:]
        left_inorder,right_inorder = inorder[:inorder_index], inorder[inorder_index+1:]
        #build the left and right sub trees of the node using their inorder and preorder traversal list
        root.left = self.buildTree(left_preorder, left_inorder)
        root.right = self.buildTree(right_preorder, right_inorder)
        return root