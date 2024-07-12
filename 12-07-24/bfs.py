# 'dictionary' of where key is the each node
# value is the neighbour of the node
# neighbours are represented in the 'list' 
from collections import deque 
graph = {
  'A' : ['B', 'C'],  'B' : ['A', 'D', 'E'],
  'C' : ['A', 'F'],  'D' : ['B'],
  'E' : ['B','F'],   'F' : ['C','E']
}
visited = set()
'''
  1. mark as visited when we add to the queue 
  2. do visited when we remove from the queue 
'''
def bfs(grpah, start):
  global visited 
  queue = deque([start]) #add, mark as visited 
  visited.add(start) #marking as visited, "not visited"
  
  while queue:
    node = queue.popleft() #remove, and visit 
    print(node, end=' ')
    #iterate neighbours 
    neighbours = graph[node] 
    for neighbour in neighbours:
      if neighbour not in visited:
        queue.append(neighbour) #add, mark as visited
        visited.add(neighbour)
#test 
bfs(graph,'A')

'''
    visited(marking): A B C D E F
    queue:   
    print(visited):   A B C D E F
'''