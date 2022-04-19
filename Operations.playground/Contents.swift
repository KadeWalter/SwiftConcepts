import UIKit

class FiveSecondOperation: Operation {
    override func main() {
        guard !self.isCancelled else { return }
        Thread.sleep(forTimeInterval: 5)
    }
}

class TenSecondOperation: Operation {
    override func main() {
        guard !self.isCancelled else { return }
        Thread.sleep(forTimeInterval: 10)
    }
}

// TEST 1:
var tenSec = TenSecondOperation()
tenSec.completionBlock = { print("Ten second operation completed.") }

var fiveSec = FiveSecondOperation()
fiveSec.completionBlock = { print("Five second operation completed.") }

// Expected that five seconds will print before ten seconds.
// This is because we aren't waiting for tenSec to finish before starting fiveSec.
var queue = OperationQueue()
queue.addOperations([tenSec, fiveSec], waitUntilFinished: false)
queue.waitUntilAllOperationsAreFinished()
print("-----------------------------------")


// TEST 2:
tenSec = TenSecondOperation()
tenSec.completionBlock = { print("Ten second operation completed.") }

fiveSec = FiveSecondOperation()
fiveSec.addDependency(tenSec) // Add dependency, stating that we need tenSec to finish before starting fiveSec.
fiveSec.completionBlock = { print("Five second operation completed.") }

// Expected that ten seconds will print before five seconds.
// This is because we are now waiting for tenSec to finish before starting fiveSec.
queue.addOperations([tenSec, fiveSec], waitUntilFinished: true)
queue.waitUntilAllOperationsAreFinished()
print("-----------------------------------")

class AsyncOperation: Operation {
    private let lockQueue = DispatchQueue(label: "asyncOperationExample", attributes: .concurrent)
    
    override var isAsynchronous: Bool { return true }
    
    private var _isExecuting: Bool = false
        override private(set) var isExecuting: Bool {
            get {
                return lockQueue.sync { () -> Bool in
                    return _isExecuting
                }
            }
            set {
                willChangeValue(forKey: "isExecuting")
                lockQueue.sync(flags: [.barrier]) {
                    _isExecuting = newValue
                }
                didChangeValue(forKey: "isExecuting")
            }
        }

        private var _isFinished: Bool = false
        override private(set) var isFinished: Bool {
            get {
                return lockQueue.sync { () -> Bool in
                    return _isFinished
                }
            }
            set {
                willChangeValue(forKey: "isFinished")
                lockQueue.sync(flags: [.barrier]) {
                    _isFinished = newValue
                }
                didChangeValue(forKey: "isFinished")
            }
        }

        override func start() {
            print("Starting")
            guard !isCancelled else {
                finish()
                return
            }

            isFinished = false
            isExecuting = true
            main()
        }

        override func main() {
            fatalError("Subclasses must implement `main` without overriding super.")
        }

        func finish() {
            isExecuting = false
            isFinished = true
        }
}

final class OperationA: AsyncOperation {
    override func main() {
        Thread.sleep(forTimeInterval: 5)
        self.finish()
    }
}

final class OperationB: AsyncOperation {
    override func main() {
        Thread.sleep(forTimeInterval: 3)
        self.finish()
    }
}

let opA = OperationA()
opA.completionBlock = { print("Operation A complete.") }
let opB = OperationB()
opB.completionBlock = { print("Operation B complete.") }

let opQueue = OperationQueue()
opQueue.addOperations([opA, opB], waitUntilFinished: false)
opQueue.waitUntilAllOperationsAreFinished()
print("-----------------------------------")
