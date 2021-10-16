import UIKit

func bestSum(_ target: Int, _ array: [Int]) -> [Int]? {
    var table: [[Int]?] = Array(repeating: nil, count: target + 1)
    table[0] = []
    
    for i in 0...target {
        if table[i] != nil {
            for num in array {
                if i + num <= target {
                    if table[i + num] == nil || (table[i + num]!.count > (table[i]!.count + 1)) {
                        table[i + num] = table[i]
                        table[i + num]?.append(num)
                    }
                }
            }
        }
    }
    return table[target]
}

print(String(describing: bestSum(7, [5,3,4,7])))
print(String(describing: bestSum(8, [2,3,5])))
print(String(describing: bestSum(8, [1,4,5])))
print(String(describing: bestSum(100, [1,2,5,25])))
