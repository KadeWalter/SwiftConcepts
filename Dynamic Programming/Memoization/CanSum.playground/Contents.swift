import UIKit

func initialCanSum(_ targetSum: Int, _ array: [Int]) -> Bool {
    if targetSum == 0 { return true }
    if targetSum < 0 { return false }
    for num in array {
        if num <= targetSum {
            if initialCanSum(targetSum - num, array) {
                return true
            }
        }
    }
    return false
}

var sumExists: [Int : Bool] = [:]
func optimalCanSum(_ targetSum: Int, _ array: [Int]) -> Bool {
    if let value = sumExists[targetSum] { return value }
    if targetSum == 0 { return true }
    if targetSum < 0 { return false }
    for num in array {
        let remainder = targetSum - num
        if num <= targetSum,optimalCanSum(remainder, array) {
            sumExists[targetSum] = true
            return true
        }
    }
    sumExists[targetSum] = false
    return false
}

print("Initial: \(initialCanSum(7, [2,3]))") // true
print("Initial: \(initialCanSum(7, [5,3,4,7]))") // true
print("Initial: \(initialCanSum(7, [2,4]))") // false
print("Initial: \(initialCanSum(8, [2,3,5]))") // true
//print("Initial: \(initialCanSum(300, [7,14]))") // false -> DO NOT RUN IN BRUTE FORCE METHOD
print("\n")

print("Optimal: \(optimalCanSum(7, [2,3]))") // true
sumExists = [:]
print("Optimal: \(optimalCanSum(7, [5,3,4,7]))") // true
sumExists = [:]
print("Optimal: \(optimalCanSum(7, [2,4]))") // false
sumExists = [:]
print("Optimal: \(optimalCanSum(8, [2,3,5]))") // true
sumExists = [:]
print("Optimal: \(optimalCanSum(300, [7,14]))") // false
