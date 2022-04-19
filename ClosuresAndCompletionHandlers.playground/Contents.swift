import UIKit

// Simple closure example:
// Example of a closure to find the max number of 2 Ints.
let findMaxNumber: (Int, Int) -> (Int) = { (numberOne: Int, numberTwo: Int)->(Int) in
    return numberOne > numberTwo ? numberOne : numberTwo
}

print(findMaxNumber(1, 2))
print(findMaxNumber(2, 1))
print(findMaxNumber(10, 5))
print(findMaxNumber(10, -1))
print("-------------------------")

// Completion Handler example:
// 1. Start a task.
//   - Print when the starting the task.
//   - Print when the task has been successfully started.
// 2. That task does some async background logic.
// 3. As the completion handlers return, handle the logic.
// 4. At the end, print when the task is complete.

// Start an async task. This could be similar to kicking off a REST call.
// If we remove @escaping, we get an error:
// " Escaping closure captures non-escaping parameter 'completion' "
// @escaping is required because our long task will return before the completion is called.
// This is due to async tasks running. So we start the task,
// then return while the task executes.
func longTask(completion: @escaping (Bool) -> ()) {
    Task {
        await backgroundTask {
            completion(true)
        }
    }
}

// Simulate a REST call. Just sit around for 5 seconds.
// After we have waited 5 seconds, call the completion signifying that we are done.
// This code does not require @escaping because
// the completion handler will be called before the function returns.
func backgroundTask(_ completion: () -> ()) async {
    for _ in 0..<5 {
        Thread.sleep(forTimeInterval: 1)
    }
    completion()
}

func runTask() {
    print("Starting to run the task.")
    longTask() { success in
        print("Task completed: \(success)")
    }
    print("The task has started.")
}
runTask()
