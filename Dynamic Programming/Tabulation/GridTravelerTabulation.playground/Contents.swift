import UIKit

func gridTraveler(m: Int, n: Int) -> Int {
    var arr = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    // Set base case:
    arr[1][1] = 1
    for i in 0...m {
        for j in 0...n {
            let currentVal = arr[i][j]
            if (j + 1 <= n) { arr[i][j + 1] = arr[i][j + 1] + currentVal } // Update right
            if (i + 1 <= m) { arr[i + 1][j] = arr[i + 1][j] + currentVal } // Update down
        }
    }
    return arr[m][n]
}

print(gridTraveler(m: 1, n: 1)) // 1
print(gridTraveler(m: 2, n: 3)) // 3
print(gridTraveler(m: 3, n: 2)) // 3
print(gridTraveler(m: 3, n: 3)) // 6
print(gridTraveler(m: 18, n: 18)) // 2333606220
