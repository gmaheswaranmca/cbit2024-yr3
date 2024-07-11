max_path_sum = float('-inf')
#return path sum of the node
#update the max_path_sum once it is found
def find_path_sum(node): #read/write
    global max_path_sum
    if not node:
        return 0
    left_max = max(find_path_sum(node.left),0)
    right_max = max(find_path_sum(node.right),0)
    node_max_path_sum = left_max + right_max + node.val
    #check max_path_sum with node_max_path_sum
    if node_max_path_sum > max_path_sum:
        max_path_sum = node_max_path_sum
    #node + max(left tree max_path, right tree max_path)
    return node.val + max(left_max, right_max)
class Solution:
    def maxPathSum(self, root: Optional[TreeNode]) -> int:
        global max_path_sum
        find_path_sum(root)
        return max_path_sum