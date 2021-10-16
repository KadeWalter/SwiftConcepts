import UIKit

func initialBestSum(_ targetSum: Int, _ array: [Int]) -> [Int]? {
    if targetSum == 0 { return [] }
    if targetSum < 0 { return nil }
    
    var shortestCombo: [Int]?
    for num in array {
        let remainder = targetSum - num
        if num <= targetSum, var arr = initialBestSum(remainder, array) {
            arr.append(num)
            if let shortestSoFar = shortestCombo, arr.count < shortestSoFar.count {
                shortestCombo = arr
            } else if shortestCombo == nil {
                shortestCombo = arr
            }
        }
    }
    return shortestCombo
}

var sumsExist: [Int : [Int]?] = [:]
func optimalBestSum(_ targetSum: Int, _ array: [Int]) -> [Int]? {
    if let value = sumsExist[targetSum] { return value }
    else if sumsExist[targetSum] == .some(nil) { return nil }
    if targetSum == 0 { return [] }
    if targetSum < 0 { return nil }
    
    var shortestCombo: [Int]?
    for num in array {
        let remainder = targetSum - num
        if num <= targetSum, var arr = optimalBestSum(remainder, array) {
            arr.append(num)
            if shortestCombo == nil {
                shortestCombo = arr
            } else if let shortestSoFar = shortestCombo, arr.count < shortestSoFar.count {
                shortestCombo = arr
            }
        }
    }
    
    sumsExist[targetSum] = shortestCombo
    return shortestCombo
}

print("Initial: \(String(describing: initialBestSum(7, [5,3,4,7])))") // [7]
print("Initial: \(String(describing: initialBestSum(8, [2,3,5])))") // [3,5]
print("Initial: \(String(describing: initialBestSum(8, [1,4,5])))") // [4,4]
//print("Initial: \(String(describing: initialBestSum(100, [1,2,5,25])))") // [25,25,25,25]
print("\n")

print("Optimal: \(String(describing: optimalBestSum(7, [5,3,4,7])))") // [7]
sumsExist = [:]
print("Optimal: \(String(describing: optimalBestSum(8, [2,3,5])))") // [3,5]
sumsExist = [:]
print("Optimal: \(String(describing: optimalBestSum(8, [1,4,5])))") // [4,4]
sumsExist = [:]
print("Optimal: \(String(describing: optimalBestSum(100, [1,2,5,25])))") // [25,25,25,25]
