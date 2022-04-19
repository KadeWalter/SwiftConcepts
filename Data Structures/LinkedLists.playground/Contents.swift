import UIKit

class Node<T> {
    var value: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", "}
        }
        
        return text + "]"
    }
        
    func append(value: T) {
        // create the new node
        let node = Node(value: value)
        if let tail = tail {
            // if the list already has a tail,
            // make that the previous of the new node and update the tail to be the new node.
            node.previous = tail
            tail.next = node
        } else {
            // Otherwise, the list is empty, so make the head the new node.
            head = node
        }
        // The new node is also always the tail when we are appending on the end.
        tail = node
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    
    func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
}


let list = LinkedList<Int>()
for i in 0...6 {
    list.append(value: i)
}

print(list.description)
print(list.nodeAt(index: 2)?.value)
print(list.nodeAt(index: 7))

