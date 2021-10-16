import UIKit

// MARK: - Standard Fib Recursive Implementation
func originalFib(n: Int) -> Int {
    if n <= 2 { return 1 } // First 2 items of fibonacci sequence are 1.
    return originalFib(n: n - 1) + originalFib(n: n - 2)
}

print("Original: \(originalFib(n: 6))")
print("Original: \(originalFib(n: 7))")
print("Original: \(originalFib(n: 8))")
// print(originalFib(n: 50)) -> DO NOT RUN, Time Complexity is too high
print("\n")

// MARK: - Optimized Fib Recursive Implementation
var fibValues: [Int : Int] = [:]
func optimizedFib(n: Int) -> Int {
    if let value = fibValues[n] { return value }
    if n <= 2 { return 1 }
    let value = optimizedFib(n: n - 1) + optimizedFib(n: n - 2)
    fibValues[n] = value
    return value
}

print("Optimal: \(optimizedFib(n: 6))")
print("Optimal: \(optimizedFib(n: 7))")
print("Optimal: \(optimizedFib(n: 8))")
print("Optimal: \(optimizedFib(n: 50))")
