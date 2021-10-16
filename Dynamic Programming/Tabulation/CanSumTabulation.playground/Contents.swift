import UIKit

func canSum(_ target: Int, _ array: [Int]) -> Bool {
    var table = Array(repeating: false, count: target + 1)
    table[0] = true
    for i in 0...target {
        if table[i] {
            for num in array {
                if i + num <= target {
                    table[i + num] = true
                }
            }
        }
    }
    return table[target]
}

print(canSum(7, [2,3]))
print(canSum(7, [5,3,4,7]))
print(canSum(7, [2,4]))
print(canSum(8, [2,3,5]))
print(canSum(300, [7,14]))
