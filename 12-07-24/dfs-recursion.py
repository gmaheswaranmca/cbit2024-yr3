# 'dictionary' of where key is the each node
# value is the neighbour of the node
# neighbours are represented in the 'list' 
graph = {
  'A' : ['B', 'C'],  'B' : ['A', 'D', 'E'],
  'C' : ['A', 'F'],  'D' : ['B'],
  'E' : ['B','F'],   'F' : ['C','E']
}
visited = set() #visited nodes are added here 
def dfs(graph, node):
    global visited  

    visited.add(node) #marking it is visited
    print(node, end = ' ') #visit
    neighbours = graph[node] #now non visited neighbours to be visited
    neighbours = neighbours[::-1]#reverse neighbours 
    for neighbour in neighbours:
        if neighbour not in visited: # works as base cond also
            dfs(graph, neighbour)
#test 
dfs(graph, 'A')


'''
visited: A C F E B D
print:   A C F E B D
---------------------
call stack:

dfs(graph,'D')@6 removed
dfs(graph,'B')@5 removed
dfs(graph,'E')@4 removed 
dfs(graph,'F')@3 removed
dfs(graph,'C')@2 removed
dfs(graph, 'A')@main removed
--main()--
---------------------
@main
def dfs(graph, node):#graph, 'A'
    ...
    neighbours: 'C'y,'B'y
    'C' not visited so, dfs(graph,'C')@2
    'B' visited, no call 
    remove SF

@2
def dfs(graph, node): #graph,'C'
    ...
    neighbours: 'F'y,'A'y
    'F' not visited so, dfs(graph,'F')@3
    'A' visited, no call 
    remove SF

@3
def dfs(graph, node):#graph,'F'
    ...
    'E'y,'C'y
    'E' not visited, dfs(graph,'E')@4
    'C' visited, no call 
    remove SF
    
    
@4
def dfs(graph, node):#graph,'E'
    ...
    'F'y, 'B'y
    'F' visited, no call 
    'B' not visited, dfs(graph,'B')@5
    remove SF

@5
def dfs(graph, node):#graph,'B'
    ...
    'A'y,'D'y,'E'y
    'A' visited, no call 
    'D' not visited, dfs(graph,'D')@6
    'E' visited, no call
    removing SF

@6
def dfs(graph, node):#graph,'D'
    ...
    'B'y
    'B' visited, no call 
    Remove the stack frame(SF)
'''

