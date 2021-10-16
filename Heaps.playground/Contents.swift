import UIKit

struct MinHeap {
    
    // All values in our heap.
    var values: [Int] = []
    
    
    // MARK: - Get Item Index Functions
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return parentIndex * 2 + 1
    }
    
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return parentIndex * 2 + 2
    }
    
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // MARK: - Verify values Exist Functions
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < values.count
    }
    
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < values.count
    }
    
    private func hasParentNode(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // MARK: - Get Item Value Functions
    private func leftChild(_ index: Int) -> Int {
        return values[getLeftChildIndex(index)]
    }
    
    private func rightChild(_ index: Int) -> Int {
        return values[getRightChildIndex(index)]
    }
    
    private func parent(_ index: Int) -> Int {
        return values[getParentIndex(index)]
    }
    
    // MARK: Accessor Helper functions
    /**
     Swap():
     Swaps items at 2 indices in the heap.
     - Utilizes the mutating keyword for rearranging data.
     */
    mutating private func swap(_ indexOne: Int, _ IndexTwo: Int) {
        (values[indexOne], values[IndexTwo]) = (values[IndexTwo], values[indexOne])
    }
    
    /**
     HeapifyUp():
     Allows us to put a newly added value in the correct place.
     - Utilizes mutating keyword for rearranging the heap.
     */
    mutating private func heapifyUp() {
        var index = values.count - 1
        while hasParentNode(index) && parent(index) > values[index] {
            swap(getParentIndex(index), index)
            index = getParentIndex(index)
        }
    }
    
    /**
     HeapifyDown():
     Allows us to rearrange the heap after a value was removed.
     - Utilizes mutating keyword for rearranging the heap.
     */
    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }
            
            if values[index] < values[smallerChildIndex] {
                break
            } else {
                swap(index, smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
    
    // MARK: - Heap accessor functions
    /**
     Peek():
     This will be the minimum (in MinHeap) or maximum (in MaxHeap) value.
     Data is not modified.
     - Returns the value of the parent node in the heap.
     */
    public func peek() -> Int {
        if values.count > 0 {
            return values[0]
        } else {
            print("Empty heap.")
            return -1
        }
    }
    
    /**
     Poll():
     Returns and removes the value of the parent node.
     Then the heap is rearranged to be in the correct order after removing the value.
     - Utilizes the mutating keyword so we can remove and rearrange the data.
     - Returns the value of the parent node.
     */
    mutating public func poll() -> Int {
        if values.count > 0 {
            let item = values[0]
            values[0] = values[values.count - 1]
            heapifyDown()
            values.removeLast()
            return item
        } else {
            print("Empty heap.")
            return -1
        }
    }
    
    /**
     Add():
     Appends a new value to the end of the heap.
     Then the heap is rearranged to be in the correct order after adding the value.
     - Utilizes the mutating keyword so we can add and reaarange the data.
     - Takes in the value that should be added to the heap.
     - No return.
     */
    mutating public func add(_ value: Int) {
        values.append(value)
        heapifyUp()
    }
    
    /**
     Description():
     Neatly print the values in the heap.
     */
    public func description() {
        var desc = "["
        for i in 0..<values.count {
            desc += "\(values[i])"
            if !(i + 1 == values.count) {
                desc += ", "
            }
        }
        desc += "]"
        print(desc)
    }
}

var heap = MinHeap()

heap.add(2)
heap.add(4)
heap.add(3)
heap.add(10)
heap.add(8)
heap.add(15)
heap.add(7)
heap.add(9)
heap.add(9)
heap.description()
