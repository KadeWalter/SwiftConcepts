import UIKit

var greeting = "Hello, playground"


func bigHeavyTask(processNumber: Int) async -> [String] {
    var strings: [String] = []
    for i in 0..<5 {
        Thread.sleep(forTimeInterval: 1000) // Thread will sleep for 1 second.
        strings.append("\(processNumber): \(i)")
    }
    print("Done with a big heavy task for process: \(processNumber)")
    return strings
}

func singleAsyncTaskExample() {
    Task {
        let strings = await bigHeavyTask(processNumber: 0)
        for string in strings {
            print(string)
        }
    }
}

func multipleAsyncTasksExample() {
    Task {
        async let strings0 = bigHeavyTask(processNumber: 0)
        async let strings1 = bigHeavyTask(processNumber: 1)
        async let strings2 = bigHeavyTask(processNumber: 2)
        async let strings3 = bigHeavyTask(processNumber: 3)
        async let strings4 = bigHeavyTask(processNumber: 4)
        
        let strings = await [strings0, strings1, strings2, strings3, strings4]
        
        for processStrings in strings {
            for string in processStrings {
                print(string)
            }
        }
    }
}

singleAsyncTaskExample()
print("----------------NEW TASKS----------------")
multipleAsyncTasksExample()
