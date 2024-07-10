class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
        self.height = 1
def get_height(node):
    if not node:    # (node == None) | (not node)
        return 0
    return node.height
def get_balance(node):
    if not node:
        return 0
    return get_height(node.left) - get_height(node.right)
def right_rotate(y):
    #initialize for rotation 
    x = y.left
    T2 = x.right
    #rotate logic 
    x.right = y
    y.left = T2
    #balance the height 
    y.height = max(get_height(y.left), get_height(y.right)) + 1
    x.height = max(get_height(x.left), get_height(x.right)) + 1
    return x
def left_rotate(x):
    #initialize for rotation 
    y = x.right
    T2 = y.left
    #rotate logic
    y.left = x
    x.right = T2
    #balance the height 
    x.height = max(get_height(x.left), get_height(x.right)) + 1
    y.height = max(get_height(y.left), get_height(y.right)) + 1
    return y
def insert(node, key):
    if not node:
        return TreeNode(key)
    elif key < node.value:
        node.left = insert(node.left, key)
    else:
        node.right = insert(node.right, key)
    
    node.height = max(get_height(node.left), get_height(node.right)) + 1
    balance = get_balance(node)
    
    # Left Left (LL) Case
    if balance > 1 and key < node.left.value:
        return right_rotate(node)

    # Left Right (LR) Case
    if balance > 1 and key > node.left.value:
        node.left = left_rotate(node.left)
        return right_rotate(node)

    # Right Right (RR) Case
    if balance < -1 and key > node.right.value:
        return left_rotate(node)    
    
    # Right Left (RL) Case
    if balance < -1 and key < node.right.value:
        node.right = right_rotate(node.right)
        return left_rotate(node)
    
    return node
def min_value_node(node):
    if node is None or node.left is None:
        return node
    return min_value_node(node.left)
def delete_node(root, key):
    if not root:
        return root
    elif key < root.value:
        root.left = delete_node(root.left, key)
    elif key > root.value:
        root.right = delete_node(root.right, key)
    else:
        if root.left is None:
            temp = root.right
            root = None
            return temp
        elif root.right is None:
            temp = root.left
            root = None
            return temp
        temp = min_value_node(root.right)
        root.value = temp.value
        root.right = delete_node(root.right, temp.value)
    
    if root is None:
        return root
    
    root.height = max(get_height(root.left), get_height(root.right)) + 1
    balance = get_balance(root)
    
    # Left Left (LL) Case
    if balance > 1 and get_balance(root.left) >= 0:
        return right_rotate(root)
    
    # Left Right (LR) Case
    if balance > 1 and get_balance(root.left) < 0:
        root.left = left_rotate(root.left)
        return right_rotate(root)
    
    # Right Right (RR) Case
    if balance < -1 and get_balance(root.right) <= 0:
        return left_rotate(root)
    
    # Right Left (RL) Case
    if balance < -1 and get_balance(root.right) > 0:
        root.right = right_rotate(root.right)
        return left_rotate(root)
    
    return root

def inorder(root):
    if not root:
        return 
    #logic 
    inorder(root.left)
    print(f'{root.value}[{get_balance(root)}]',end=' ')
    inorder(root.right)

# Create the AVL tree
root = None
keys = [10, 20, 30, 40, 50, 25]

for key in keys:
    root = insert(root, key)
print('After insert:')
inorder(root)

# Delete node with value 30
root = delete_node(root, 30)
print('\nAfter delete 30:')
inorder(root)
