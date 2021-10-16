import UIKit


func bruteForceGridTraveler(_ m: Int, _ n: Int) -> Int {
    // Layout base cases:
    if m == 1, n == 1 { return 1 }
    if m == 0 || n == 0 { return 0 }
    return bruteForceGridTraveler(m - 1, n) + bruteForceGridTraveler(m, n - 1)
}

var gridSolutions: [String : Int] = [:]
func optimizedGridTraveler(_ m: Int, _ n: Int) -> Int {
    // Create key for the gridSolutions map.
    let key = "\(m),\(n)"
    if let value = gridSolutions[key] {
        return value
    }
    if m == 1, n == 1 { return 1 }
    if m == 0 || n == 0 { return 0 }
    let value = optimizedGridTraveler(m - 1, n) + optimizedGridTraveler(m, n - 1)
    gridSolutions[key] = value
    return value
}

print("Brute Force: \(bruteForceGridTraveler(1, 1))") // = 1
print("Brute Force: \(bruteForceGridTraveler(2, 3))") // = 3
print("Brute Force: \(bruteForceGridTraveler(3, 2))") // = 3
print("Brute Force: \(bruteForceGridTraveler(3, 3))") // = 6
//print(bruteForceGridTraveler(18, 18)) // = 2333606220 -> DO NOT RUN IN BRUTE FORCE.
print("\n")

print("Optimized: \(optimizedGridTraveler(1, 1))") // = 1
print("Optimized: \(optimizedGridTraveler(2, 3))") // = 3
print("Optimized: \(optimizedGridTraveler(3, 2))") // = 3
print("Optimized: \(optimizedGridTraveler(3, 3))") // = 6
print("Optimized: \(optimizedGridTraveler(18, 18))") // = 2333606220
