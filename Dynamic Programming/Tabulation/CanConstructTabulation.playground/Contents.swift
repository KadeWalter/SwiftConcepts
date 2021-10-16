import UIKit

func canConstruct(_ target: String, _ wordBank: [String]) -> Bool {
    let tarSize = target.count
    var table = Array(repeating: false, count: tarSize + 1)
    
    for i in 0...tarSize {
        for word in wordBank {
            if target.hasPrefix(word), word.count + i <= tarSize  {
                table[word.count + i] = true
            }
        }
    }
    return table[tarSize]
}

print(canConstruct("abcdef", ["ab", "abc", "cd", "def", "abcd"]))
