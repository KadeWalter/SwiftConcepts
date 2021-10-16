import UIKit

func fib(n: Int) -> Int {
    // Base cases with quick return.
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    var arr: [Int] = [0, 1]
    for i in 2...n {
        let val1 = arr[i - 1]
        let val2 = arr[i - 2]
        arr.append(val1 + val2)
    }
    
    return arr[n]
}

print(fib(n: 6))
print(fib(n: 7))
print(fib(n: 8))
print(fib(n: 50))
