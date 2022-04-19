import UIKit

class Node<T: Comparable> {
    var value: T
    var parent: Node<T>?
    var children: [Node<T>] = []
    
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        
        return text
    }
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node<T>) {
        children.append(child)
        child.parent = self
    }
    
    func search(value: T) -> Node<T>? {
        if value == self.value { return self }
        
        for child in self.children {
            if let node = child.search(value: value) { return node }
        }
        
        return nil
    }
}

// ROOT
let beverages = Node<String>(value: "beverages")

// LEVEL 1
let hot = Node<String>(value: "hot")
let cold = Node<String>(value: "cold")
beverages.add(child: hot)
beverages.add(child: cold)

// LEVEL 2 OFF HOT
let tea = Node<String>(value: "tea")
let coffee = Node<String>(value: "coffee")
let cocoa = Node<String>(value: "cocoa")
hot.add(child: tea)
hot.add(child: coffee)
hot.add(child: cocoa)

// LEVEL 3 OFF TEA
let black = Node<String>(value: "black")
let green = Node<String>(value: "green")
let chai = Node<String>(value: "chai")
tea.add(child: black)
tea.add(child: green)
tea.add(child: chai)

// LEVEL 2 OFF COLD
let pop = Node<String>(value: "pop")
let milk = Node<String>(value: "milk")
cold.add(child: pop)
cold.add(child: milk)

// LEVEL 3 OFF SODA
let coke = Node<String>(value: "coke")
let pepsi = Node<String>(value: "pepsi")
pop.add(child: coke)
pop.add(child: pepsi)

print(beverages.description)
print(beverages.search(value: "coke") != nil)
print(beverages.search(value: "code") != nil)

