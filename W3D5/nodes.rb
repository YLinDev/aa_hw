class Node
    attr_reader :value, :children

    def initialize(value, children = [])
        @value = value #a
        @children = children #[b, c]
    end
end

b = Node.new('b', [d, e])
a = Node.new('a', [b, c])

# ADT/Data Structure used for Queue: Array

def BFS(root, target)
    # create queue - array
    # add the root node to queue - [ a ]
    # loops through the queue until empty
        # remove the first node of this queue(dequeue) - a
        # check if the removed node is target
            # if the node is the target, return node
            # if the node is not the target, add node's children to queue [b, c]

    # return nil if we make it through the entire tree 
    # (the loop above) without finding a target
end

# root = a 
# target = d 

# queue = [a]

# loop iteration 1 (Is queue empty? NO)
#     queue = [a]
#     node = a 
#     is a == d ?
#         node.children

#     queue = [b, c]

# loop iteration 2 (Is queue empty? NO)
#     queue = [b, c]
#     node = b 
#     is b == d ? NO
#         add node.children into queue 

#     queue = [c,d,e]

# loop iteration 3 (Is queue empty? NO)
#     queue = [c,d,e]
#     node = c 
#     is c == d? NO
#         add node.children into queue

#         queue = [d, e, f, g]

# loop iteration 4 (Is queue empty? NO)
#     queue = [d, e, f, g]
#     node = d 
#     is d == d ? YES
#         RETURN D Node

# ADT/Data structure used for implementing stack - array
# uses recursion
def DFS(root, target)
    # create stack array
    # push with root node in array
    # base case: return node if node is target

    # iterate through node's children
        # call DFS on each child node
        # if result is not nil, return node 
        # (this means we found the node we want and we have to return that node)
        # We don't want to return nil because that would return 
        # too early when we didn't get to check other nodes

    # return nil if target not found
end

STACK FRAME 1
    root = a 
    target = d 

    stack = [a]
    is a == d ? NO 

    iteration loop 1 - [b, c]
        DFS(b, target) # Result of stack frame 2! NODE D
        Result is not nil, RETURN NODE D
___________________

STACK FRAME 2
    root = b
    target = d 
    stack = b
    is b == d ? NO 

    iteration loop 1 - [d, e]
        DFS(d, target) # Result of stack frame 3! NODE D
        Result is not nil, RETURN NODE D
___________________

STACK FRAME 3
    root = d 
    target = d 
    stack = d
    is d == d ? YES 
        RETURN NODE D 


#New Target F

STACK FRAME 1
    root = a 
    target = f 

    stack = a
    is a == f ? NO 

    iteration loop 1 - b
        DFS(b, target) # Result of stack frame 2a! NIL
        Oh, we got nil, I dont care, move on

    iteration loop 2 - c
        DFS(c, target) # Result of stack frame 2b! Node F

____________________

STACK FRAME 2a
    root = b 
    target = f 

    stack = b
    is b == f ? NO 

    iteration loop 1 - d
        DFS(d, target) # Result of stack frame 3a! NIL
        oh, we got nil, I dont care, move on

    iteration loop 2 - e 
        DFS(e, target) # Result of stack frame 3b! NIL

    RETURN NIL because we went through all of bs children

STACK FRAME 2b
    root = c 
    target = f 

    stack = c
    is c == f ? NO 

    iteration loop 1 - [f, g]
        DFS(f, target) # Result of stack frame 3c! NODE F
        is result not nil? YES
            Return F Node

 ____________________

STACK FRAME 3a
    root = d
    target = f 

    stack = d
    is d == f ? NO 

    no iteration because no children
    RETURN Nil because target was not found

STACK FRAME 3b
    root = e
    target = f 

    stack = e
    is e == f ? NO 

    no iteration because no children
    RETURN Nil because target was not found

STACK FRAME 3c
    root = f
    target = f 

    stack = f
    is f == f ? YES
        RETURN F NODE
