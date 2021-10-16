import UIKit

func hasSum(_ target: Int, _ array: [Int]) -> [Int]? {
    var table: [[Int]?] = Array(repeating: nil, count: target + 1)
    table[0] = []
    
    for i in 0...target {
        if table[i] != nil {
            for num in array {
                if i + num <= target {
                    table[i + num] = table[i]
                    table[i + num]?.append(num)
                }
            }
        }
    }
    return table[target]
}

print(String(describing: hasSum(7, [2,3])))
print(String(describing: hasSum(7, [5,3,4,7])))
print(String(describing: hasSum(7, [2,4])))
print(String(describing: hasSum(8, [2,3,5])))
print(String(describing: hasSum(300, [7,14])))
