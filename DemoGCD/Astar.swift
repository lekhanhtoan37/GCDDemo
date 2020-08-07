class Node<T: Hashable>: Comparable, Hashable {
    let state: T
    let parent: Node?
    let cost: Float
    let heuristic: Float
    init(state: T, parent: Node?, cost: Float, heuristic: Float) {
        self.state = state
        self.parent = parent
        self.cost = cost
        self.heuristic = heuristic
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(state)
        hasher.combine(parent)
        hasher.combine(cost)
        hasher.combine(heuristic)
    }
}

func < <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return (lhs.cost + lhs.heuristic) < (rhs.cost + rhs.heuristic)
}

func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs === rhs
}

/// Formulate a result path as an array from a goal node found in an astar search
///
/// - parameter startNode: The goal node found from an astar search.
/// - returns: An array containing the states to get from the start to the goal.
func backtrack<T>(_ goalNode: Node<T>) -> [T] {
    var sol: [T] = []
    var node = goalNode
    
    while (node.parent != nil) {
        sol.append(node.state)
        node = node.parent!
    }
    
    sol.append(node.state)
    
    return sol
}

/// Find the shortest path from a start state to a goal state.
///
/// - parameter initialState: The state that we are starting from.
/// - parameter goalTestFn: A function that determines whether a state is the goal state.
/// - parameter successorFn: A function that finds the next states from a state.
/// - parameter heuristicFn: A function that makes an underestimate of distance from a state to the goal.
/// - returns: A path from the start state to a goal state as an array.
func astar<T: Hashable>(_ initialState: T, goalTestFn: (T) -> Bool, successorFn: (T) -> [T], heuristicFn: (T) -> Float) -> [T]? {
    var frontier = PriorityQueue(ascending: true, startingValues: [Node(state: initialState, parent: nil, cost: 0, heuristic: heuristicFn(initialState))])
    var explored = Dictionary<T, Float>()
    explored[initialState] = 0
    var nodesSearched: Int = 0
    
    while let currentNode = frontier.pop() {
        nodesSearched += 1
          // we know if there are still items, we can pop one
        let currentState = currentNode.state
        
        if goalTestFn(currentState) {
            print("Searched \(nodesSearched) nodes.")
            return backtrack(currentNode)
        }
        
        for child in successorFn(currentState) {
            let newcost = currentNode.cost + 1  //1 assumes a grid, there should be a cost function
            if (explored[child] == nil) || (explored[child]! > newcost) {
                explored[child] = newcost
                frontier.push(Node(state: child, parent: currentNode, cost: newcost, heuristic: heuristicFn(child)))
            }
        }
    }
    
    return nil
}
