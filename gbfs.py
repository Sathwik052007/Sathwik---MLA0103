import heapq

def greedy_best_first_search(graph, heuristic, start, goal):
    priority_queue = []
    heapq.heappush(priority_queue, (heuristic[start], start))

    visited = set()

    while priority_queue:
        h, current = heapq.heappop(priority_queue)

        if current in visited:
            continue

        print(current, end=" ")
        visited.add(current)

        if current == goal:
            print("\nGoal reached!")
            return

        for neighbor in graph[current]:
            if neighbor not in visited:
                heapq.heappush(priority_queue, (heuristic[neighbor], neighbor))

    print("\nGoal not found!")

# Graph
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['G'],
    'F': [],
    'G': []
}

# Heuristic values
heuristic = {
    'A': 6,
    'B': 4,
    'C': 5,
    'D': 3,
    'E': 2,
    'F': 4,
    'G': 0
}

# Start and Goal
greedy_best_first_search(graph, heuristic, 'A', 'G')
