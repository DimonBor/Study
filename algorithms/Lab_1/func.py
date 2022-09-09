def loadMatrix():
    matrix = []
    inputMatrix = open("input_alex.txt", "r")
    while True:
        line = inputMatrix.readline()
        if not line: break
        lineList = line.split()
        matrix.append(lineList)
    inputMatrix.close
    return matrix


def buildGraph(matrix):
    graph = {}
    for line in matrix:
        graph[matrix.index(line)+1] = []
        for i in enumerate(line):
            if i[1] == '1':
                graph[matrix.index(line)+1].append(i[0]+1)
    return graph


def bfsSP(graph, start, goal):
    explored = []
    queue = [[start]]

    if start == goal:
        return 0

    while queue:
        path = queue.pop(0)
        node = path[-1]
        if node not in explored:
            neighbours = graph[node]
            for neighbour in neighbours:
                new_path = list(path)
                new_path.append(neighbour)
                queue.append(new_path)
                if neighbour == goal:
                    return new_path
            explored.append(node)
    return 0


def buildOutputMatrix(graph):
    outputMatrix = []
    for i in graph:
        outputMatrix.append([])
        for j in graph:
            path = bfsSP(graph, i, j)
            print("From", i, "to", j, "shortest path is", path)
            if path: outputMatrix[i-1].append(len(path))
            else: outputMatrix[i-1].append(path)
    return outputMatrix
