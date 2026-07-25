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
# Pseudocodes - Artificial Intelligence and Expert Systems (Prolog)

## 1. Sum of Integers from 1 to n

```text
START
Input N
If N = 1
    Return 1
Else
    Sum = N + Sum(N-1)
Display Sum
STOP
```

---

## 2. Name and DOB Database

```text
START
Store Name and Date of Birth
Accept Name as input
Search the database
If record exists
    Display Date of Birth
Else
    Display "Record Not Found"
STOP
```

---

## 3. Student–Teacher–Subject Database

```text
START
Store student details
Store teacher details
Store subject codes
Associate teachers with subjects
Associate students with subjects
Accept user query
Display matching information
STOP
```

---

## 4. Planets Database

```text
START
Store planet names
Accept planet name
Search database
If planet exists
    Display "Planet Found"
Else
    Display "Planet Not Found"
STOP
```

---

## 5. Towers of Hanoi

```text
START
Input number of disks N
If N = 1
    Move disk from Source to Destination
Else
    Move N-1 disks from Source to Auxiliary
    Move largest disk from Source to Destination
    Move N-1 disks from Auxiliary to Destination
STOP
```

---

## 6. Bird Can Fly or Not

```text
START
Store birds that can fly
Store birds that cannot fly
Accept bird name
Check database
If bird can fly
    Display "Can Fly"
Else
    Display "Cannot Fly"
STOP
```

---

## 7. Family Tree

```text
START
Store male members
Store female members
Store parent-child relationships
Create rules for father, mother,
brother, sister, grandfather,
and grandmother
Accept relationship query
Display relationship
STOP
```

---

## 8. Dieting Expert System

```text
START
Store diseases and diet plans
Accept disease name
Search knowledge base
If disease found
    Display recommended diet
Else
    Display "No Diet Available"
STOP
```
# Marcus Loyal to Caesar - Pseudocode

```text
START

Store the facts:
    Marcus is a man
    Marcus is a Roman
    Caesar is a ruler
    Marcus is loyal to Caesar

Create rule:
    Every man is a person

Create rule:
    A person can try to assassinate a ruler
    only if the person is NOT loyal to the ruler

Accept a query

IF the query is
    "Is Marcus loyal to Caesar?"
THEN
    Search the knowledge base
    Display TRUE

ELSE IF the query is
    "Did Marcus try to assassinate Caesar?"
THEN
    Check if Marcus is not loyal
    Since Marcus is loyal
    Display FALSE

STOP
```
