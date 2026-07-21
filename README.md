# Graph Search Algorithms

## Breadth First Search (BFS)

```text
BFS(Graph, Start)

1. Create an empty Queue
2. Create an empty Visited set
3. Add Start to Visited
4. Enqueue(Start)

5. While Queue is not empty
      Node = Dequeue()
      Print Node

      For each Neighbor of Node
            If Neighbor is not in Visited
                  Add Neighbor to Visited
                  Enqueue(Neighbor)

6. End
```

---

## Depth First Search (DFS)

```text
DFS(Graph, Node)

1. Mark Node as Visited
2. Print Node

3. For each Neighbor of Node
      If Neighbor is not Visited
            DFS(Graph, Neighbor)

4. End
```

---

## Greedy Best-First Search (GBFS)

```text
GBFS(Graph, Start, Goal)

1. Create an empty Priority Queue
2. Insert Start into Priority Queue
3. Mark all nodes as Unvisited

4. While Priority Queue is not empty
      Node = Remove node with smallest heuristic
      Print Node

      If Node is Goal
            Stop

      Mark Node as Visited

      For each Neighbor of Node
            If Neighbor is not Visited
                  Insert Neighbor into Priority Queue

5. End
```
