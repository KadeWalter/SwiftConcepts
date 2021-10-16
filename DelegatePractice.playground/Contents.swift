import UIKit

protocol PracticeDelegate: AnyObject {
    func updateString(text: String) -> Bool
}

class A: PracticeDelegate {
    
    var message = "This is a test."
    
    func main() {
        let classB = B()
        classB.delegate = self
        if classB.manipulateString(forString: message) {
            print(message)
        }
    }
    
    func updateString(text: String) -> Bool {
        if text.isEmpty {
            message = text
            return true
        }
        return false
    }
}

class B {
    var delegate: PracticeDelegate?
    
    func manipulateString(forString text: String) -> Bool {
        let newMessage = text.appending(" We are updating the string.")
        let updated = delegate!.updateString(text: newMessage)
        return updated
    }
}

let a = A()
a.main()

