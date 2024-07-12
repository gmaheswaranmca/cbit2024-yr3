# 'dictionary' of where key is the each node
# value is the neighbour of the node
# neighbours are represented in the 'list' 
graph = {
  'A' : ['B', 'C'],  'B' : ['A', 'D', 'E'],
  'C' : ['A', 'F'],  'D' : ['B'],
  'E' : ['B','F'],   'F' : ['C','E']
}

def dfs(graph, start):
    visited = set() #visited nodes are added here 
    stack = [start] #list is used the stack 

    while stack:
        node = stack.pop()
        if node not in visited:
            visited.add(node) #marking it is visited
            print(node, end = ' ') #visit
            neighbours = graph[node] #now non visited neighbours to be visited
            for neighbour in neighbours:
                if neighbour not in visited:
                    stack.append(neighbour)
#test 
dfs(graph, 'A')
'''
  visited : {A C F E B D}
  print : A C F E B D
  stack: {}
'''