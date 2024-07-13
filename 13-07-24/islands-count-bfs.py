from collections import deque 
def bfs(grid, rows, cols, visited, r,c):
    queue = deque([(r,c)])
    while queue:
        qr, qc = queue.popleft() #cell in queue
        if (qr,qc) in visited:
            continue 
        visited.add( (qr,qc) )
        directions = [(1,0),(-1,0),(0,1),(0,-1)] #right, left, down, up
        for qr_offset, qc_offset in directions:
            nr, nc = (qr + qr_offset), (qc + qc_offset) #each neighbour cell (r,l,d,u)
            is_cell_valid = (nr >= 0 and nr <= rows-1) and (nc >= 0 and nc <= cols-1)
            if is_cell_valid:
                is_non_visited_land = (grid[nr][nc] == '1') and (nr,nc) not in visited  
            if is_cell_valid and is_non_visited_land:
                queue.append( (nr,nc) )
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        rows, cols = len(grid), len(grid[0])
        visited = set()
        islands = 0
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == '1' and (r,c) not in visited:
                    #neighbours travel from (r,c)
                    bfs(grid, rows, cols, visited, r,c) #check is there lands in neighbours
                    #neigbours land are included into the island 
                    islands += 1
        return islands