import sys


def loadMatrix():
    matrix = []
    inputMatrix = open("input.txt", "r")
    while True:
        line = inputMatrix.readline()
        if not line: break
        matrix.append([])
        lineList = line.split('|')
        for i in lineList:
            try: matrix[-1].append(int(i))
            except:
                if i != '': matrix[-1].append(0)
    inputMatrix.close()
    return matrix


def findShortestPath(graph):
    for node, arr in enumerate(graph.graph):
        graph.dijkstra(node)


class Graph():

    def __init__(self, vertices):
        self.V = vertices
        self.graph = [[0 for column in range(vertices)] for row in range(vertices)]

    def printSolution(self, dist):
        for node in range(self.V):
            print(str(node) + ":", dist[node])

    def minDistance(self, dist, sptSet):
        min = sys.maxsize
        for v in range(self.V):
            if dist[v] < min and sptSet[v] == False:
                min = dist[v]
                min_index = v

        return min_index

    def dijkstra(self, src):
        dist = [sys.maxsize] * self.V
        dist[src] = 0
        sptSet = [False] * self.V

        for cout in range(self.V):
            u = self.minDistance(dist, sptSet)
            sptSet[u] = True
            for v in range(self.V):
                if self.graph[u][v] > 0 and sptSet[v] == False and dist[v] > dist[u] + self.graph[u][v]:
                    dist[v] = dist[u] + self.graph[u][v]
        print("The shortest way from", src, "to all is:")
        self.printSolution(dist)


if __name__ == '__main__':
    matrix = loadMatrix()
    graph = Graph(len(matrix))
    graph.graph = matrix
    findShortestPath(graph)
