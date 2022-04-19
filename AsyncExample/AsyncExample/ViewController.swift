//
//  ViewController.swift
//  AsyncExample
//
//  Created by Kade Walter on 4/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        singleAsyncTaskExample()
        multipleAsyncTasksExample()
    }
    
    private func singleAsyncTaskExample() {
        print("Starting Single Task")
        Task {
            let strings = await bigHeavyTask(processNumber: 0)
            for string in strings {
                print(string)
            }
            print("Done With Single Task")
        }
    }

    private func multipleAsyncTasksExample() {
        print("Starting Multiple Tasks")
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
            print("Done With Multiple Tasks")
        }
    }

    private func bigHeavyTask(processNumber: Int) async -> [String] {
        var strings: [String] = []
        for i in 0..<5 {
            Thread.sleep(forTimeInterval: 1) // Thread will sleep for 1 second.
            strings.append("\(processNumber): \(i)")
        }
        print("Done with a big heavy task for process: \(processNumber)")
        return strings
    }
}

