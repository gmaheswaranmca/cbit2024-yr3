class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
def insert(root, key):
    #base cond 
    if root is None:
        return TreeNode(key)
    
    #logic 
    if  key > root.value:
        root.right = insert(root.right, key)
    else: #key < root.value 
        root.left = insert(root.left, key)
    return root
def search(root, key):
    #base cond 
    if root is None:
        return None 

    #logic 
    if root.value == key:
        return root
    elif key > root.value:
        return search(root.right, key)
    else: #key<root.value 
        return search(root.left, key)
def delete_node(root, key):
    if root is None:
        return root
    if key < root.value:
        root.left = delete_node(root.left, key) 
    elif key > root.value:
        root.right = delete_node(root.right, key)
    else:
        if root.left is None:
            return root.right
        elif root.right is None:
            return root.left

        temp = min_value_node(root.right)
        root.value = temp.value
        root.right = delete_node(root.right, temp.value)
    return root
def min_value_node(node):
    current = node
    while current.left is not None: 
        current = current.left
    return current
def inorder(root):
    if not root:
        return 
    #logic 
    inorder(root.left)
    print(root.value, end=' ')
    inorder(root.right)
#driver code to test
#data 50 30 20 40 70 60 80
root = insert(None,50)
insert(root,30)
insert(root,20)
insert(root,40)
insert(root,70)
insert(root,60)
insert(root,80)

print("Inorder traversal:")
inorder(root)

node = min_value_node(root)
if node:
    print(f'\nMin value node value:{node.value}')


node = search(root,20)
if node:
    print(f'\nSearch Result:{node.value} is found')
else:
    print(f'\nSearch Result:20 is not found')
node = search(root,70)

if node:
    print(f'\nSearch Result:{node.value} is found')
else:
    print(f'\nSearch Result:70 is not found')
    


delete_node(root,20) #leaf 
print("\nInorder traversal(after 20 is deleted):")
inorder(root)

delete_node(root,50) #two child
print("\nInorder traversal(after 50 is deleted):")
inorder(root)

delete_node(root,70) # one child node
print("\nInorder traversal(after 70 is deleted):")
inorder(root)