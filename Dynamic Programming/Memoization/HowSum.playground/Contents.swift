import UIKit

func initialHowSum(_ targetSum: Int, _ array: [Int]) -> [Int]? {
    if targetSum == 0 { return [] }
    if targetSum < 0 { return nil }
    
    for num in array {
        let remainder = targetSum - num
        if num <= targetSum, var arr = initialHowSum(remainder, array) {
            arr.append(num)
            return arr
        }
    }
    return nil
}

var sumsExist: [Int : [Int]?] = [:]
func optimalHowSum(_ targetSum: Int, _ array: [Int]) -> [Int]? {
    if let value = sumsExist[targetSum] { return value }
    else if sumsExist[targetSum] == .some(nil) { return nil }
    if targetSum == 0 { return [] }
    if targetSum < 0 { return nil }
    
    for num in array {
        let remainder = targetSum - num
        if num <= targetSum, var arr = optimalHowSum(remainder, array) {
            arr.append(num)
            sumsExist[targetSum] = arr
            return arr
        }
    }
    sumsExist[targetSum] = .some(nil)
    return nil
}

print("Initial: \(String(describing: initialHowSum(7, [2,3])))") // [3, 2, 2]
print("Initial: \(String(describing: initialHowSum(7, [5,3,4,7])))") // [4,3]
print("Initial: \(String(describing: initialHowSum(7, [2,4])))") // null
print("Initial: \(String(describing: initialHowSum(8, [2,3,5])))") // [2,2,2,2]
//print("Initial: \(String(describing: initialHowSum(300, [7, 14])))") // null -> DONT BRUTE FORCE
print("\n")

print("Optimal: \(String(describing: optimalHowSum(7, [2,3])))") // [3, 2, 2]
sumsExist = [:]
print("Optimal: \(String(describing: optimalHowSum(7, [5,3,4,7])))") // [4,3]
sumsExist = [:]
print("Optimal: \(String(describing: optimalHowSum(7, [2,4])))") // null
sumsExist = [:]
print("Optimal: \(String(describing: optimalHowSum(8, [2,3,5])))") // [2,2,2,2]
sumsExist = [:]
print("Optimal: \(String(describing: optimalHowSum(300, [7, 14])))") // null
