# modified from https://www.geeksforgeeks.org/find-whether-path-two-cells-matrix/

from collections import defaultdict


class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

        # add edge to graph

    def addEdge(self, u, v):
        self.graph[u].append(v)

        # BFS function to find path from source to sink

    def BFS(self, s, d):

        # Base case 
        if s == d:
            return True

        # Mark all the vertices as not visited  
        visited = defaultdict(lambda: False)

        # Create a queue for BFS  
        queue = []
        queue.append(s)

        # Mark the current node as visited and  
        # enqueue it  
        visited[s] = True
        while (queue):

            # Dequeue a vertex from queue 
            s = queue.pop(0)

            # Get all adjacent vertices of the  
            # dequeued vertex s. If a adjacent has  
            # not been visited, then mark it visited  
            # and enqueue it  
            for i in self.graph[s]:

                # If this adjacent node is the destination  
                # node, then return true  
                if i == d:
                    return True

                # Else, continue to do BFS  
                if visited[i] == False:
                    queue.append(i)
                    visited[i] = True

        # If BFS is complete without visiting d 
        return False


def isSafe(i, j, nrow, ncol):
    if i >= 0 and i < nrow and j >= 0 and j < ncol:
        return True
    else:
        return False


# Returns true if there is a path from a source (a  
# cell with value 2) to a destination (a cell with  
# value 3) 
def existpath(X):
    s, d = None, None  # source and destination
    ny = len(X)
    nx = len(X[0])
    g = Graph()

    # each cell consider as node
    k = 0  # Number of current vertex
    for i in range(ny):
        for j in range(nx):
            if (X[i][j] != 1):

                # connect all 4 adjacent cell to  
                # current cell  
                if (isSafe(i, j + 1, ny, nx)):
                    g.addEdge(k, k + 1)
                if (isSafe(i, j - 1, ny, nx)):
                    g.addEdge(k, k - 1)
                if (isSafe(i + 1, j, ny, nx)):
                    g.addEdge(k, k + nx)
                if (isSafe(i - 1, j, ny, nx)):
                    g.addEdge(k, k - nx)

            if (X[i][j] == 2):
                s = k

            if (X[i][j] == 3):
                d = k
            k += 1

    # find path Using BFS  
    return g.BFS(s, d)


def isvalid(X):
    if type(X) is not list:
        X = X.tolist()
    # check if inlet is blocked
    inlet = 0
    for i in range(8):
        if X[i][0] == 0:
            X[i][0] = 2
            break
        else:
            inlet += 1
            if inlet == 8:
                return False

    # check if outlet is blocked
    outlet = 0
    for i in range(16):
        if X[i][-1] == 0:
            X[i][-1] = 3
            break
        else:
            outlet += 1
            if outlet == 16:
                return False
    # check if there is a path from inlet to outlet
    return existpath(X)


if __name__ == "__main__":
    import scipy.io as scio

    data = scio.loadmat('matlab.mat')
    x = (data['kk'])
    print(isvalid(x))
